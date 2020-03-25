package com.zdh.service;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

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

    ModelAndView approval();
}
