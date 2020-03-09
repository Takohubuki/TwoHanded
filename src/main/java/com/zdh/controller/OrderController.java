package com.zdh.controller;


import com.zdh.bean.Cart;
import com.zdh.service.OrderService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    OrderService orderService;

    //TODO 添加购物车内商品
    @RequestMapping("/addcart")
    public ModelAndView addCart(@RequestParam("item_id") String itemId,
                                @RequestParam(value = "item_num", required = false, defaultValue = "1") String itemNum,
                                HttpSession session, ModelAndView modelAndView){
        return orderService.addCart(itemId, itemNum, session, modelAndView);
    }

    //TODO 删除购物车内商品
    @RequestMapping("/deletecart")
    public String deleteCart(){
        return "";
    }

    //TODO 查看购物车内商品
    @RequestMapping("/querycart")
    public String queryCart(){
        return "";
    }

    @RequestMapping(path = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkOut(@RequestParam("cartItem") List<Cart> cartItem, HttpSession session, ModelAndView modelAndView){
        return orderService.checkOut(cartItem, session, modelAndView);
    }

    @RequestMapping("/mycart")
    public ModelAndView myCart(HttpSession session, ModelAndView modelAndView){
        return orderService.myCart(session, modelAndView);
    }
}
