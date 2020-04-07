package com.zdh.controller;

import com.zdh.service.ManagerService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@RestController

public class ManagerController {

    @Resource
    ManagerService managerService;

    @RequestMapping("/managerlogin")
    public ModelAndView manager(ModelAndView modelAndView) {
        modelAndView.setViewName("managerLogin");
        return modelAndView;
    }

    @RequestMapping("/manage/approval")
    public ModelAndView approval(ModelAndView modelAndView) {
        return managerService.approval(modelAndView);
    }

    /**
     * 管理员登录
     *
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
    @RequestMapping("/manage/manageOrder")
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
        return managerService.manageMember(modelAndView);
    }

    /**
     * 商品管理
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/wtsitem")
    public ModelAndView manageWtsItem(ModelAndView modelAndView){
        return managerService.manageWtsItem(modelAndView);
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

    /**
     * 管理求购信息
     * @param modelAndView
     * @return
     */
    @RequestMapping("/manage/wtbitem")
    public ModelAndView manageWtbItem(ModelAndView modelAndView){
        return managerService.manageWtbItem(modelAndView);
    }

    /**
     * 下架商品
     * @param modelAndView
     * @param itemId
     * @return
     */
    @RequestMapping("/manage/offitem")
    public ModelAndView offItem(ModelAndView modelAndView, String itemId){
        return managerService.offItem(modelAndView, itemId);
    }


    /**
     * 封禁用户
     * @param modelAndView
     * @param sid
     * @return
     */
    @RequestMapping("/manage/shutmember")
    public ModelAndView shutMember(ModelAndView modelAndView, String sid){
        return managerService.shutMember(modelAndView, sid);
    }

    /**
     * 解封用户
     *
     * @param modelAndView
     * @param sid
     * @return
     */
    @RequestMapping("/manage/activemember")
    public ModelAndView activeMember(ModelAndView modelAndView, String sid) {
        return managerService.activeMember(modelAndView, sid);
    }

    @RequestMapping("/manage/accessInfo")
    public String accessInfo(String id) {
        return managerService.accessInfo(id);
    }

}
