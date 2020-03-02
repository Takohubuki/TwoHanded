package com.zdh.bean;

import java.util.Date;

// TODO: 2020/2/24 添加用户评价字段
public class Member {
    private String sid;

    private String username;

    private String password;

    private String dormitory;

    private String name;

    private String avatar;

    private String phone;

    private Integer is_active;

    private Date signin_time;

    private Date recent_login;

    public Integer getIs_active() {
        return is_active;
    }

    public void setIs_active(Integer is_active) {
        this.is_active = is_active;
    }

    public Date getSignin_time() {
        return signin_time;
    }

    public void setSignin_time(Date signin_time) {
        this.signin_time = signin_time;
    }

    public Date getRecent_login() {
        return recent_login;
    }

    public void setRecent_login(Date recent_login) {
        this.recent_login = recent_login;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}