package com.zdh.service.impl;

import com.alibaba.fastjson.JSON;
import com.zdh.bean.*;
import com.zdh.mappers.*;
import com.zdh.service.ManagerService;
import com.zdh.service.NoticeService;
import com.zdh.service.ScheduledTaskService;
import com.zdh.util.Constant;
import com.zdh.util.PasswordUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Resource
    ManagerMapper managerMapper;

    @Resource
    ItemMapper itemMapper;

    @Resource
    OrderMapper orderMapper;

    @Resource
    MemberMapper memberMapper;

    @Resource
    private NoticeService noticeService;

    @Resource
    private ItemKindMappers itemKindMapper;

    @Resource
    private ScheduledTaskService scheduledTaskService;

    @Override
    public ModelAndView login(String username, String password, ModelAndView modelAndView, HttpSession session) {
        Manager manager = managerMapper.selectByName(username);
        if (manager == null) {
            modelAndView.addObject("manager_message", "用户名错误！");
            modelAndView.setViewName("manage/login");
            return modelAndView;
        } else if (!PasswordUtils.passwordConfirm(manager.getPassword(), password)) {
            modelAndView.addObject("manager_message", "密码错误！");
            modelAndView.setViewName("manage/login");
            return modelAndView;
        }else if (PasswordUtils.passwordConfirm(manager.getPassword(),password)){
            session.setAttribute("manager",manager);
            /*
            管理员登录成功进入后台管理页面
             */
            return getGeneralSituation(modelAndView);
        }else {
            modelAndView.setViewName("manage/login");
            return modelAndView;
        }
    }

    @Override
    public ModelAndView logout(HttpSession session, ModelAndView modelAndView) {
        session.setAttribute("manager", null);
        modelAndView.setViewName("manage/login");
        return modelAndView;
    }

    @Override
    public ModelAndView order(ModelAndView modelAndView) {
        ScheduledTask delOrder = scheduledTaskService.getTTaskByName("delOrder");
        Boolean flag = delOrder.getSwich();

        List<Order> orders = orderMapper.selectAllOrder();
        modelAndView.addObject("orderlist", orders);
        modelAndView.addObject("delOrderSwitch", flag);
        modelAndView.setViewName("manage/order");
        return modelAndView;
    }

    @Override
    public ModelAndView generalSituation(ModelAndView modelAndView) {
        return getGeneralSituation(modelAndView);
    }

    @Override
    public ModelAndView manageMember(ModelAndView modelAndView) {
        List<Member> members = memberMapper.selectAllMember();
        modelAndView.addObject("memberlist", members);
        modelAndView.setViewName("manage/member");
        return modelAndView;
    }

    @Override
    public ModelAndView manageWtsItem(ModelAndView modelAndView) {
        List<Item> items = itemMapper.selectWtsAllByTime();
        modelAndView.addObject("itemlist", items);
        modelAndView.setViewName("manage/wtsManage");
        return modelAndView;

    }

    @Override
    public ModelAndView manageWtbItem(ModelAndView modelAndView) {
        List<Item> items = itemMapper.selectWtbAllByTime();
        modelAndView.addObject("itemlist", items);
        modelAndView.setViewName("manage/wtbManage");
        return modelAndView;

    }

    @Override
    public ModelAndView offItem(ModelAndView modelAndView, String itemId) {
        managerMapper.offItem(itemId);
        List<Item> items = managerMapper.selectAllSellItems();
        modelAndView.addObject("itemlist", items);
        modelAndView.setViewName("manage/wtsManage");
        return modelAndView;

    }

    @Override
    public ModelAndView shutMember(ModelAndView modelAndView, String sid) {
        managerMapper.shutMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        modelAndView.addObject("memberlist", members);
        modelAndView.setViewName("manage/member");
        return modelAndView;
    }

    @Override
    public ModelAndView activeMember(ModelAndView modelAndView, String sid) {
        managerMapper.activeMember(sid);
        List<Member> members = managerMapper.selectAllMember();
        modelAndView.addObject("memberlist", members);
        modelAndView.setViewName("manage/member");
        return modelAndView;
    }

    @Override
    public ModelAndView approval(ModelAndView modelAndView) {
        List<Item> approvalItem = itemMapper.getApprovalItem();
        modelAndView.addObject("infoList", approvalItem);
        modelAndView.setViewName("manage/approvalPublishInfo");
        return modelAndView;
    }

    @Override
    public String accessInfo(String id) {

        Item item = itemMapper.selectBySerialNum(id);
        item.setIsUndercarriage(false);
        item.setUndercarriageReason("");

        String text = "管理员已同意您的 " + item.getName() + " 的发布申请";

        noticeService.newNotice(text, item.getPublisher());
        itemMapper.updateItemInfo(item);
        return "上架成功！";
    }

    @Override
    public String denyInfo(String id, String reason) {

        Item item = itemMapper.selectBySerialNum(id);
        item.setIsUndercarriage(true);
        item.setUndercarriageReason(reason);

        String text;
        if (StringUtils.isEmpty(reason)) {
            text = "管理员拒绝了您发布 " + item.getName() + " 的申请";
        } else {
            text = "管理员拒绝了您发布 " + item.getName() + " 的申请：" + reason;
        }

        noticeService.newNotice(text, item.getPublisher());
        itemMapper.updateItemInfo(item);
        return "success";
    }

    @Override
    public String itemKindManage() {
        List<String> kindList = itemKindMapper.getKindList();
        return JSON.toJSON(kindList).toString();
    }

    @Override
    public String addItemKind(String newKind) {
        ItemKind itemKind = new ItemKind();
        itemKind.setKindName(newKind);
        itemKindMapper.insertSelective(itemKind);
        return Constant.SUCCESS_CODE;
    }

    private ModelAndView getGeneralSituation(ModelAndView modelAndView) {
        Integer member_sum = managerMapper.countMember();
        Integer countItemWtbOnCarriiage = managerMapper.countItemWtbOnCarriiage();
        Integer countItemWtsOnCarriiage = managerMapper.countItemWtsOnCarriiage();
        Integer orderedToday = managerMapper.orderedToday();
        Integer loginToday = managerMapper.selectLoginToday();
        Integer item_wts_sum_today = managerMapper.countItemWtsToday();
        Integer item_wtb_sum_today = managerMapper.countItemWtbToday();
        Integer order_total = managerMapper.countOrderTotal();
        Integer infoToHandle = managerMapper.countInfoToHandle();

        Map<String, Integer> param = new HashMap<>();

        param.put("loginToday", loginToday);
        param.put("item_wts_sum_today", item_wts_sum_today);
        param.put("item_wtb_sum_today", item_wtb_sum_today);
        param.put("order_total", order_total);
        param.put("member_sum", member_sum);
        param.put("item_wts_sum", countItemWtsOnCarriiage);
        param.put("item_wtb_sum", countItemWtbOnCarriiage);
        param.put("order_today", orderedToday);
        param.put("infoToHandle", infoToHandle);

        modelAndView.addObject("generalSit", param);
        modelAndView.setViewName("manage/backstage");
        return modelAndView;
    }

}
