package com.zdh.mappers;

import com.zdh.bean.Members;
import org.apache.ibatis.annotations.Select;

public interface MembersMapper {
    int deleteByPrimaryKey(String userId);

    int insert(Members record);

    int insertSelective(Members record);

    Members selectByPrimaryKey(String userId);

    @Select(" select * from members where username = #{username}")
    Members selectByName(String username);

    int updateByPrimaryKeySelective(Members record);

    int updateByPrimaryKey(Members record);
}