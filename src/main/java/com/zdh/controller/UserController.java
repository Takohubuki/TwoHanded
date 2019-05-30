package com.zdh.controller;

import com.sun.deploy.net.HttpResponse;
import com.zdh.bean.Buyer;
import com.zdh.bean.Manager;
import com.zdh.bean.Members;
import com.zdh.bean.Seller;
import com.zdh.mappers.BuyerMapper;
import com.zdh.mappers.ManagerMapper;
import com.zdh.mappers.MembersMapper;
import com.zdh.mappers.SellerMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    BuyerMapper buyerMapper;

    @Autowired
    SellerMapper sellerMapper;

    @Autowired
    ManagerMapper managerMapper;

    /*
    用户登录模块
     */
    @RequestMapping("/signin")
    public String signin(String username, String password, String type, Model model, HttpSession session) throws IOException {
        System.out.println("--------------------开始登录-----------------");
        /*
        判断用户登录类型
         */
        switch (type){
            case "用户":
                Buyer buyer = buyerMapper.selectByName(username);
                if (buyer == null){
                    model.addAttribute("message","用户名错误！");
                    return "login";
                }else if (!passwordConfirm(buyer.getPassword(),password)){
                    model.addAttribute("message","密码错误！");
                    return "login";
                }else if (passwordConfirm(buyer.getPassword(),password)){
                    session.setAttribute("member",buyer);
                    /*
                    用户登录成功返回首页
                     */
                    return "redirect:/index.jsp";
                }else {

                    return "login";
                }
            case "管理员":
                Manager manager = managerMapper.selectByName(username);
                if (manager == null){
                    model.addAttribute("message","用户名错误！");
                    return "login";
                }else if (!passwordConfirm(manager.getPassword(),password)){
                    model.addAttribute("message","密码错误！");
                    return "login";
                }else if (passwordConfirm(manager.getPassword(),password)){
                    session.setAttribute("manager",manager);
                    /*
                    管理员登录成功进入后台管理页面
                     */

                    return "backstage";
                }else {
                    return "login";
                }
            default:
                model.addAttribute("message","请选择用户或管理员！");
                return "login";
        }

    }

    @RequestMapping("/login")
    public String login(){
        System.out.println("----------------------转到登录页面------------------------");
        return "login";
    }

    @RequestMapping("/register")
    public String register(){
        System.out.println("---------------------转到注册页面------------------------");
        return "register";
    }

    @RequestMapping("/signup")
    /*
    用户注册模块
     */
    public String signup(Members members, HttpSession session, Model model){
        System.out.println("-----------------------开始注册------------------------");
        /*
        将新用户的信息分别存入buyer表和seller表中
        密码经过md5加密之后存入数据库中
         */
        Buyer buyer = new Buyer(members.getUserId(), members.getUsername(),DigestUtils.md5DigestAsHex(members.getPassword().getBytes()), members.getPhoneNum(), members.getDormitory());
        Seller seller = new Seller(members.getUserId(), members.getUsername(),DigestUtils.md5DigestAsHex(members.getPassword().getBytes()), members.getPhoneNum(), members.getDormitory());
        buyerMapper.insert(buyer);
        sellerMapper.insert(seller);
        System.out.println("-----------------------注册成功-----------------------------");
        session.setAttribute("member",members);
        return "redirect:/index.jsp";

    }

    /*
    用户登出模块
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.setAttribute("member",null);
        return "redirect:/index.jsp";
    }




    //密码验证
    private static boolean passwordConfirm(String password1, String password2){
        //将输入的密码转化成md5的形式与数据库中存储的md5进行对比

        String md5 = DigestUtils.md5DigestAsHex(password2.getBytes());

        if (password1.equals(md5)){
            return true;
        }else{
            return false;
        }
    }


}
