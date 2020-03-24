package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * order
 * @author 
 */
public class Order implements Serializable {
    private Integer id;

    private static final long serialVersionUID = 1L;
    /**
     * 订单id
     */
    private String orderId;
    /**
     * 单种商品总价
     */
    private String sumPrice;
    /**
     * 商品数量
     */
    private Integer itemNum;
    /**
     * 商品id
     */
    private String itemId;
    /**
     * 买家用户id
     */
    private String buyerId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;
    /**
     * 是否付款 0付款 1未付
     */
    private Boolean isPaid;
    /**
     * 是否收货 0未受 1收货
     */
    private Boolean isReceived;
    /**
     * 是否取消 0正常 1取消
     */
    private Boolean isCanceled;
    /**
     * 结算状态 0未结算 1结算
     */
    private Boolean isChecked;
    /**
     * 支付方式
     */
    private String payMethod;

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(String sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Integer getItemNum() {
        return itemNum;
    }

    public void setItemNum(Integer itemNum) {
        this.itemNum = itemNum;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Boolean isPaid) {
        this.isPaid = isPaid;
    }

    public Boolean getIsReceived() {
        return isReceived;
    }

    public void setIsReceived(Boolean isReceived) {
        this.isReceived = isReceived;
    }

    public Boolean getIsCanceled() {
        return isCanceled;
    }

    public void setIsCanceled(Boolean isCanceled) {
        this.isCanceled = isCanceled;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }
}