package com.zdh.controller;

import com.zdh.bean.Manager;
import com.zdh.mappers.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import static com.zdh.controller.UserController.passwordConfirm;

@Controller

public class ManagerController {
    @Autowired
    ManagerMapper managerMapper;

    @RequestMapping("/managerlogin")
    public String mamager(){
        return "managerlogin";
    }


    //管理员登录
    @RequestMapping("/manage/login")
    public String login(String username, String password, Model model, HttpSession session){
        Manager manager = managerMapper.selectByName(username);
        if (manager == null){
            model.addAttribute("message","用户名错误！");
            return "managerlogin";
        }else if (!passwordConfirm(manager.getPassword(),password)){
            model.addAttribute("message","密码错误！");
            return "managerlogin";
        }else if (passwordConfirm(manager.getPassword(),password)){
            session.setAttribute("manager",manager);
            /*
            管理员登录成功进入后台管理页面
             */

            return "backstage";
        }else {
            return "managerlogin";
        }

    }
    @RequestMapping("/manage/logout")
    public String logout(HttpSession session){
        session.setAttribute("manager",null);
        return "managelogin";
    }

}
