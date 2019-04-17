package com.zdh.mappers;

import com.zdh.bean.Manager;
import org.apache.ibatis.annotations.Select;

public interface ManagerMapper {

    @Select(" select * from manager where name = #{name}")
    Manager selectByName(String name);

}