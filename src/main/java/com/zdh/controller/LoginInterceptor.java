package com.zdh.controller;

import com.zdh.bean.Member;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {
        //拦截器
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, HttpSession session) throws ServletException, IOException {
        if (request.getRequestURI().contains("login")){
            return true;
        }
        Member member = (Member) request.getSession().getAttribute("member");
        String requestURI = request.getRequestURI();
        System.out.println(requestURI);
        if (member == null && (request.getRequestURI().contains("checkout") || request.getRequestURI().contains("publish"))){
            request.setAttribute("message","请先登录");
//            String[] item_serial_nums = request.getParameterValues("item_serial_num");
//            String[] quantities = request.getParameterValues("quantity");
//            Map map = new HashMap();
//            if (item_serial_nums != null && quantities != null){
//                for (int i = 0; i < item_serial_nums.length; i++) {
//                    map.put(item_serial_nums[i],quantities[i]);
//                }
//                System.out.println(map);
//                session.setAttribute("cart_list",map);
//            }
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request,response);
            return false;
        }
        return true;
    }
}
