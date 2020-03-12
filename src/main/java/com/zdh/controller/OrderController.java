package com.zdh.controller;


import com.zdh.bean.Item;
import com.zdh.service.OrderService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    OrderService orderService;

    @RequestMapping("/addcart")
    public String addCart(HttpSession session, ModelAndView modelAndView, Item item){
        return orderService.addCart(item, session, modelAndView);
    }

    //TODO 删除购物车内商品
    @RequestMapping("/deletecart")
    public String deleteCart(){
        return "";
    }

//    @RequestMapping("/querycart")
//    public String queryCart(){
//        return "";
//    }

    @RequestMapping(path = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkOut(String cartList, HttpSession session, ModelAndView modelAndView, HttpServletRequest request){
        Map parameterMap = request.getParameterMap();
        System.out.println(parameterMap);
        return orderService.checkOut(cartList, session, modelAndView);
    }

    @RequestMapping("/mycart")
    public ModelAndView myCart(HttpSession session, ModelAndView modelAndView){
        return orderService.myCart(session, modelAndView);
    }

    @RequestMapping("/checkFin")
    public ModelAndView checkFin(ModelAndView modelAndView){
        modelAndView.setViewName("checkout");
        return modelAndView;
    }
}
