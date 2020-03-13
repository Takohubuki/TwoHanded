package com.zdh.service;

import com.zdh.bean.Item;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public interface OrderService {

    ModelAndView myCart(HttpSession session, ModelAndView modelAndView);

    ModelAndView checkOut(String[] cartList, HttpSession session, ModelAndView modelAndView);

    String addCart(Item item, HttpSession session, ModelAndView modelAndView);

}
