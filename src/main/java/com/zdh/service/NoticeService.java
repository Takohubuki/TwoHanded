package com.zdh.service;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public interface NoticeService {

    void markAsRead(String id);

    ModelAndView noticeHistory(ModelAndView modelAndView, HttpSession session);

    void newNotice(String text, String publisher);
}
