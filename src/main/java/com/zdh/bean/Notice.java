package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * notice
 *
 * @author
 */
public class Notice implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 自增主键
     */
    private Integer id;
    /**
     * 接收通知的用户
     */
    private String receiver;
    /**
     * 通知内容
     */
    private String body;
    /**
     * 通知状态 U已读 E未读
     */
    private String status;
    /**
     * 创建时间
     */
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}