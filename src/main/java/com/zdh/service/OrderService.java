package com.zdh.service;

import com.zdh.bean.Cart;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface OrderService {

    ModelAndView myCart(HttpSession session, ModelAndView modelAndView);

    ModelAndView checkOut(List<Cart> cartList, HttpSession session, ModelAndView modelAndView);

    ModelAndView addCart(String itemId, String itemNum, HttpSession session, ModelAndView modelAndView);

}
