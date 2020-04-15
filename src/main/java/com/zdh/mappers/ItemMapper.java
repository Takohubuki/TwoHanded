package com.zdh.mappers;

import com.github.pagehelper.Page;
import com.zdh.bean.Item;

import java.util.List;
import java.util.Map;

public interface ItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

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

    void updatePublisherByName(String sid, String sid1);

    List<Item> getApprovalItem();

    void batchUpdateItemNum(List<Item> itemList);

    void offItem(Map<String, String> param);

    List<Item> getApprovalItemOfUser(String sid);
}