package com.zdh.controller;


import com.zdh.mappers.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;

@Controller
//TODO 用cookie实现购物车
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderMapper orderMapper;
    //TODO 添加购物车内商品
    @RequestMapping("/addcart")
    public String addcart(@CookieValue(name = "cart",defaultValue = "0") String cart, HttpServletResponse response){


        return "";
    }

    //TODO 删除购物车内商品
    @RequestMapping("/deletecart")
    public String deletecart(){
        return "";
    }

    //TODO 查看购物车内商品
    @RequestMapping("/querycart")
    public String querycart(){
        return "";
    }
}
