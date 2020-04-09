package com.zdh.service.impl;

import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.VerifyCode;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.MemberMapper;
import com.zdh.mappers.VerifyCodeMapper;
import com.zdh.service.MemberService;
import com.zdh.util.Constant;
import com.zdh.util.TimeUtils;
import com.zdh.util.TokenTools;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import static com.zdh.util.PasswordUtils.passwordConfirm;

@Service
public class MemberServiceImpl implements MemberService {

    @Resource
    JavaMailSender javaMailSender;
    @Resource
    VerifyCodeMapper verifyCodeMapper;

    @Resource
    MemberMapper memberMapper;

    @Resource
    ItemMapper itemMapper;
    private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

    @Override
    public ModelAndView signUp(Member member, HttpSession session, ModelAndView modelAndView, HttpServletRequest request) {
        System.out.println("-----------------------开始注册------------------------");
        /*
        将新用户的信息分别存入member表和seller表中
        密码经过md5加密之后存入数据库中
         */
        String uri = request.getHeader("Referer");

        String password = member.getPassword();
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        member.setPassword(s);
        Date date = new Date();
        member.setRecentLogin(date);
        member.setSigninTime(date);

        memberMapper.insertSelective(member);
        System.out.println("-----------------------注册成功-----------------------------");
        session.setAttribute("member", member);
        modelAndView.setViewName("redirect:" + uri);

        return modelAndView;
    }

    @Override
    public ModelAndView logout(HttpSession session, HttpServletRequest request, ModelAndView modelAndView) {
        session.setAttribute("member",null);
        String uri = request.getHeader("Referer");
        if (uri.contains("singleitem") || uri.contains("queryalltime") || uri.contains("wtbitem")) {
            modelAndView.setViewName("redirect:"+uri);
        }else {
            modelAndView.setViewName("redirect:/");
        }
        return modelAndView;
    }

    @Override
    public ModelAndView login(String username, String password, HttpSession session, HttpServletRequest request, ModelAndView modelAndView) {
        logger.debug("登录开始");
        String uri = request.getHeader("Referer");

        if (uri.contains("signin")){
            uri = "/";
        }
        Member member = memberMapper.selectByName(username);

        if (member == null){

            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名错误！");

            return modelAndView;
        }else if (!passwordConfirm(member.getPassword(),password)){

            modelAndView.setViewName("login");
            modelAndView.addObject("message","密码错误！");

            return modelAndView;

        }else if (passwordConfirm(member.getPassword(),password)){

            /*
            用户登录成功返回上一个请求
            并记录最近登录时间
             */
            logger.debug("登录成功 返回上一个请求：" + uri);

            if (uri.contains("checkout") || uri.contains("addcart") || uri.contains("login") || uri.contains("signin")){
                modelAndView.setViewName("redirect:/");
            }else {
                modelAndView.setViewName("redirect:"+uri);
            }

            Date date = new Date();
            member.setRecentLogin(date);
            memberMapper.updateRecentLogin(member);
            session.setAttribute("member",member);

            return modelAndView;
        }else {

            modelAndView.setViewName("login");
            modelAndView.addObject("message","用户名或密码错误！");

            return modelAndView;
        }

    }

    @Override
    public ModelAndView publishWts(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Item> myWts = memberMapper.selectMyWts(sid);
        modelAndView.addObject("mywts",myWts);
        modelAndView.setViewName("publishWts");
        return modelAndView;

    }

    @Override
    public ModelAndView publishWtb(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Item> myWtb = memberMapper.selectMyWtb(sid);
        modelAndView.addObject("mywtb",myWtb);
        modelAndView.setViewName("publishWtb");
        return modelAndView;
    }

    @Override
    public ModelAndView upProfile(Member member, HttpSession session, MultipartFile file, HttpServletRequest request, ModelAndView modelAndView) throws IOException {
        Member member_old = (Member) session.getAttribute("member");
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/images/avatar/");

            System.out.println(path);
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            //输出文件上传最终的路径 测试查看
            System.out.println(path + File.separator + filename);

            member.setAvatar(filename);
        }else{
            member.setAvatar(member_old.getAvatar());
        }
        String password = member_old.getPassword();
        member.setPassword(password);

        session.setAttribute("member",member);
        try {
            if (!member_old.getSid().equals(member.getSid())){
                itemMapper.updatePublisherByName(member_old.getSid(),member.getSid());
            }
            memberMapper.updateProfile(member);

        } catch (Exception e) {
            System.out.println("error!rollback!");
        }

        modelAndView.setViewName("profile");
        return modelAndView;
    }

    @Override
    public String sendCode(String sid, String email) throws MessagingException {
        if (StringUtils.isEmpty(sid) && StringUtils.isEmpty(email)) {
            logger.error("入参为空！");
            return "参数为空！";
        }
        //发送验证码邮件
        if (!verifyEmail(sid, email)) {
            return "该邮箱与用户不匹配！";
        }
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true);

        messageHelper.setFrom(Constant.MAIL_SENDER);
        messageHelper.setSubject("邮箱验证");
        String verifyCode = TokenTools.createVerifyCode();
        messageHelper.setText("<html>\n" +
                "<body>\n" +
                "<p>\n" +
                "来自HRBU二手交易平台的邮箱验证码：<b>" +
                verifyCode + "</b>\n" +
                "</p>\n" +
                "<p>" +
                "该验证码5分钟内有效" +
                "</p>" +
                "</body>\n" +
                "</html>", true);
        messageHelper.setTo(email);

        logger.debug("开始发送验证码邮件");
        javaMailSender.send(mimeMessage);
        logger.debug("发送成功");

        Date createTime = new Date();
        Date expireTime = TimeUtils.minsFromNow(5);
        VerifyCode code = new VerifyCode();
        code.setUser(sid);
        code.setVerifyCode(verifyCode);
        code.setCreateTime(createTime);
        code.setExpireTime(expireTime);
        code.setState("U");

        verifyCodeMapper.insertSelective(code);
        return "发送成功";
    }

    private boolean verifyEmail(String sid, String email) {
        Member member = memberMapper.selectByPrimaryKey(sid);
        if (member == null) {
            return false;
        }
        String email1 = member.getEmail();
        return email1.equals(email);
    }

    @Override
    public void sendPasswordResetLink() {

    }

}
