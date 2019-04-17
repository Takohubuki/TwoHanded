package com.zdh.mappers;

import com.zdh.bean.Items;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ItemsMapper {
    @Delete(" delete items where id = #{id}")
    int deleteByPrimaryKey(String id);

    @Insert(" insert into items values(#{id}, #{name}, #{price}, #{description}, #{tags})")
    int insert(Items items);

    @Select(" select * from items")
    int selectAll();


    int insertSelective(Items record);

    Items selectByPrimaryKey(String id);

    Items selectByName(String itemname);

    int updateByPrimaryKeySelective(Items record);

    int updateByPrimaryKey(Items record);
}