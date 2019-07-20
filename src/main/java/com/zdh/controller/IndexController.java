package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.mappers.ItemMapper;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
public class IndexController implements InitializingBean, ServletContextAware {

    @Autowired
    ItemMapper itemMapper;

    @RequestMapping("/index/backindex")
    public String backindex(Model model){

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        model.addAttribute("wts_item",wts_item3);


        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        model.addAttribute("wtb_item",wtb_item3);
        return "redirect:/index.jsp";


    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        System.out.println("setServletContext");
        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        servletContext.setAttribute("wts_item",wts_item3);


        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        servletContext.setAttribute("wtb_item",wtb_item3);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("newestitems",itemList);


    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }
}
