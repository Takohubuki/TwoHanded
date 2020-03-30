package com.zdh.controller;

import com.zdh.service.ItemService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

@RestController
public class IndexController implements ServletContextAware {

    @Resource
    ItemService itemService;

    @RequestMapping("/index/backindex")
    public ModelAndView goIndex(ModelAndView modelAndView, RedirectAttributes redirectAttributes){
        return itemService.getIndexItem(modelAndView, redirectAttributes);
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        itemService.getIndexItem(servletContext);
    }

}
