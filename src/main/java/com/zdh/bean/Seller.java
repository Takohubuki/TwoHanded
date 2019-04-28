package com.zdh.bean;

public class Seller extends Members{
    private String SID;

    private String username;

    private String password;

    private String phone;

    private String dormitory;

    public Seller(String SID, String username, String password, String phone, String dormitory) {
        this.SID = "S" + SID;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.dormitory = dormitory;
    }

    public String getSID() {
        return SID;
    }

    public void setSID(String SID) {
        this.SID = SID == null ? null : SID.trim();
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