package com.zdh.mappers;

import com.zdh.bean.Item;
import com.zdh.bean.Member;

import java.util.List;

public interface MemberMapper {
    int deleteByPrimaryKey(String sid);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(String sid);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);

    Member selectByName(String username);

    List<Item> selectMyWts(String sid);

    List<Item> selectMyWtb(String sid);

    void updateProfile(Member sid);
}