package com.zdh.controller;

import com.alibaba.fastjson.JSON;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.service.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@RestController

public class ManagerController {

    @Resource
    ManagerService managerService;

    @Resource
    private ScheduledTaskService scheduledTaskService;

    @Resource
    private ItemService itemService;

    @Resource
    private MemberService memberService;

    @Resource
    private OrderService orderService;


    @RequestMapping("/managerlogin")
    public ModelAndView manager(ModelAndView modelAndView) {
        modelAndView.setViewName("manage/login");
        return modelAndView;
    }

    @RequestMapping("/manage/approval")
    public ModelAndView approval(ModelAndView modelAndView) {
        return managerService.approval(modelAndView);
    }

    @RequestMapping("/manage/memberIdentificationInfo")
    public ModelAndView memberIdentificationInfo() {
        List<Member> unidentifiedMember = memberService.getUnidentifiedMember();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("memberInfoList", unidentifiedMember);
        modelAndView.setViewName("manage/identifyMember");
        return modelAndView;
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
    @RequestMapping("/manage/shutMember")
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
    @RequestMapping("/manage/activeMember")
    public ModelAndView activeMember(ModelAndView modelAndView, String sid) {
        return managerService.activeMember(modelAndView, sid);
    }
    @RequestMapping("/manage/delMember")
    public ModelAndView delMember(ModelAndView modelAndView, String sid) {
        return managerService.delMember(modelAndView, sid);
    }

    @RequestMapping("/manage/accessInfo")
    public String accessInfo(String id) {
        return managerService.accessInfo(id);
    }

    @RequestMapping("/manage/denyInfo")
    public String denyInfo(String id, String reason) {
        return managerService.denyInfo(id, reason);
    }

    @RequestMapping(path = "/manage/itemKind", produces = {"application/json;charset=UTF-8"})
    public String itemKind() {
        return managerService.itemKindManage();
    }

    @RequestMapping(path = "/manage/addItemKind", produces = {"application/json;charset=UTF-8"})
    public String addItemKind(String newKind) {
        return managerService.addItemKind(newKind);
    }

    @RequestMapping("/manage/delOrderSwitch")
    public void delOrderSwitch(String flag) {
        scheduledTaskService.switchDelOrder("delOrder", flag);
    }

    @RequestMapping(path = "/manage/manageWtsByKind", produces = {"application/json;charset=UTF-8"})
    public String manageWtsByKind(String[] kindList) {
        List<Item> itemByKind;
        if (kindList == null) {
            itemByKind = itemService.selectWtsAllByTime();
        } else {
            itemByKind = itemService.getItemByKind(kindList);
        }
        return JSON.toJSONString(itemByKind);
    }

    @RequestMapping(path = "/manage/manageWtsByTime", produces = {"application/json;charset=UTF-8"})
    public String manageWtsByTime(String startTime, String endTime) throws ParseException {
        List<Item> itemList = itemService.manageWtsByTime(startTime, endTime);
        return JSON.toJSONString(itemList);
    }

    @RequestMapping(path = "/manage/manageWtsByKindAndTime", produces = {"application/json;charset=UTF-8"})
    public String manageWtsByKindAndTime(String startTime, String endTime, String[] kindList) throws ParseException {
        List<Item> itemList = itemService.manageWtsByKindAndTime(startTime, endTime, kindList);
        return JSON.toJSONString(itemList);
    }

    @RequestMapping(path = "/manage/orderCount", produces = {"application/json;charset=UTF-8"})
    public String orderCount(String time) throws ParseException {
        return managerService.orderCount(time);
    }

    @RequestMapping(path = "/manage/manageWtbByTime", produces = {"application/json;charset=UTF-8"})
    public String manageWtbByTime(String startTime, String endTime) throws ParseException {
        List<Item> itemList = itemService.manageWtbByTime(startTime, endTime);
        return JSON.toJSONString(itemList);
    }

    @RequestMapping(path = "/manage/manageOrderByTime", produces = {"application/json;charset=UTF-8"})
    public String manageOrderByTime(String startTime, String endTime) throws ParseException {
        List<Order> orderList = orderService.manageOrderByTime(startTime, endTime);
        return JSON.toJSONString(orderList);
    }


}
