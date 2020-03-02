package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.mappers.ManagerMapper;
import com.zdh.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

public class ManagerController {
    @Autowired
    ManagerMapper managerMapper;

    @Resource
    ManagerService managerService;

    @RequestMapping("/managerlogin")
    public String mamager(){
        return "managerLogin";
    }


    /**
     * 管理员登录
     * @param username
     * @param password
     * @param modelAndView
     * @param session
     * @return
     */
    @RequestMapping("/manage/login")
    public ModelAndView login(String username, String password, ModelAndView modelAndView, HttpSession session){
        return managerService.login(username, password, modelAndView, session);
    }


    /**
     * 管理员注销
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/logout")
    public ModelAndView logout(HttpSession session, ModelAndView modelAndView){
        return managerService.logout(session, modelAndView);
    }

    /**
     * 订单管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/order")
    public ModelAndView order(ModelAndView modelAndView){
        return managerService.order(modelAndView);
    }

    /**
     * 用户管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/member")
    public ModelAndView manageMember(ModelAndView modelAndView){
        List<Member> members = managerMapper.selectAllMember();
        modelAndView.addObject("memberlist",members);
        modelAndView.setViewName("memberManage");
        return modelAndView;
    }

    /**
     * 商品管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/wtsitem")
    public ModelAndView manageWtsItem(ModelAndView modelAndView){
        List<Item> items = managerMapper.selectAllSellItems();
        modelAndView.addObject("itemlist",items);
        modelAndView.setViewName("itemManage");
        return modelAndView;
    }

    /**
     * 查看平台概况
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/gen_sit")
    public ModelAndView generalSituation(ModelAndView modelAndView){
        return managerService.generalSituation(modelAndView);
    }

    // TODO: 2020/2/24 以下基本需要重写方法
    /**
     * 管理求购信息
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/wtbitem")
    public ModelAndView manageWtbItem(ModelAndView modelAndView){
        List<Item> items = managerMapper.selectAllBuyItems();
        modelAndView.addObject("itemlist",items);
        modelAndView.setViewName("itemManage");
        return modelAndView;
    }

    /**
     * 下架商品
     * @param modelAndView
     * @param itemId
     * @return
     */
    @RequestMapping("/manage/offitem")
    public ModelAndView offItem(ModelAndView modelAndView, String itemId){
        managerMapper.offItem(itemId);
        List<Item> items = managerMapper.selectAllSellItems();
        modelAndView.addObject("itemlist",items);
        modelAndView.setViewName("itemManage");
        return modelAndView;
    }


    /**
     * 封禁用户
     * @param modelAndView
     * @param sid
     * @return
     */
    @RequestMapping("/manage/shutmember")
    public ModelAndView shutMember(ModelAndView modelAndView, String sid){
        managerMapper.shutMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        modelAndView.addObject("memberlist",members);
        modelAndView.setViewName("memberManage");
        return modelAndView;
    }

    /**
     * 解封用户
     * @param modelAndView
     * @param sid
     * @return
     */
    @RequestMapping("/manage/activemember")
    public ModelAndView activeMember(ModelAndView modelAndView, String sid){
        managerMapper.activeMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        modelAndView.addObject("memberlist",members);
        modelAndView.setViewName("memberManage");
        return modelAndView;
    }

}
