package com.zdh.mappers;

import com.zdh.bean.ScheduledTask;

import java.util.Map;

public interface ScheduledTaskMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ScheduledTask record);

    int insertSelective(ScheduledTask record);

    ScheduledTask selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ScheduledTask record);

    int updateByPrimaryKey(ScheduledTask record);

    ScheduledTask getTaskByName(String name);

    void switchTask(Map param);
}