package com.zdh.mappers;

import com.zdh.bean.Items;

public interface ItemsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Items record);

    int insertSelective(Items record);

    Items selectByPrimaryKey(String id);

    Items selectByName(String itemname);

    int updateByPrimaryKeySelective(Items record);

    int updateByPrimaryKey(Items record);
}