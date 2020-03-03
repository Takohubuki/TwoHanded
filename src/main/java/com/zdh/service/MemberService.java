package com.zdh.service;

import com.zdh.bean.Member;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public interface MemberService {
    /**
     * 用户注册
     * @param member
     * @param session
     * @param modelAndView
     * @param request
     * @return
     */
    public ModelAndView signUp(Member member, HttpSession session, ModelAndView modelAndView, HttpServletRequest request);

    /**
     * 注销
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    public ModelAndView logout(HttpSession session, HttpServletRequest request, ModelAndView modelAndView);

    /**
     * 用户登录
     * @param username
     * @param password
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    public ModelAndView login(String username, String password, HttpSession session, HttpServletRequest request, ModelAndView modelAndView);

    /**
     * 发布出售商品
     * @param session
     * @param modelAndView
     * @return
     */
    public ModelAndView publishWts(HttpSession session, ModelAndView modelAndView);

    /**
     * 发布求购商品
     * @param session
     * @param modelAndView
     * @return
     */
    public ModelAndView publishWtb(HttpSession session, ModelAndView modelAndView);

    /**
     * 更新用户资料
     * @param member
     * @param session
     * @param file
     * @param request
     * @param modelAndView
     * @return
     */
    public ModelAndView upProfile(Member member, HttpSession session, MultipartFile file, HttpServletRequest request, ModelAndView modelAndView) throws IOException;


}