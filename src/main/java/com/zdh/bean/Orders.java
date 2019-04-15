package com.zdh.bean;

public class Orders {
    private String orders_id;

    private String items_id;

    private String buyer_id;

    private String seller_id;

    private Integer items_num;

    public String getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(String orders_id) {
        this.orders_id = orders_id == null ? null : orders_id.trim();
    }

    public String getItems_id() {
        return items_id;
    }

    public void setItems_id(String items_id) {
        this.items_id = items_id == null ? null : items_id.trim();
    }

    public String getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(String buyer_id) {
        this.buyer_id = buyer_id == null ? null : buyer_id.trim();
    }

    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id == null ? null : seller_id.trim();
    }

    public Integer getItems_num() {
        return items_num;
    }

    public void setItems_num(Integer items_num) {
        this.items_num = items_num;
    }
}