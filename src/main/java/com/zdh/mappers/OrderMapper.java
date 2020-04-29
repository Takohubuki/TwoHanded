package com.zdh.mappers;

import com.zdh.bean.Order;
import org.apache.ibatis.annotations.Param;

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

    void cfmGetItem(@Param("orderId") String orderId, @Param("itemId") String itemId);

    List<Order> selectOrderAndItems(String orderId);

    void batchCancelOrder(List<Order> orders);

    List<Order> getUnpaidOrder();

    List<Order> getUserSoldOut(String sid);

    void commentOrder(@Param("orderId") String orderId, @Param("itemId") String itemId);

    void hideOrder(Map param);
}