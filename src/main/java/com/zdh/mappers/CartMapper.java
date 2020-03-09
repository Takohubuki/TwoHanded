package com.zdh.mappers;

import com.zdh.bean.Cart;

import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    Cart checkItemInMyCart(String itemId, String sid);

    void addCart(Cart new_item);

    void addCartNum(Cart cart);

    List<Cart> selectMyCart(String sid);
}