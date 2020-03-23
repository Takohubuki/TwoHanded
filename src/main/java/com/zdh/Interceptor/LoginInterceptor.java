package com.zdh.Interceptor;

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
        String requestURI = request.getRequestURI();
        if (requestURI.contains("login")){
            return true;
        }
        Member member = (Member) request.getSession().getAttribute("member");
        if (member == null && (requestURI.contains("/order") || requestURI.contains("publish") || requestURI.contains("cart"))){
            request.setAttribute("message","请先登录");
            request.getRequestDispatcher("/user/signin").forward(request,response);
            return false;
        }
        return true;
    }
}
