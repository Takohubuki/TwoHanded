package com.zdh.mappers;

import com.zdh.bean.Seller;

public interface SellerMapper {
    int deleteByPrimaryKey(String SID);

    int insert(Seller record);

    int insertSelective(Seller record);

    Seller selectByPrimaryKey(String SID);

    int updateByPrimaryKeySelective(Seller record);

    int updateByPrimaryKey(Seller record);
}