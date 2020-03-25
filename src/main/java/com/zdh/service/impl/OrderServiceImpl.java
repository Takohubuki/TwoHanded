package com.zdh.service.impl;

import com.zdh.bean.Cart;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.CartMapper;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.OrderMapper;
import com.zdh.pay.AliPayDemo;
import com.zdh.service.OrderService;
import com.zdh.util.AmountUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

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
        ArrayList<String> item_ids = new ArrayList<>();
        ArrayList<Integer> item_num = new ArrayList<>();
        ArrayList<Item> itemList = new ArrayList<>();
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
    public ModelAndView checkOut(String[] cartList, HttpSession session, ModelAndView modelAndView) throws Exception {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        String orderId = "";
        Date date = new Date();
        //获取前台传来的购物车列表
        for (String cartItem : cartList) {
            String[] s = cartItem.split("_");
            String itemId = s[0];
            String item_num = s[1];
            Integer integer = Integer.valueOf(item_num);

            Item item = itemMapper.selectBySerialNum(itemId);
            int itemNum = item.getNumber() - integer;

            item.setNumber(itemNum);
            if (itemNum <= 0){
                item.setIsUndercarriage(true);
                item.setUndercarriageReason("库存不足");
            }
            itemMapper.updateItemInfo(item);

            Order order = generateOrder(sid, itemId, integer, date);
            int i = integer * item.getPrice();

            String sum = String.valueOf(i);
            order.setSumPrice("¥" + sum);
            orderId = order.getOrderId();
            orderMapper.generateNewOrder(order);

            cartMapper.removeCart(sid, itemId);
        }
        modelAndView.addObject("orderId", orderId);
        modelAndView.setViewName("checkout");
        return modelAndView;

    }

    @Override
    public String addCart(Item item, HttpSession session, ModelAndView modelAndView) {

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();
        String itemId = item.getSerialNum();

        Cart cart = cartMapper.checkItemInMyCart(sid, itemId);
        if (cart == null){
            Cart new_item = new Cart();
            new_item.setMemberSid(member.getSid());
            new_item.setItemId(itemId);
            new_item.setItemNum(1);
            cartMapper.addCart(new_item);
        }else{
            cart.setItemNum(cart.getItemNum() + 1);
            cartMapper.addCartNum(cart);
        }
        return "success";
    }

    @Override
    public String updateCartNum(String id, String num, HttpSession session) {

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();
        Cart cart = cartMapper.checkItemInMyCart(sid, id);
        cart.setItemNum(Integer.valueOf(num));
        cartMapper.updateByPrimaryKey(cart);

        return "success";
    }

    @Override
    public ModelAndView myOrder(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Order> orderList = orderMapper.selectMyOrder(sid);
        modelAndView.addObject("my_order_list",orderList);
        modelAndView.setViewName("allOrder");
        return modelAndView;
    }

    @Override
    public void alipay(String orderId, HttpServletResponse response, HttpServletRequest request) throws Exception {

        List<Order> orderByOrderId = orderMapper.getOrderByOrderId(orderId);

        double totalAmount = 0;
        double amount;
        Map map = new HashMap();
        map.put("method", "alipay");
        map.put("orderId", orderId);
        orderMapper.updatePayMethod(map);

        for (Order order : orderByOrderId) {
            amount = AmountUtils.getAmount(order.getSumPrice());
            totalAmount = totalAmount + amount;
        }

        map.put("totalAmount", String.valueOf(totalAmount));
        map.put("itemName", "HRBU二手交易下单");
        AliPayDemo.jumpToAliPay(request, response, map);
    }

    @Override
    public ModelAndView cashpay(ModelAndView modelAndView, String orderId) {
        Map map = new HashMap();
        map.put("orderId", orderId);
        map.put("method", "cashpay");
        orderMapper.updatePayMethod(map);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    private Order generateOrder(String sid, String itemId, int itemNum, Date sysDate){
        //生成新订单
        Order new_order = new Order();

        //生成订单号
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm");
        String format = simpleDateFormat.format(sysDate);
        String order_id = sid + format;

        new_order.setCreateTime(sysDate);
        new_order.setUpdateTime(sysDate);
        new_order.setItemId(itemId);
        new_order.setBuyerId(sid);
        new_order.setItemNum(itemNum);
        new_order.setOrderId(order_id);
        new_order.setIsCanceled(false);
        new_order.setIsChecked(true);
        new_order.setIsPaid(true);
        new_order.setIsReceived(false);
        return new_order;
    }

}
