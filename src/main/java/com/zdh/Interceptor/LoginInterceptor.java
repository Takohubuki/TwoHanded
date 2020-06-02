package com.zdh.Interceptor;

import com.zdh.bean.Member;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {
        //拦截器
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession();
        if (requestURI.contains("login")) {
            return true;
        }
        Member member = (Member) session.getAttribute("member");
        if (requestURI.contains("publish") || requestURI.contains("checkout") || requestURI.contains("mycart")) {
            if (member == null) {
                request.setAttribute("message", "请先登录");
                request.getRequestDispatcher("/user/signin").forward(request, response);
                return false;
            } else if ("V".equals(member.getStatus())) {
                session.setAttribute("message", "您还未通过实名认证！");
                request.getRequestDispatcher("/index/backindex").forward(request, response);
                return false;
            } else if ("S".equals(member.getStatus())) {
                session.setAttribute("message", "您已被封禁！");
                request.getRequestDispatcher("/index/backindex").forward(request, response);
                return false;
            }
        }
        return true;
    }
}
