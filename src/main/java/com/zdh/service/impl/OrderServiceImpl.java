package com.zdh.service.impl;

import com.zdh.bean.Cart;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.CartMapper;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.MemberMapper;
import com.zdh.mappers.OrderMapper;
import com.zdh.pay.AliPayDemo;
import com.zdh.service.ItemService;
import com.zdh.service.NoticeService;
import com.zdh.service.OrderService;
import com.zdh.util.AmountUtils;
import com.zdh.util.Constant;
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
    MemberMapper memberMapper;

    @Resource
    OrderMapper orderMapper;

    @Resource
    ItemMapper itemMapper;

    @Resource
    CartMapper cartMapper;

    @Resource
    private ItemService itemService;

    @Resource
    private NoticeService noticeService;

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
        modelAndView.setViewName("main/cart");
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

            //更新商品库存
            item.setNumber(itemNum);
            if (itemNum <= 0) {
                item.setIsUndercarriage(true);
                item.setUndercarriageReason("已经售罄");

                //通知卖家库存不足
                String text = "您的 " + item.getName() + " 已经售罄";
                noticeService.newNotice(text, item.getPublisher());
            }
            itemMapper.updateItemInfo(item);

            //生成订单
            Order order = generateOrder(sid, itemId, integer, date);
            int i = integer * item.getPrice();

            String sum = String.valueOf(i);
            order.setSumPrice("¥" + sum);
            orderId = order.getOrderId();
            orderMapper.generateNewOrder(order);

            //从购物车中移除
            Map map = new HashMap();
            map.put("itemId", itemId);
            map.put("sid", sid);

            cartMapper.removeCart(map);

            //通知卖家
            String text = member.getUsername() + "已经拍下您的商品 " + item.getName();
            noticeService.newNotice(text, item.getPublisher());
        }
        modelAndView.addObject("orderId", orderId);
        modelAndView.setViewName("main/checkout");
        return modelAndView;

    }

    @Override
    public String addCart(Item item, HttpSession session, ModelAndView modelAndView) {

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();
        String itemId = item.getSerialNum();

        if (sid.equals(item.getPublisher())) {
            return Constant.BUY_OWN_ITEM;
        }

        Map map = new HashMap();
        map.put("itemId", itemId);
        map.put("sid", sid);

        Cart cart = cartMapper.checkItemInMyCart(map);
        if (cart == null) {
            Cart new_item = new Cart();
            new_item.setMemberSid(member.getSid());
            new_item.setItemId(itemId);
            new_item.setItemNum(1);
            cartMapper.addCart(new_item);
        }else{
            cart.setItemNum(cart.getItemNum() + 1);
            cartMapper.addCartNum(cart);
        }
        return Constant.SUCCESS_CODE;
    }

    @Override
    public String updateCartNum(String id, String num, HttpSession session) {

        Member member = (Member) session.getAttribute("member");

        String sid = member.getSid();

        Map map = new HashMap();
        map.put("itemId", id);
        map.put("sid", sid);

        Cart cart = cartMapper.checkItemInMyCart(map);
        cart.setItemNum(Integer.valueOf(num));
        cartMapper.updateByPrimaryKey(cart);

        return "success";
    }

    @Override
    public ModelAndView myOrder(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Order> orderList = orderMapper.selectMyOrder(sid);
        modelAndView.addObject("my_order_list", orderList);
        modelAndView.setViewName("userCenter/myBuying");
        return modelAndView;
    }

    @Override
    public void alipay(String orderId, HttpServletResponse response, HttpServletRequest request) throws Exception {

        List<Order> orderByOrderId = orderMapper.selectOrderAndItems(orderId);

        double totalAmount = 0;
        double amount;

        for (Order order : orderByOrderId) {
            amount = AmountUtils.getAmount(order.getSumPrice());
            totalAmount = totalAmount + amount;

            Member member = memberMapper.selectByPrimaryKey(order.getBuyerId());
            String text = member.getUsername() + "已经付款";
            noticeService.newNotice(text, order.getItem().getPublisher());
        }

        Map map = new HashMap();
        map.put("method", "alipay");
        map.put("orderId", orderId);
        orderMapper.updatePayMethod(map);

        //前往支付宝页面
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

    @Override
    public String delCart(String id, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();

        Map map = new HashMap();
        map.put("itemId", id);
        map.put("sid", sid);
        cartMapper.removeCart(map);
        return "success";
    }

    @Override
    public void cfmGetItem(String orderId, String itemId) {
        List<String> sellerList = new ArrayList<>();
        List<Order> orderByOrderId = orderMapper.selectOrderAndItems(orderId);
        for (Order order : orderByOrderId) {
            if (itemId.equals(order.getItem().getSerialNum())) {
                String publisher = order.getItem().getPublisher();
                sellerList.add(publisher);

                Member member = memberMapper.selectByPrimaryKey(order.getBuyerId());
                String text = member.getUsername() + "已经确认收货，订单完成";
                noticeService.newNotice(text, order.getItem().getPublisher());
            }
        }
        memberMapper.updateTradRecord(sellerList);
        orderMapper.cfmGetItem(orderId, itemId);
    }

    @Override
    public ModelAndView payLater(String orderId, ModelAndView modelAndView) {
        modelAndView.addObject("orderId", orderId);
        modelAndView.setViewName("main/checkout");
        return modelAndView;
    }

    @Override
    public ModelAndView cancelOrder(String orderId, ModelAndView modelAndView) {

        List<Order> orders = orderMapper.selectOrderAndItems(orderId);

        itemService.returnItemsFromOrder(orders);

        for (Order order : orders) {
            order.setUpdateTime(new Date());

            Member member = memberMapper.selectByPrimaryKey(order.getBuyerId());
            String text = member.getUsername() + "取消了订单";
            noticeService.newNotice(text, order.getItem().getPublisher());

        }

        orderMapper.batchCancelOrder(orders);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @Override
    public void hideOrder(String orderId, String type) {

        if ("D".equals(type)) {
            orderMapper.delOrder(orderId);
        } else {
            List<Order> orderByOrderId = orderMapper.getOrderByOrderId(orderId);
            if (!"U".equals(orderByOrderId.get(0).getDisplay())) {
                type = "D";
            }
            Map param = new HashMap();
            param.put("orderId", orderId);
            param.put("type", type);
            orderMapper.hideOrder(param);
        }
    }

    @Override
    public List<Order> manageOrderByTime(String startTime, String endTime) {
        Map param = new HashMap();
        param.put("startTime", startTime);
        param.put("endTime", endTime);
        return orderMapper.getOrderByTime(param);

    }

    @Override
    public void delOrder(String orderId) {
        orderMapper.delOrder(orderId);
    }

    private Order generateOrder(String sid, String itemId, int itemNum, Date sysDate) {
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
        new_order.setIsChecked(false);
        new_order.setIsPaid(false);
        new_order.setIsReceived(false);
        return new_order;
    }

}
