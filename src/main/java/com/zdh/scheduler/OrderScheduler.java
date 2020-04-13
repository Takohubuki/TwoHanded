package com.zdh.scheduler;

import com.zdh.bean.Order;
import com.zdh.mappers.OrderMapper;
import com.zdh.service.ItemService;
import com.zdh.util.TimeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class OrderScheduler {

    private Logger logger = LoggerFactory.getLogger(OrderScheduler.class);

    private Date now = null;

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private ItemService itemService;

    @Scheduled(cron = "0 0/30 * * * ?")
    public void cancelOrder() {

        logger.info("开始检查未付款订单");

        now = new Date();
        Date expireDate;
        List<Order> orderToCancel = new ArrayList<>();


        List<Order> unpaidOrder = orderMapper.getUnpaidOrder();
        for (Order order : unpaidOrder) {
            Date createTime = order.getCreateTime();
            expireDate = TimeUtils.daysFrom(1, createTime);
            if (expireDate.before(now)) {
                order.setIsCanceled(true);
                orderToCancel.add(order);
            }
        }
        orderMapper.batchCancelOrder(orderToCancel);

        logger.info("将订单内商品回归库存");

        itemService.returnItemsFromOrder(orderToCancel);

        logger.info("处理完成");
    }
}
