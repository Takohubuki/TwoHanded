package com.zdh.mappers;

import com.github.pagehelper.Page;
import com.zdh.bean.Item;

import java.util.List;

public interface ItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Item record);

    int updateByPrimaryKey(Item record);

    Item selectBySerialNum(String itemId);

    List<Item> select3WtsItemByTime();

    List<Item> select3WtbItemByTime();

    List<Item> recommandSameKind(String kind);

    Page<Item> selectWtbAllByTime();

    Page<Item> selectWtsAllByTime();

    List<Item> selectByName(String search);

    List<Item> selectByKind(String kind);

    void addPublish(Item item);

    void updateItemInfo(Item item);

    void updateItemNum(int itemNum, String itemId);

    void updatePublisherByName(String sid, String sid1);

    List<Item> getApprovalItem();
}