package com.zdh.bean;

public class OrdersKey {
    private String orders_id;

    private String items_id;

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
}