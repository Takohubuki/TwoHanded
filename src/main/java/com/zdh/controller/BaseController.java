package com.zdh.controller;

import com.zdh.bean.AjaxResponseBody;
import com.zdh.bean.PageInfo;
import com.zdh.util.Constant;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BaseController<T> {
    protected HttpServletRequest request;

    protected HttpServletResponse response;

    protected HttpSession session;

    protected T obj;

    protected PageInfo<T> pageInfo;

    protected AjaxResponseBody ajaxResponseBody = new AjaxResponseBody();

    @ModelAttribute
    public void init(HttpServletResponse response, HttpServletRequest request, PageInfo<T> pageInfo, T obj) {
        this.request = request;
        this.ajaxResponseBody = (AjaxResponseBody) request.getAttribute(Constant.RESPONSE_BODY_OBJ);
        this.response = response;
        this.session = request.getSession();
        this.obj = obj;
        pageInfo.setObj(obj);
        this.pageInfo = pageInfo;
    }
}
