package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.bean.Manager;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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
            model.addAttribute("manager_message","用户名错误！");
            return "managerlogin";
        }else if (!passwordConfirm(manager.getPassword(),password)){
            model.addAttribute("manager_message","密码错误！");
            return "managerlogin";
        }else if (passwordConfirm(manager.getPassword(),password)){
            session.setAttribute("manager",manager);
            /*
            管理员登录成功进入后台管理页面
             */
            return getGeneralSituation(model);
        }else {
            return "managerlogin";
        }

    }



    //管理员注销
    @RequestMapping("/manage/logout")
    public String logout(HttpSession session){
        session.setAttribute("manager",null);
        return "managerlogin";
    }

    //订单管理
    @RequestMapping("/manage/order")
    public String order(Model model){
        List<Order> orders = managerMapper.selectAllOrder();
        model.addAttribute("");
    }

    //用户管理
    @RequestMapping("/manage/member")
    public String managemember(Model model){
        List<Member> members = managerMapper.selectAllMember();
        model.addAttribute("memberlist",members);
        return "membermanage";
    }

    //商品管理
    @RequestMapping("/manage/wtsitem")
    public String managewtsitem(Model model){
        List<Item> items = managerMapper.selectAllSellItems();
        model.addAttribute("itemlist",items);
        return "itemmanage";
    }

    @RequestMapping("/manage/wtbitem")
    public String managewtbitem(Model model){
        List<Item> items = managerMapper.selectAllBuyItems();
        model.addAttribute("itemlist",items);
        return "itemmanage";
    }

    //下架商品
    @RequestMapping("/manage/offitem")
    public String offitem(Model model,String item_id){
        managerMapper.offItem(item_id);
        List<Item> items = managerMapper.selectAllSellItems();
        model.addAttribute("itemlist",items);
        return "itemmanage";
    }

    //查看平台概况
    @RequestMapping("/manage/gen_sit")
    public String general_situation(Model model){
        return getGeneralSituation(model);
    }

    //禁用用户
    @RequestMapping("/manage/shutmember")
    public String shutmember(Model model, String sid){
        managerMapper.shutMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        model.addAttribute("memberlist",members);
        return "membermanage";
    }

    //启用用户
    @RequestMapping("/manage/activemember")
    public String activemember(Model model, String sid){
        managerMapper.activeMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        model.addAttribute("memberlist",members);
        return "membermanage";
    }

    //统计平台概况
    private String getGeneralSituation(Model model) {
        Integer member_sum = managerMapper.countMember();
        Integer countItemWtbOnCarriiage = managerMapper.countItemWtbOnCarriiage();
        Integer countItemWtsOnCarriiage = managerMapper.countItemWtsOnCarriiage();
        Integer orderedToday = managerMapper.orderedToday();
        model.addAttribute("member_sum",member_sum);
        model.addAttribute("item_wts_sum",countItemWtsOnCarriiage);
        model.addAttribute("item_wtb_sum",countItemWtbOnCarriiage);
        model.addAttribute("order_today",orderedToday);
        return "backstage";
    }
}
