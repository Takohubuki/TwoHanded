package com.zdh.service.impl;

import com.zdh.bean.Manager;
import com.zdh.bean.Order;
import com.zdh.mappers.ManagerMapper;
import com.zdh.service.ManagerService;
import com.zdh.util.PasswordUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Resource
    ManagerMapper managerMapper;

    @Override
    public ModelAndView login(String username, String password, ModelAndView modelAndView, HttpSession session) {
        Manager manager = managerMapper.selectByName(username);
        if (manager == null){
            modelAndView.addObject("manager_message","用户名错误！");
            modelAndView.setViewName("managerLogin");
            return modelAndView;
        }else if (!PasswordUtils.passwordConfirm(manager.getPassword(),password)){
            modelAndView.addObject("manager_message","密码错误！");
            modelAndView.setViewName("managerLogin");
            return modelAndView;
        }else if (PasswordUtils.passwordConfirm(manager.getPassword(),password)){
            session.setAttribute("manager",manager);
            /*
            管理员登录成功进入后台管理页面
             */
            return getGeneralSituation(modelAndView);
        }else {
            modelAndView.setViewName("managerLogin");
            return modelAndView;
        }
    }

    @Override
    public ModelAndView logout(HttpSession session, ModelAndView modelAndView) {
        session.setAttribute("manager",null);
        modelAndView.setViewName("managerLogin");
        return modelAndView;
    }

    @Override
    public ModelAndView order(ModelAndView modelAndView) {
        List<Order> orders = managerMapper.selectAllOrder();
        modelAndView.addObject("orderlist",orders);
        modelAndView.setViewName("orderManage");
        return modelAndView;

    }

    @Override
    public ModelAndView generalSituation(ModelAndView modelAndView) {
        return getGeneralSituation(modelAndView);
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

        modelAndView.addObject("loginToday",loginToday);
        modelAndView.addObject("item_wts_sum_today",item_wts_sum_today);
        modelAndView.addObject("item_wtb_sum_today",item_wtb_sum_today);
        modelAndView.addObject("order_total",order_total);
        modelAndView.addObject("member_sum",member_sum);
        modelAndView.addObject("item_wts_sum",countItemWtsOnCarriiage);
        modelAndView.addObject("item_wtb_sum",countItemWtbOnCarriiage);
        modelAndView.addObject("order_today",orderedToday);

        modelAndView.setViewName("backstage");
        return modelAndView;
    }

}
