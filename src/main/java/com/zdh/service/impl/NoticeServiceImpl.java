package com.zdh.service.impl;

import com.zdh.bean.Member;
import com.zdh.bean.Notice;
import com.zdh.mappers.NoticeMapper;
import com.zdh.service.NoticeService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;


    @Override
    public void markAsRead(String id) {
        noticeMapper.markAsRead(id);
    }

    @Override
    public ModelAndView noticeHistory(ModelAndView modelAndView, HttpSession session) {
        Member member = (Member) session.getAttribute("member");

        Map param = new HashMap();
        param.put("receiver", member.getSid());
        param.put("status", "E");

        List<Notice> myNotice = noticeMapper.getMyNotice(param);

        modelAndView.addObject("noticeHistory", myNotice);
        modelAndView.setViewName("noticeHistory");
        return modelAndView;
    }

    @Override
    public void newNotice(String text, String publisher) {
        Notice notice = new Notice();
        notice.setBody(text);
        notice.setCreateTime(new Date());
        notice.setReceiver(publisher);
        notice.setStatus("U");

        noticeMapper.insertSelective(notice);
    }
}
