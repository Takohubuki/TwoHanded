package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * token
 *
 * @author
 */
public class Token implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer id;
    /**
     * token
     */
    private String token;
    /**
     * token接收方学号
     */
    private String user;
    /**
     * token签发时间
     */
    private Date issueDate;
    /**
     * token过期时间
     */
    private Date expireDate;
    /**
     * token状态 U可用 E过期 V已验证
     */
    private String status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}