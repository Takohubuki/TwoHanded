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
        if (requestURI.contains("login")){
            return true;
        }
        Member member = (Member) session.getAttribute("member");
        if (member == null && (requestURI.contains("/order") || requestURI.contains("publish") || requestURI.contains("cart"))){
            request.setAttribute("message","请先登录");
//            /**
//             * 以下是为了登录成功后返回到刚刚的操作，不跳到主界面
//             * 实现：通过将请求URL保存到session的beforePath中，然后在登录时判断beforePath是否为空
//             */
//            String uri = request.getRequestURI();//拿到上一个页面地址
//            String path = uri.substring(request.getContextPath().length());//去掉项目地址长度的字符（因为我的默认项目地址是给出的）
//            String query = request.getQueryString();//得到参数
//            if(query == null) {
//                query="";
//            }
//            else {
//                query="?"+query;
//            }
//            String beforePath = path+query;
//            session.setAttribute("beforePath", beforePath);
            request.getRequestDispatcher("/user/signin").forward(request,response);
            return false;
        }
        return true;
    }
}
