package com.zdh.service;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.ParseException;

public interface ManagerService {

    /**
     * 管理员登录
     * @param username
     * @param password
     * @param modelAndView
     * @param session
     * @return
     */
    public ModelAndView login(String username, String password, ModelAndView modelAndView, HttpSession session);

    /**
     *
     * @param session
     * @param modelAndView
     * @return
     */
    public ModelAndView logout(HttpSession session, ModelAndView modelAndView);

    /**
     * 获取订单管理信息
     * @param modelAndView
     * @return
     */
    public ModelAndView order(ModelAndView modelAndView);

    /**
     * 获取平台概况
     * @param modelAndView
     * @return
     */
    public ModelAndView generalSituation(ModelAndView modelAndView);

    public ModelAndView manageMember(ModelAndView modelAndView);

    public ModelAndView manageWtsItem(ModelAndView modelAndView);

    public ModelAndView manageWtbItem(ModelAndView modelAndView);

    public ModelAndView offItem(ModelAndView modelAndView, String itemId);

    public ModelAndView shutMember(ModelAndView modelAndView, String sid);

    public ModelAndView activeMember(ModelAndView modelAndView, String sid);

    ModelAndView approval(ModelAndView modelAndView);

    String accessInfo(String id);

    String denyInfo(String id, String reason);

    String itemKindManage();

    String addItemKind(String newKind);

    String orderCount(String time) throws ParseException;

    ModelAndView delMember(ModelAndView modelAndView, String sid);

    String identifyMember(String userId);

    String denyIdentifyMember(String userId);
}
