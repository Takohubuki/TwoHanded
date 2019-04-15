package com.zdh.mappers;

import com.zdh.bean.Orders;

public interface OrdersMapper {
    int deleteByPrimaryKey(String orders_id);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(String orders_id);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}