package com.zdh.mappers;

import com.zdh.bean.Members;

public interface MembersMapper {
    int deleteByPrimaryKey(String userId);

    int insert(Members record);

    int insertSelective(Members record);

    Members selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(Members record);

    int updateByPrimaryKey(Members record);
}