package com.zdh.mappers;

import com.zdh.bean.Cart;
import com.zdh.bean.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    void generateNewOrder(Order order);

    List<Order> selectMyOrder(String sid);

    List<Cart> selectMyCart(String sid);
}