package com.zdh.mappers;

import com.zdh.bean.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    Cart checkItemInMyCart(@Param("sid") String sid, @Param("itemId") String itemId);

    void addCart(Cart new_item);

    void addCartNum(Cart cart);

    List<Cart> selectMyCart(String sid);

    void removeCart(@Param("sid") String sid, @Param("itemId") String itemId);
}