package com.zdh.service.impl;

import com.zdh.bean.ScheduledTask;
import com.zdh.mappers.ScheduledTaskMapper;
import com.zdh.service.ScheduledTaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class ScheduledTaskServiceImpl implements ScheduledTaskService {

    private Logger logger = LoggerFactory.getLogger(ScheduledTaskServiceImpl.class);

    @Resource
    private ScheduledTaskMapper scheduledTaskMapper;

    @Override
    public ScheduledTask getTTaskByName(String name) {
        return scheduledTaskMapper.getTaskByName(name);
    }

    @Override
    public void switchDelOrder(String taskName, String flag) {
        Map param = new HashMap<>();

        if ("on".equals(flag)) {
            param.put("taskName", taskName);
            param.put("flag", true);
            logger.info("自动删除订单开启");
        } else {
            param.put("taskName", taskName);
            param.put("flag", false);
            logger.info("自动删除订单关闭");
        }

        scheduledTaskMapper.switchTask(param);
    }
}
