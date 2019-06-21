package com.zdh.mappers;

import com.zdh.bean.Member;

public interface MemberMapper {
    int deleteByPrimaryKey(String sid);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(String sid);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
}