package com.zdh.mappers;

import com.zdh.bean.Item;

import java.util.List;

public interface ItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);

    //根据时间查询所有出售商品
    List<Item> selectWtsAllByTime();

    //根据时间查询所有求购信息
    List<Item> selectWtbAllByTime();

    //查询最新的3个出售信息
    List<Item> select3WtsItemByTime();

    //查询最新的3个求购信息
    List<Item> select3WtbItemByTime();

    //根据商品名查询单个出售商品信息
    Item select1WtsItemByName(String itemname);

    //添加出售或求购信息
    void addpublish(Item item);

    //根据商品名查询单个求购商品
    Item select1WtbItemByName(String itemname);
}