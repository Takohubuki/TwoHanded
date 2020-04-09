package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * verify_code
 *
 * @author
 */
public class VerifyCode implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 自增id
     */
    private Integer id;
    /**
     * 申请验证码的用户学号
     */
    private String user;
    /**
     * 验证码
     */
    private String verifyCode;
    /**
     * 验证码申请时间
     */
    private Date createTime;
    /**
     * 验证码过期时间
     */
    private Date expireTime;
    /**
     * 验证码状态 U可用 E过期 V已验证
     */
    private String state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}