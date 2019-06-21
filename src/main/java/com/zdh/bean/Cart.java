package com.zdh.bean;

public class Cart {
    private Integer id;

    private String item_id;

    private String member_sid;

    private Integer number;

    private Integer price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id == null ? null : item_id.trim();
    }

    public String getMember_sid() {
        return member_sid;
    }

    public void setMember_sid(String member_sid) {
        this.member_sid = member_sid == null ? null : member_sid.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}