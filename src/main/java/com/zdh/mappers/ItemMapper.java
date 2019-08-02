package com.zdh.mappers;

import com.github.pagehelper.Page;
import com.zdh.bean.Item;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectBySerialNum(String id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);

    //根据时间查询所有出售商品
    Page<Item> selectWtsAllByTime();

    //根据时间分页查询所有出售商品
    List<Item> selectWtsAllByTimePage(@Param("start")int start, @Param("pageSize")int pageSize);

    //根据时间查询所有求购信息
    Page<Item> selectWtbAllByTime();

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

    List<Item> selectPublisherAndPublishTime();

    List<Item> selectAll();

    void updateSerial_num(@Param("serial_num") String serial_num,@Param("name") String name);

    void updatePublisherByName(@Param("old_sid")String old_sid, @Param("new_sid")String new_sid);

    List<Item> selectByName(String name);

    List<Item> selectSameKind(String kind);

    List<Item> RecommandSameKind(String kind);

    List<Item> selectByKind(String kind);

    void updateItemInfo(Item item);

    void updateItemNum(@Param("itemnumber") int itemnumber,@Param("item_id")String item_id);
}