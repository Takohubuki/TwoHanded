package com.zdh.bean;

import java.io.Serializable;

/**
 * cart
 * @author 
 */
public class Cart implements Serializable {
    private Integer id;

    private static final long serialVersionUID = 1L;
    /**
     * 商品id
     */
    private String itemId;
    /**
     * 用户id
     */
    private String memberSid;
    /**
     * 数量
     */
    private Integer itemNum;
    /**
     * 是否结账 0已付 1未付
     */
    private Boolean isChecked;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getMemberSid() {
        return memberSid;
    }

    public void setMemberSid(String memberSid) {
        this.memberSid = memberSid;
    }

    public Integer getItemNum() {
        return itemNum;
    }

    public void setItemNum(Integer itemNum) {
        this.itemNum = itemNum;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }
}