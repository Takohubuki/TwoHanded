package com.zdh.scheduler;

import com.zdh.bean.Order;
import com.zdh.bean.ScheduledTask;
import com.zdh.mappers.OrderMapper;
import com.zdh.service.ItemService;
import com.zdh.service.ScheduledTaskService;
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

    @Resource
    private ScheduledTaskService scheduledTaskService;

    /**
     * 检查是否有过期未付订单
     * 30分钟执行一次
     */
    @Scheduled(cron = "0 0/30 * * * ?")
    public void cancelOrder() {

        logger.info("开始检查未付款订单");

        now = new Date();
        Date expireDate;
        List<Order> orderToCancel = new ArrayList<>();

        List<Order> unpaidOrder = orderMapper.getUnpaidOrder();
        if (unpaidOrder == null || unpaidOrder.size() <= 1) {
            logger.info("无需处理");
            return;
        }

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

    /**
     * 检查超过4年的订单
     * 并将其改为可删除状态
     * 24小时执行一次
     */
    @Scheduled(cron = "0 0 0/24 * * ?")
    public void deletableOrder() {

        logger.info("开始检查可以删除的订单");

        now = new Date();
        Date expireDate;
        List<Order> deletableOrder = new ArrayList<>();

        List<Order> orderList = orderMapper.selectAllOrder();

        if (orderList == null || orderList.size() <= 1) {
            logger.info("没有符合条件的订单");
            return;
        }
        for (Order order : orderList) {

            expireDate = TimeUtils.yearsFrom(4, order.getUpdateTime());

            if (expireDate.before(now)) {
                order.setDisplay("E");
                deletableOrder.add(order);
            }

        }

        orderMapper.batchUpdate(deletableOrder);

        logger.info("处理完成");
    }

    /**
     * 检查可删除的订单
     * 24小时执行一次
     */
    @Scheduled(cron = "0 0 0/24 * * ?")
    public void batchDelOrder() {

        ScheduledTask delOrder = scheduledTaskService.getTTaskByName("delOrder");
        if (!delOrder.getSwich()) {
            return;
        }

        logger.info("开始自动删除订单");

        orderMapper.batchDelOrder();

        logger.info("处理完成");
    }


}
