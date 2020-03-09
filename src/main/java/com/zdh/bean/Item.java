package com.zdh.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * item
 * @author 
 */
public class Item implements Serializable {
    private Integer id;

    private static final long serialVersionUID = 1L;
    /**
     * 商品id
     */
    private String serialNum;
    /**
     * 商品名称
     */
    private String name;
    /**
     * 单价
     */
    private Integer price;
    /**
     * 库存
     */
    private Integer number;
    /**
     * 发布用户id
     */
    private String publisher;
    /**
     * 描述
     */
    private String describes;
    /**
     * 图片
     */
    private String image;
    /**
     * 分类
     */
    private String kind;
    /**
     * 商品成色 x表示x成新
     */
    private Integer quality;
    /**
     * 出售或求购
     */
    private String conditions;
    /**
     * 发布时间
     */
    private Date publishTime;
    /**
     * 信息更新时间
     */
    private Date updateTime;
    /**
     * 是否下架
     */
    private Boolean isUndercarriage;
    /**
     * 下架原因
     */
    private String undercarriageReason;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerialNum() {
        return serialNum;
    }

    public void setSerialNum(String serialNum) {
        this.serialNum = serialNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescribes() {
        return describes;
    }

    public void setDescribes(String describes) {
        this.describes = describes;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }

    public String getConditions() {
        return conditions;
    }

    public void setConditions(String conditions) {
        this.conditions = conditions;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getIsUndercarriage() {
        return isUndercarriage;
    }

    public void setIsUndercarriage(Boolean isUndercarriage) {
        this.isUndercarriage = isUndercarriage;
    }

    public String getUndercarriageReason() {
        return undercarriageReason;
    }

    public void setUndercarriageReason(String undercarriageReason) {
        this.undercarriageReason = undercarriageReason;
    }
}