package com.zdh.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
    private Integer id;

    private String is_paid;

    private String is_received;

    private Date create_time;

    private Date update_time;

    private String order_id;

    private String item_id;

    private String buyer_id;

    private Integer item_num;

    private List<Item> item_list;

    public List<Item> getItem_list() {
        if (item_list == null){
            return new ArrayList<>();
        }else {
            return item_list;
        }
    }

    public void setItem_list(List<Item> item_list) {
        this.item_list = item_list;
    }

    public Integer getItem_num() {
        return item_num;
    }

    public void setItem_num(Integer item_num) {
        this.item_num = item_num;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getItem_id() {
        return item_id;
    }

    public void setItem_id(String item_id) {
        this.item_id = item_id;
    }

    public String getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(String buyer_id) {
        this.buyer_id = buyer_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIs_paid() {
        return is_paid;
    }

    public void setIs_paid(String is_paid) {
        this.is_paid = is_paid == null ? null : is_paid.trim();
    }

    public String getIs_received() {
        return is_received;
    }

    public void setIs_received(String is_received) {
        this.is_received = is_received == null ? null : is_received.trim();
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }
}