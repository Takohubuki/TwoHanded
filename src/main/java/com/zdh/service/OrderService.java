package com.zdh.service;

import com.zdh.bean.Item;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface OrderService {

    ModelAndView myCart(HttpSession session, ModelAndView modelAndView);

    ModelAndView checkOut(String[] cartList, HttpSession session, ModelAndView modelAndView) throws Exception;

    String addCart(Item item, HttpSession session, ModelAndView modelAndView);

    String updateCartNum(String id, String num, HttpSession session);

    ModelAndView myOrder(HttpSession session, ModelAndView modelAndView);

    void alipay(String orderId, HttpServletResponse response, HttpServletRequest request) throws Exception;

    ModelAndView cashpay(ModelAndView modelAndView, String orderId);

    String delCart(String id, HttpSession session);

    void cfmGetItem(String orderId, String itemId);

    ModelAndView payLater(String orderId, ModelAndView modelAndView);

    ModelAndView cancelOrder(String orderId, ModelAndView modelAndView);
}
