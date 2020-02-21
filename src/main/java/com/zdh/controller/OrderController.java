package com.zdh.controller;


import com.zdh.bean.Cart;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.CartMapper;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
//TODO 用cookie实现购物车
@RequestMapping("/order")
public class OrderController {

    @Autowired
    CartMapper cartMapper;

    @Autowired
    ItemMapper itemMapper;

    @Autowired
    OrderMapper orderMapper;
    //TODO 添加购物车内商品
    @RequestMapping("/addcart")
    public String addCart(@RequestParam("item_id") String item_id,
                          @RequestParam(value = "item_num" ,required = false, defaultValue = "1") String item_num,
                          HttpServletResponse response,
                          HttpSession session){

        System.out.println(item_id);

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();
        Cart cart = cartMapper.checkItemInMyCart(item_id, sid);
        if (cart == null){
            Cart new_item = new Cart();
            new_item.setMember_sid(member.getSid());
            new_item.setItem_id(item_id);
            new_item.setNumber(Integer.valueOf(item_num));
            cartMapper.addCart(new_item);
        }else{
            cart.setNumber(cart.getNumber() + 1);
            cartMapper.addCartNum(cart);
        }

        return "cart";
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

    @RequestMapping("/checkout")
    public String checkOut(@RequestParam("item_serial_num") String[] item_serial_num,
                           @RequestParam("quantity")String[] quantity,
                           @RequestParam("total")String total,
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

            Item item = itemMapper.selectBySerialNum(item_id);
            int itemnumber = item.getNumber() - item_num;
            item.setNumber(itemnumber);
            itemMapper.updateItemNum(itemnumber, item_id);

            Order new_order = new Order();

            new_order.setCreate_time(date);
            new_order.setUpdate_time(date);
            new_order.setItem_id(item_id);
            new_order.setBuyer_id(sid);
            new_order.setItem_num(item_num);
            new_order.setOrder_id(order_id);
            new_order.setSum_price(total);
            orderMapper.generateNewOrder(new_order);
        }

        return "checkout";
    }

    @RequestMapping("/mycart")
    public String myCart(HttpSession session, Model model){
        Member member = (Member) session.getAttribute("member");
        List<String> item_ids = new ArrayList<>();
        List<Integer> item_num = new ArrayList<>();
        List<Item> itemList = new ArrayList<>();
        if (member != null){
            List<Cart> carts = orderMapper.selectMyCart(member.getSid());
            for (int i = 0; i < carts.size(); i++) {
                Cart cart = carts.get(i);
                item_ids.add(cart.getItem_id());
                item_num.add(cart.getNumber());
                Item item = itemMapper.selectBySerialNum(cart.getItem_id());
                itemList.add(item);
            }
            model.addAttribute("item_list", itemList);
            model.addAttribute("item_id_list", item_ids);
            model.addAttribute("item_num_list", item_num);
        }else{

        }
        return "cart";
    }
}
