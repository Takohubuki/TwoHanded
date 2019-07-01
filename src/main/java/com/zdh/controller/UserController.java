package com.zdh.controller;

import com.zdh.bean.Member;
import com.zdh.mappers.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    MemberMapper memberMapper;



    /*
    用户登录模块
     */
    @RequestMapping("/signin")
    public ModelAndView signin(String username, String password, HttpSession session, HttpServletRequest request) throws IOException {
        System.out.println("--------------------开始登录-----------------");
        String uri = request.getRequestURI();
        System.out.println(uri);
        ModelAndView modelAndView = new ModelAndView();
        Member member = memberMapper.selectByName(username);
        if (member == null){
            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名错误！");
            return modelAndView;
        }else if (!passwordConfirm(member.getPassword(),password)){
//            modelAndView.addAttribute("message","密码错误！");
//            return "login";
            modelAndView.setViewName("login");
            modelAndView.addObject("message","密码错误！");
            return modelAndView;
        }else if (passwordConfirm(member.getPassword(),password)){
            session.setAttribute("member",member);
            /*
            用户登录成功返回首页
             */
            modelAndView.setViewName("redirect:/index.jsp");
            return modelAndView;
        }else {
            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名或密码错误！");
            return modelAndView;
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
    public String signup(Member member, HttpSession session, Model model){
        System.out.println("-----------------------开始注册------------------------");
        /*
        将新用户的信息分别存入member表和seller表中
        密码经过md5加密之后存入数据库中
         */
//        Member members = new Member(member.getSid(), member.getUsername(),DigestUtils.md5DigestAsHex(member.getPassword().getBytes()), member.getPhone(), member.getDormitory());
        String password = member.getPassword();
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        member.setPassword(s);
        memberMapper.insert(member);
        System.out.println("-----------------------注册成功-----------------------------");
        session.setAttribute("member",member);
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
