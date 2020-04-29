package com.zdh.bean;

import java.io.Serializable;

/**
 * scheduled_task
 *
 * @author
 */
public class ScheduledTask implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    /**
     * 定时任务名称
     */
    private String taskName;
    /**
     * 定时任务路径
     */
    private String path;
    /**
     * 定时任务开关 0关闭 1启动
     */
    private Boolean swich;
    /**
     * 定时任务执行周期 单位分钟
     */
    private Integer frequency;
    /**
     * 注释
     */
    private String marks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Boolean getSwich() {
        return swich;
    }

    public void setSwich(Boolean swich) {
        this.swich = swich;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public String getMarks() {
        return marks;
    }

    public void setMarks(String marks) {
        this.marks = marks;
    }
}