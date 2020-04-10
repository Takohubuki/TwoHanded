package com.zdh.service.impl;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Token;
import com.zdh.bean.VerifyCode;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.MemberMapper;
import com.zdh.mappers.TokenMapper;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.zdh.util.PasswordUtils.passwordConfirm;

@Service
public class MemberServiceImpl implements MemberService {
    @Resource
    TokenMapper tokenMapper;

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
        if (!verifyEmailOfUser(sid, email)) {
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

    private boolean verifyEmailOfUser(String sid, String email) {
        Member member = memberMapper.selectByPrimaryKey(sid);
        if (member == null) {
            return false;
        }
        String email1 = member.getEmail();
        return email1.equals(email);
    }

    @Override
    public String sendPasswordResetLink(String email, String sid) throws MessagingException {
        String token = TokenTools.createToken(sid);
        String url = Constant.RESET_PASSWORD_URL_LOCAL + "?token=" + token;

        //生成token之后存入数据库
        Token token1 = new Token();
        token1.setUser(sid);
        token1.setToken(token);
        token1.setIssueDate(new Date());
        token1.setExpireDate(TimeUtils.hoursFromNow(12));
        token1.setStatus("U");
        tokenMapper.insertSelective(token1);

        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true);

        messageHelper.setFrom(Constant.MAIL_SENDER);
        messageHelper.setSubject("重置密码");
        messageHelper.setText("<html>\n" +
                "<body>\n" +
                "<p>\n" +
                "来自HRBU二手交易平台的修改密码链接：\n" +
                "<br><a href=\"" + url + "\">" + url + "</a>\n" +
                "</p>\n" +
                "<p>" +
                "该链接12小时之内有效" +
                "</p>" +
                "</body>\n" +
                "</html>", true);
        messageHelper.setTo(email);

        logger.debug("开始发送验证码邮件");
        javaMailSender.send(mimeMessage);
        logger.debug("发送成功");

        return "发送成功";
    }

    @Override
    public String verifyEmail(String sid, String verifyCode) {
        Map<String, String> param = new HashMap<>();
        param.put("sid", sid);
        param.put("verifyCode", verifyCode);
        VerifyCode code = verifyCodeMapper.verifyEmail(param);
        if (code == null) {
            logger.error("验证失败！");
            return "验证失败！";
        }

        Date expireTime = code.getExpireTime();
        boolean isExpired = expireTime.before(new Date());
        String state = code.getState();

        if (!isExpired && "U".equals(state)) {
            code.setState("V");
            verifyCodeMapper.updateByPrimaryKeySelective(code);
            return "验证成功！系统将自动发送修改密码的链接";
        }

        return "验证失败";
    }

    @Override
    public ModelAndView resetPassword(String token, ModelAndView modelAndView) {
        modelAndView.setViewName("resetPassword");

        //验证token是否过期 是否合法等
        Map<String, Claim> tokenVerifier;
        try {
            tokenVerifier = TokenTools.tokenVerifier(token);
        } catch (JWTVerificationException e) {
            modelAndView.addObject("invalidToken", "无效的token！");
            logger.error("token验证失败！");
            return modelAndView;
        }
        String sid = tokenVerifier.get("sid").asString();
        HashMap<String, String> param = new HashMap<>();
        param.put("sid", sid);
        param.put("token", token);
        Token token1 = tokenMapper.verifyToken(param);
        if (token1 != null && token1.getStatus().equals("U")) {
            modelAndView.addObject("invalidToken", "");
            token1.setStatus("V");
            tokenMapper.updateByPrimaryKeySelective(token1);
        } else {
            modelAndView.addObject("invalidToken", "无效的token！");
        }
        return modelAndView;
    }

}
