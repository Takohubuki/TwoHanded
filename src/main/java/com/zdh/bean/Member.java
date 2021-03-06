package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * member
 * @author 
 */
public class Member implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 学号
     */
    private String sid;
    /**
     * 用户名
     */
    private String username;
    /**
     * 用户登录密码
     */
    private String password;
    /**
     * 电子邮箱
     */
    private String email;
    /**
     * 真实姓名
     */
    private String name;
    /**
     * 用户头像路径
     */
    private String avatar;
    /**
     * 电话号
     */
    private String phone;
    /**
     * 封禁状态 0禁用 1正常
     */
    private Boolean isActive;
    /**
     * 注册时间
     */
    private Date signinTime;
    /**
     * 最近登录时间
     */
    private Date recentLogin;
    /**
     * 好评数
     */
    private Integer positiveComment;
    /**
     * 差评数
     */
    private Integer negativeComment;
    /**
     * 成交次数
     */
    private Integer tradRecordNum;

    private String status;

    private String identificationMaterial;

    public String getIdentificationMaterial() {
        return identificationMaterial;
    }

    public void setIdentificationMaterial(String identificationMaterial) {
        this.identificationMaterial = identificationMaterial;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Date getSigninTime() {
        return signinTime;
    }

    public void setSigninTime(Date signinTime) {
        this.signinTime = signinTime;
    }

    public Date getRecentLogin() {
        return recentLogin;
    }

    public void setRecentLogin(Date recentLogin) {
        this.recentLogin = recentLogin;
    }

    public Integer getPositiveComment() {
        return positiveComment;
    }

    public void setPositiveComment(Integer positiveComment) {
        this.positiveComment = positiveComment;
    }

    public Integer getNegativeComment() {
        return negativeComment;
    }

    public void setNegativeComment(Integer negativeComment) {
        this.negativeComment = negativeComment;
    }

    public Integer getTradRecordNum() {
        return tradRecordNum;
    }

    public void setTradRecordNum(Integer tradRecordNum) {
        this.tradRecordNum = tradRecordNum;
    }
}