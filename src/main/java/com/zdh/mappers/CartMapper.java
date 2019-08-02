package com.zdh.mappers;

import com.zdh.bean.Cart;
import org.apache.ibatis.annotations.Param;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    Cart checkItemInMyCart(@Param("item_id") String item_id, @Param("sid") String sid);

    void addCart(Cart cart);

    void addCartNum(Cart cart);
}