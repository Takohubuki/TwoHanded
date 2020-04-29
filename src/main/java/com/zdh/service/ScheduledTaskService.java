package com.zdh.service;

import com.zdh.bean.ScheduledTask;

public interface ScheduledTaskService {

    ScheduledTask getTTaskByName(String name);

    void switchDelOrder(String taskName, String flag);
}
