package com.zdh.mappers;

import com.zdh.bean.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    void generateNewOrder(Order new_order);

    List<Order> selectMyOrder(String sid);
}