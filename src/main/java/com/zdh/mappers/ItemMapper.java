package com.zdh.mappers;

import com.zdh.bean.Item;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ItemMapper {

    int insert(Item record);

    int insertSelective(Item record);

    Item selectByPrimaryKey(Integer id);

    Item selectBySerialNum(String itemId);

    List<Item> select3WtsItemByTime();

    List<Item> select3WtbItemByTime();

    List<Item> recommandSameKind(String kind);

    List<Item> selectWtbAllByTime(@Param("timeSort") String timeSort, @Param("clickSort") String clickSort);

    List<Item> selectWtsAllByTime(@Param("timeSort") String timeSort, @Param("clickSort") String clickSort);

    List<Item> selectByKind(@Param("kind") String kind, @Param("timeSort") String timeSort, @Param("clickSort") String clickSort);

    void addPublish(Item item);

    void updateItemInfo(Item item);

    void updatePublisherByName(String sid, String sid1);

    List<Item> getApprovalItem();

    void batchUpdateItemNum(List<Item> itemList);

    void offItem(Map<String, String> param);

    List<Item> getApprovalItemOfUser(String sid);

    Integer countApprovalItemOfUser(String sid);

    void wtsItem(String serialNum);

    List<Item> selectWtsByName(@Param("name") String name, @Param("timeSort") String timeSort, @Param("clickSort") String clickSort);

    List<Item> selectWtbByName(@Param("name") String name, @Param("timeSort") String timeSort, @Param("clickSort") String clickSort);

    List<Item> select3MostViewedWts();

    List<Item> getItemByKind(String[] kindList);

    List<Item> getWtsItemByTime(Map param);

    List<Item> getWtsItemByKindAndTime(@Param("startTime") Date start, @Param("endTime") Date end, @Param("kindList") String[] kindList);

    List<Item> getItemByUser(@Param("userId") String userId, @Param("condition") String condition);

    List<Item> getWtbItemByTime(Map param);
}