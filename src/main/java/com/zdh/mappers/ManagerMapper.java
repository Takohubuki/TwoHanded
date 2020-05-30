package com.zdh.mappers;

import com.zdh.bean.Item;
import com.zdh.bean.Manager;
import com.zdh.bean.Member;
import com.zdh.bean.Order;

import java.util.List;

public interface ManagerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

    Manager selectByName(String username);

    Integer countMember();

    Integer countItemWtsOnCarriiage();

    Integer countItemWtbOnCarriiage();

    Integer orderedToday();

    List<Member> selectAllMember();

    void shutMember(String sid);

    List<Item> selectAllSellItems();

    void activeMember(String sid);

    void offItem(String item_id);

    List<Item> selectAllBuyItems();

    List<Order> selectAllOrder();

    Integer selectLoginToday();

    Integer countItemWtsToday();

    Integer countItemWtbToday();

    Integer countOrderTotal();

    Integer countInfoToHandle();

    Integer countMemberToIdentify();

    void delMember(String sid);
}