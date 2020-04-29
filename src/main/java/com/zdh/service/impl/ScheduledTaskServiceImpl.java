package com.zdh.service.impl;

import com.zdh.bean.ScheduledTask;
import com.zdh.mappers.ScheduledTaskMapper;
import com.zdh.service.ScheduledTaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ScheduledTaskServiceImpl implements ScheduledTaskService {

    @Resource
    private ScheduledTaskMapper scheduledTaskMapper;

    @Override
    public ScheduledTask getTTaskByName(String name) {
        return scheduledTaskMapper.getTaskByName(name);
    }
}
