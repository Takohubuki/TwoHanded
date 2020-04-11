package com.zdh.controller;


import com.zdh.bean.Item;
import com.zdh.service.OrderService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    OrderService orderService;

    @RequestMapping("/addcart")
    public String addCart(HttpSession session, ModelAndView modelAndView, Item item){
        return orderService.addCart(item, session, modelAndView);
    }

    @RequestMapping("/delCart")
    public String deleteCart(String id, HttpSession session){
        return orderService.delCart(id, session);
    }

    @RequestMapping(path = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkOut(String[] cbox, HttpSession session, ModelAndView modelAndView) throws Exception {
        return orderService.checkOut(cbox, session, modelAndView);
    }

    @RequestMapping("/mycart")
    public ModelAndView myCart(HttpSession session, ModelAndView modelAndView){
        return orderService.myCart(session, modelAndView);
    }

    @RequestMapping(path = "/updateCartNum", method = RequestMethod.POST)
    public String updateCartNum(String id, String num, HttpSession session){
        return orderService.updateCartNum(id, num, session);
    }

    @RequestMapping("/myOrder")
    public ModelAndView myOrder(HttpSession session, ModelAndView modelAndView){
        return orderService.myOrder(session, modelAndView);
    }

    @RequestMapping("/alipay")
    public void alipay(String orderId, HttpServletRequest request, HttpServletResponse response) throws Exception {
        orderService.alipay(orderId, response, request);
    }

    @RequestMapping("/cashpay")
    public ModelAndView cashpay(ModelAndView modelAndView, String orderId) {
        return orderService.cashpay(modelAndView, orderId);
    }

    @RequestMapping("/cfmGetItem")
    public void cfmGetItem(String orderId) {
        orderService.cfmGetItem(orderId);
    }
}
