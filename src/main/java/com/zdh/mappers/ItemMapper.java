package com.zdh.mappers;

import com.github.pagehelper.Page;
import com.zdh.bean.Item;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
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

    Integer countApprovalItemOfUser(String sid);

    void wtsItem(String serialNum);

    List<Item> selectWtsByName(String name);

    List<Item> selectWtbByName(String name);

    List<Item> select3MostViewedWts();

    Item getItemAndMember(String itemId);

    List<Item> getItemByKind(String[] kindList);

    List<Item> getWtsItemByTime(Map param);

    List<Item> getWtsItemByKindAndTime(@Param("startTime") Date start, @Param("endTime") Date end, @Param("kindList") String[] kindList);

    List<Item> getItemByUser(@Param("userId") String userId, @Param("condition") String condition);
}