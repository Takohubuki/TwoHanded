package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.MemberMapper;
import com.zdh.mappers.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    MemberMapper memberMapper;

    @Autowired
    ItemMapper itemMapper;

    /*
    用户登录模块
     */
    @RequestMapping("/signin")
    public ModelAndView signin(String username, String password, HttpSession session, HttpServletRequest request) {
        System.out.println("--------------------开始登录-----------------");
//        String uri = request.getRequestURI();
//        System.out.println(uri);
        String uri = request.getHeader("Referer");
        String method = request.getMethod();
        Map cart_list = (HashMap) session.getAttribute("cart_list");

//        session.setAttribute("redirectUri",uri);
        if (uri.contains("signin")){
            uri = "/index.jsp";
        }
        ModelAndView modelAndView = new ModelAndView();
        Member member = memberMapper.selectByName(username);
        if (member == null){
            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名错误！");
            return modelAndView;
        }else if (!passwordConfirm(member.getPassword(),password)){

            modelAndView.setViewName("login");
            modelAndView.addObject("message","密码错误！");
            return modelAndView;
        }else if (passwordConfirm(member.getPassword(),password)){

            /*
            用户登录成功返回上一个请求
            并记录最近登录时间
             */
            System.out.println("redirect:"+uri);
            modelAndView.setViewName("redirect:"+uri);
            Date date = new Date();
            member.setRecent_login(date);
            memberMapper.updateRecentLogin(member);
            session.setAttribute("member",member);
            return modelAndView;
        }else {
            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名或密码错误！");
            return modelAndView;
        }
    }


    @RequestMapping("/signup")
    /*
    用户注册模块
     */
    public String signup(Member member, HttpSession session, Model model, HttpServletRequest request){
        System.out.println("-----------------------开始注册------------------------");
        /*
        将新用户的信息分别存入member表和seller表中
        密码经过md5加密之后存入数据库中
         */
//        Member members = new Member(member.getSid(), member.getUsername(),DigestUtils.md5DigestAsHex(member.getPassword().getBytes()), member.getPhone(), member.getDormitory());
        String uri = request.getHeader("Referer");

        String password = member.getPassword();
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        member.setPassword(s);
        memberMapper.insert(member);
        System.out.println("-----------------------注册成功-----------------------------");
        session.setAttribute("member",member);
        return "redirect:"+uri;

    }

    /*
    用户登出模块
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request){
        session.setAttribute("member",null);
        String uri = request.getHeader("Referer");
        if (uri.contains("singleitem") || uri.contains("queryalltime") || uri.contains("wtbitem"))
        {
            return "redirect:"+uri;
        }else {
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping("/allorder")
    public String allorder(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Order> orderList = orderMapper.selectMyOrder(sid);
        for (int i = 0; i < orderList.size()-1; i++) {
            Order order_pre = orderList.get(i);
            for (int j = i+1; j < orderList.size(); j++) {
                Order order_nex = orderList.get(j);
                //判断是否属于同一个订单
                if (order_pre.getOrder_id().equals(order_nex.getOrder_id())){
                    //合并属于同一个订单的商品
                    Item item_1 = itemMapper.selectBySerialNum(order_pre.getItem_id());
                    Item item_2 = itemMapper.selectBySerialNum(order_nex.getItem_id());
                    List<Item> item_list = order_pre.getItem_list();
                    item_list.add(item_1);
                    item_list.add(item_2);
                    order_pre.setItem_list(item_list);

                    Map num2item = order_pre.getNum2item();
                    num2item.put(order_pre.getItem_id(),order_pre.getItem_num());
                    num2item.put(order_nex.getItem_id(),order_nex.getItem_num());
                    order_pre.setNum2item(num2item);

                }
            }
            orderList.set(i,order_pre);
        }
        for (int i = 0; i < orderList.size() - 1; i++) {
            for (int j = i + 1; j < orderList.size(); j++) {
                if (orderList.get(i) == orderList.get(j)){
                    orderList.remove(j);
                }
            }
        }
        model.addAttribute("my_order_list",orderList);
        return "allorder";
    }

    //跳转用户个人中心页面
    @RequestMapping("/profile")
    public String profile(){
        return "profile";
    }

    @RequestMapping("/publish/wts")
    public String publishwts(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Item> myWts = memberMapper.selectMyWts(sid);
        model.addAttribute("mywts",myWts);
        return "publishwts";
    }

    @RequestMapping("/publish/wtb")
    public String publishwtb(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Item> myWtb = memberMapper.selectMyWtb(sid);
        model.addAttribute("mywtb",myWtb);
        return "publishwtb";
    }

    @RequestMapping("/updateprofile")
    public String updateprofile(Model model){

        return "updateprofile";
    }

    @Transactional
    @RequestMapping("/update/profile")
    public String upprofile(Member member, HttpSession session, @RequestParam("imagefile") MultipartFile file,HttpServletRequest request) throws IOException {

        Member member_old = (Member) session.getAttribute("member");
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/images/avatar/");

            System.out.println(path);
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            //输出文件上传最终的路径 测试查看
            System.out.println(path + File.separator + filename);

            member.setAvatar(filename);
        }else{
            member.setAvatar(member_old.getAvatar());
        }
        String password = member_old.getPassword();
        member.setPassword(password);

        session.setAttribute("member",member);
        try {
            if (member_old.getSid() != member.getSid()){
                itemMapper.updatePublisherByName(member_old.getSid(),member.getSid());
            }
            memberMapper.updateProfile(member);

        }catch (Exception e){
            System.out.println("error!rollback!");
        }

        return "profile";
    }
    //密码验证
    static boolean passwordConfirm(String password1, String password2){
        //将输入的密码转化成md5的形式与数据库中存储的md5进行对比

        String md5 = DigestUtils.md5DigestAsHex(password2.getBytes());

        if (password1.equals(md5)){
            return true;
        }else{
            return false;
        }
    }


}
