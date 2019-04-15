package com.zdh.mappers;

import com.zdh.bean.Manager;

public interface ManagerMapper {
    int insert(Manager record);

    int insertSelective(Manager record);
}