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
}
