package com.zdh.controller;

import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.OrderMapper;
import com.zdh.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    OrderMapper orderMapper;

    @Resource
    MemberService memberService;

    /**
     * 用户登录
     * @param username
     * @param password
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    @RequestMapping("/signin")
    public ModelAndView signIn(String username, String password, HttpSession session, HttpServletRequest request, ModelAndView modelAndView) {
        return memberService.login(username, password, session, request, modelAndView);
    }

    /**
     * 用户注册
     * @param member
     * @param session
     * @param modelAndView
     * @param request
     * @return
     */
    @RequestMapping("/signup")
    public ModelAndView signUp(Member member, HttpSession session, ModelAndView modelAndView, HttpServletRequest request){
        return memberService.signUp(member, session, modelAndView, request);
    }

    /**
     * 用户注销
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session, HttpServletRequest request, ModelAndView modelAndView){
        return memberService.logout(session, request, modelAndView);
    }

    // TODO: 2020/2/21 需要继续编写
    @RequestMapping("/allorder")
    public String allorder(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Order> orderList = orderMapper.selectMyOrder(sid);
//        for (int i = 0; i < orderList.size()-1; i++) {
//            Order order_pre = orderList.get(i);
//            for (int j = i+1; j < orderList.size(); j++) {
//                Order order_nex = orderList.get(j);
//                //判断是否属于同一个订单
//                if (order_pre.getOrder_id().equals(order_nex.getOrder_id())){
//                    //合并属于同一个订单的商品
//                    Item item_1 = itemMapper.selectBySerialNum(order_pre.getItem_id());
//                    Item item_2 = itemMapper.selectBySerialNum(order_nex.getItem_id());
//                    List<Item> item_list = order_pre.getItem_list();
//                    item_list.add(item_1);
//                    item_list.add(item_2);
//                    order_pre.setItem_list(item_list);
//
//                    Map num2item = order_pre.getNum2item();
//                    num2item.put(order_pre.getItem_id(),order_pre.getItem_num());
//                    num2item.put(order_nex.getItem_id(),order_nex.getItem_num());
//                    order_pre.setNum2item(num2item);
//
//                }
//            }
//            orderList.set(i,order_pre);
//        }
//        for (int i = 0; i < orderList.size() - 1; i++) {
//            for (int j = i + 1; j < orderList.size(); j++) {
//                if (orderList.get(i) == orderList.get(j)){
//                    orderList.remove(j);
//                }
//            }
//        }
        model.addAttribute("my_order_list",orderList);
        return "allOrder";
    }

    /**
     * 转跳用户个人中心
     * @return
     */
    @RequestMapping("/profile")
    public String profile(){
        return "profile";
    }


    /**
     * 用户发布出售商品信息
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/publish/wts")
    public ModelAndView publishWts(HttpSession session, ModelAndView modelAndView){
        return memberService.publishWts(session, modelAndView);
    }


    /**
     * 用户发布求购商品信息
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/publish/wtb")
    public ModelAndView publishWtb(HttpSession session, ModelAndView modelAndView){
        return memberService.publishWtb(session, modelAndView);
    }

    @RequestMapping("/updateprofile")
    public String updateProfile(){
        return "updateProfile";
    }

    /**
     * 更新用户资料
     * @param member
     * @param session
     * @param file
     * @param request
     * @param modelAndView
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("/update/profile")
    public ModelAndView upProfile(Member member, HttpSession session, @RequestParam("imagefile") MultipartFile file, HttpServletRequest request, ModelAndView modelAndView) throws IOException {
        return memberService.upProfile(member, session, file, request, modelAndView);
    }

}
