package com.zdh.mappers;

import com.zdh.bean.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKey(Notice record);

    List<Notice> getMyNotice(Map param);

    void markAsRead(String id);
}