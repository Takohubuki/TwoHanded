package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.service.ItemService;
import com.zdh.service.MemberService;
import com.zdh.service.NoticeService;
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
import java.util.List;

@RequestMapping("/user")
@RestController
public class UserController {

    @Resource
    MemberService memberService;

    @Resource
    private NoticeService noticeService;

    @Resource
    private ItemService itemService;

    /**
     * 用户登录
     *
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
        modelAndView.setViewName("main/login");
        return modelAndView;
    }

    /**
     * 用户注册
     *
     * @param member
     * @param session
     * @param modelAndView
     * @param request
     * @return
     */
    @RequestMapping("/signup")
    public ModelAndView signUp(Member member, HttpSession session, ModelAndView modelAndView, HttpServletRequest request, MultipartFile image) throws IOException {
        return memberService.signUp(member, session, modelAndView, request, image);
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
    public ModelAndView profile(ModelAndView modelAndView, HttpSession session) {
        return memberService.userCenter(modelAndView, session);
    }


    /**
     * 用户管理出售商品信息
     * @param session
     * @param modelAndView
     * @return
     */
    @RequestMapping("/publish/wts")
    public ModelAndView publishWts(HttpSession session, ModelAndView modelAndView){
        return memberService.publishWts(session, modelAndView);
    }


    /**
     * 用户管理求购商品信息
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
        modelAndView.setViewName("userCenter/updateProfile");
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
        modelAndView.setViewName("main/forgetPWD");
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
    public String sendResetLink(String email, String sid) throws MessagingException {
        return memberService.sendPasswordResetLink(email, sid);
    }

    @RequestMapping(path = "/resetPassword", produces = {"text/plain;charset=UTF-8"})
    public ModelAndView resetPassword(String token, ModelAndView modelAndView) {
        return memberService.resetPassword(token, modelAndView);
    }

    @RequestMapping(path = "/newPassword", produces = {"text/plain;charset=UTF-8"})
    public String newPassword(String sid, String newPassword) {
        return memberService.newPassword(sid, newPassword);
    }

    @RequestMapping("/mySoldOut")
    public ModelAndView mySoldOut(ModelAndView modelAndView, HttpSession session) {
        return memberService.mySoldOut(modelAndView, session);
    }

    @RequestMapping("/readNotice")
    public void readNotice(String noticeId) {
        noticeService.markAsRead(noticeId);
    }

    @RequestMapping("/noticeHistory")
    public ModelAndView noticeHistory(HttpSession session) {
        return noticeService.noticeHistory(new ModelAndView(), session);
    }

    @RequestMapping("/comment")
    public String comment(HttpSession session, String comment, String itemId, String orderId) {
        return memberService.comment(session, comment, itemId, orderId);
    }

    @RequestMapping("/manageUserProfile")
    public ModelAndView manageUserProfile(String userId, ModelAndView modelAndView) {
        Member memberById = memberService.getMemberById(userId);
        List<Item> wts = itemService.getItemByUser(userId, "出售");
        List<Item> wtb = itemService.getItemByUser(userId, "求购");

        modelAndView.addObject("memberDetail", memberById);
        modelAndView.addObject("myWts", wts);
        modelAndView.addObject("myWtb", wtb);
        modelAndView.setViewName("manage/memberDetail");
        return modelAndView;
    }
}
