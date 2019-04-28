package com.zdh.mappers;

import com.zdh.bean.Orders;
import com.zdh.bean.OrdersKey;

public interface OrdersMapper {
    int deleteByPrimaryKey(OrdersKey key);

    int insert(Orders record);

    int insertSelective(Orders record);

    Orders selectByPrimaryKey(OrdersKey key);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}