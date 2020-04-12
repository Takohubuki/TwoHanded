package com.zdh.mappers;

import com.zdh.bean.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    void generateNewOrder(Order new_order);

    List<Order> selectMyOrder(String sid);

    List<Order> selectAllOrder();

    List<Order> getOrderByOrderId(String orderId);

    void updatePayMethod(Map map);

    void cfmGetItem(String orderId);

    List<Order> selectOrderAndItems(String orderId);
}