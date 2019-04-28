package com.zdh.controller;

import com.sun.deploy.net.HttpResponse;
import com.zdh.bean.Buyer;
import com.zdh.bean.Manager;
import com.zdh.bean.Members;
import com.zdh.mappers.BuyerMapper;
import com.zdh.mappers.ManagerMapper;
import com.zdh.mappers.MembersMapper;
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
public class LoginController {

    @Autowired
    BuyerMapper buyerMapper;

    @Autowired
    ManagerMapper managerMapper;

    @RequestMapping("/signin")
    public String signin(String username, String password, String type, Model model, HttpSession session) throws IOException {
        System.out.println("--------------------开始登录-----------------");
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
                    return "success";
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
    public String signup(Members members, HttpSession session, Model model){
        System.out.println("-----------------------注册成功------------------------");

        return "success";

    }






    //密码验证
    private static boolean passwordConfirm(String password1, String password2){
        //将输入的密码转化成md5的形式与数据库中存储的md5进行对比
        String md5_1= DigestUtils.md5DigestAsHex(password1.getBytes());

        String md5_2 = DigestUtils.md5DigestAsHex(password2.getBytes());

        if (md5_1.equals(md5_2)){
            return true;
        }else{
            return false;
        }
    }


}
