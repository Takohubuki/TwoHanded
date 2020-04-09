package com.zdh.controller;

import com.zdh.bean.Member;
import com.zdh.service.MemberService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/user")
@RestController
public class UserController {

    @Resource
    MemberService memberService;

    /**
     * 用户登录
     * @param username
     * @param password
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(String username, String password, HttpSession session, HttpServletRequest request, ModelAndView modelAndView) {
        return memberService.login(username, password, session, request, modelAndView);
    }

    /**
     * 跳转登录页
     * @param modelAndView
     * @return
     */
    @RequestMapping("/signin")
    public ModelAndView signIn(ModelAndView modelAndView, String message){
        modelAndView.setViewName("login");
        return modelAndView;
    }

    /**
     * 用户注册
     * @param member
     * @param session
     * @param modelAndView
     * @param request
     * @return
     */
    @RequestMapping("/signup")
    public ModelAndView signUp(Member member, HttpSession session, ModelAndView modelAndView, HttpServletRequest request){
        return memberService.signUp(member, session, modelAndView, request);
    }

    /**
     * 用户注销
     * @param session
     * @param request
     * @param modelAndView
     * @return
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session, HttpServletRequest request, ModelAndView modelAndView){
        return memberService.logout(session, request, modelAndView);
    }


    /**
     * 转跳用户个人中心
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/profile")
    public ModelAndView profile(ModelAndView modelAndView) {
        modelAndView.setViewName("profile");
        return modelAndView;
    }


    /**
     * 用户发布出售商品信息
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/publish/wts")
    public ModelAndView publishWts(HttpSession session, ModelAndView modelAndView){
        return memberService.publishWts(session, modelAndView);
    }


    /**
     * 用户发布求购商品信息
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/publish/wtb")
    public ModelAndView publishWtb(HttpSession session, ModelAndView modelAndView){
        return memberService.publishWtb(session, modelAndView);
    }

    @RequestMapping("/updateprofile")
    public ModelAndView updateProfile(ModelAndView modelAndView) {
        modelAndView.setViewName("updateProfile");
        return modelAndView;
    }

    /**
     * 更新用户资料
     * @param member
     * @param session
     * @param file
     * @param request
     * @param modelAndView
     * @return
     * @throws IOException
     */
    @Transactional
    @RequestMapping("/update/profile")
    public ModelAndView upProfile(Member member, HttpSession session, @RequestParam("imagefile") MultipartFile file, HttpServletRequest request, ModelAndView modelAndView) throws IOException {
        return memberService.upProfile(member, session, file, request, modelAndView);
    }

    /**
     * 跳转忘记密码 邮箱验证页面
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/forgetPWD")
    public ModelAndView forgetPWD(ModelAndView modelAndView) {
        modelAndView.setViewName("forgetPWD");
        return modelAndView;
    }

    /**
     * 发送邮箱验证码
     *
     * @param sid
     * @param email
     * @return
     * @throws MessagingException
     */
    @RequestMapping(path = "/sendVerifyCode", produces = {"text/plain;charset=UTF-8"})
    public String sendVerifyCode(String sid, String email) throws MessagingException {
        return memberService.sendCode(sid, email);
    }

    @RequestMapping(path = "/verifyEmail", produces = {"text/plain;charset=UTF-8"})
    public String verifyEmail(String sid, String verifyCode) {
        return memberService.verifyEmail(sid, verifyCode);
    }

    @RequestMapping(path = "/sendResetLink", produces = {"text/plain;charset=UTF-8"})
    public String sendResetLink(String email) throws MessagingException {
        return memberService.sendPasswordResetLink(email);
    }
}
