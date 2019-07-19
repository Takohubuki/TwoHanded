package com.zdh.controller;

import com.zdh.bean.Member;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {
        //拦截器
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws ServletException, IOException {
        if (request.getRequestURI().contains("login")){
            return true;
        }
        Member member = (Member) request.getSession().getAttribute("member");
        String requestURI = request.getRequestURI();
        System.out.println(requestURI);
        if (member == null && (request.getRequestURI().contains("checkout") || request.getRequestURI().contains("publish"))){
            request.setAttribute("message","请先登录");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request,response);
            return false;
        }
        return true;
    }
}
