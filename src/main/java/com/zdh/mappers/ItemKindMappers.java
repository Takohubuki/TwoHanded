package com.zdh.mappers;

import com.zdh.bean.ItemKind;

import java.util.List;

public interface ItemKindMappers {
    int deleteByPrimaryKey(Integer id);

    int insert(ItemKind record);

    int insertSelective(ItemKind record);

    ItemKind selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ItemKind record);

    int updateByPrimaryKey(ItemKind record);

    List<String> getKindList();
}