package com.zdh.bean;

public class Buyer extends Members{

    private String BID;

    private String username;

    private String password;

    private String phone;

    private String dormitory;

    public Buyer(String BID, String username, String password, String phone, String dormitory) {
        this.BID = "B" + BID;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.dormitory = dormitory;
    }

    public String getBID() {
        return BID;
    }

    public void setBID(String BID) {
        this.BID = BID == null ? null : BID.trim();
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory == null ? null : dormitory.trim();
    }
}