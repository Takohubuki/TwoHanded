package com.zdh.mappers;

import com.zdh.bean.Buyer;
import org.springframework.stereotype.Service;


public interface BuyerMapper {
    Buyer selectByName(String username);

    int deleteByPrimaryKey(String BID);

    int insert(Buyer record);

    int insertSelective(Buyer record);

    Buyer selectByPrimaryKey(String BID);

    int updateByPrimaryKeySelective(Buyer record);

    int updateByPrimaryKey(Buyer record);
}