package com.zdh.controller;

import com.zdh.service.ItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

@Controller
public class IndexController implements ServletContextAware {

    @Resource
    ItemService itemService;

    @RequestMapping("/index/backindex")
    public ModelAndView goIndex(ModelAndView modelAndView){
        return itemService.getIndexItem(modelAndView);
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        itemService.getIndexItem(servletContext);
    }

}
