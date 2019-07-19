package com.zdh.controller;


import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    @RequestMapping("/checkout")
    public String checkout(@RequestParam("item_serial_num") String[] item_serial_num,
                           @RequestParam("quantity")String[] quantity,
                           @RequestParam("total")Integer total,
                           HttpSession session){

        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String format = simpleDateFormat.format(date);
        String order_id = sid + format;
        System.out.println(order_id);
        for (int i = 0; i < item_serial_num.length; i++) {
            String item_id = item_serial_num[i];
            String item_quantity = quantity[i];
            Integer item_num = Integer.parseInt(item_quantity);
            Order new_order = new Order();
            new_order.setCreate_time(date);
            new_order.setUpdate_time(date);
            new_order.setItem_id(item_id);
            new_order.setBuyer_id(sid);
            new_order.setItem_num(item_num);
            new_order.setOrder_id(order_id);
            new_order.setTotal(total);
            orderMapper.generateNewOrder(new_order);
        }

        return "checkout";
    }
}
