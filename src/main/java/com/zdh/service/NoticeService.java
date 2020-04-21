package com.zdh.service;

import com.zdh.bean.Notice;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface NoticeService {

    void markAsRead(String id);

    ModelAndView noticeHistory(ModelAndView modelAndView, HttpSession session);

    void newNotice(String text, String publisher);

    List<Notice> getNoticeBySidAndStatus(Map param);
}
