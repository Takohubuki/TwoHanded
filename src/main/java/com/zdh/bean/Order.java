package com.zdh.bean;

import java.util.Date;

public class Order {
    private Integer id;

    private String is_paid;

    private String is_received;

    private Date create_time;

    private Date update_time;

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