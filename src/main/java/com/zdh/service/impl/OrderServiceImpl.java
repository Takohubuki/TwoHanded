package com.zdh.service.impl;

import com.zdh.bean.Cart;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.CartMapper;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.OrderMapper;
import com.zdh.service.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {


    @Resource
    OrderMapper orderMapper;

    @Resource
    ItemMapper itemMapper;

    @Resource
    CartMapper cartMapper;

    @Override
    public ModelAndView myCart(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        List<String> item_ids = new ArrayList<>();
        List<Integer> item_num = new ArrayList<>();
        List<Item> itemList = new ArrayList<>();
        List<Cart> carts = cartMapper.selectMyCart(member.getSid());

        for (Cart cart : carts) {
            if (cart == null){
                continue;
            }
            item_ids.add(cart.getItemId());
            item_num.add(cart.getItemNum());
            Item item = itemMapper.selectBySerialNum(cart.getItemId());
            itemList.add(item);
        }
        modelAndView.addObject("item_list", itemList);
        modelAndView.addObject("item_id_list", item_ids);
        modelAndView.addObject("item_num_list", item_num);
        modelAndView.setViewName("cart");
        return modelAndView;

    }

    @Override
    public ModelAndView checkOut(List<Cart> cartList, HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String format = simpleDateFormat.format(date);
        String order_id = sid + format;
        System.out.println(order_id);
        for (int i = 0; i < cartList.size(); i++) {
            Cart cart = cartList.get(i);
            String itemId = cart.getItemId();
            Integer item_num = cart.getItemNum();

            Item item = itemMapper.selectBySerialNum(itemId);
            int itemNum = item.getNumber() - item_num;
            item.setNumber(itemNum);
            itemMapper.updateItemNum(itemNum, itemId);

            Order new_order = new Order();

            new_order.setCreateTime(date);
            new_order.setUpdateTime(date);
            new_order.setItemId(itemId);
            new_order.setBuyerId(sid);
            new_order.setItemNum(item_num);
            new_order.setOrderId(order_id);
//            new_order.setSum_price(total);
            orderMapper.generateNewOrder(new_order);
        }
        modelAndView.setViewName("checkout");
        return modelAndView;
    }

    @Override
    public ModelAndView addCart(String itemId, String itemNum, HttpSession session, ModelAndView modelAndView) {
        System.out.println(itemId);

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();
        Cart cart = cartMapper.checkItemInMyCart(itemId, sid);
        if (cart == null){
            Cart new_item = new Cart();
            new_item.setMemberSid(member.getSid());
            new_item.setItemId(itemId);
            new_item.setItemNum(Integer.valueOf(itemNum));
            cartMapper.addCart(new_item);
        }else{
            cart.setItemNum(cart.getItemNum() + 1);
            cartMapper.addCartNum(cart);
        }
        modelAndView.setViewName("cart");
        return modelAndView;

    }
}
