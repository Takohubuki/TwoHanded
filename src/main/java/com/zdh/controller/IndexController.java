package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.mappers.ItemMapper;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.util.List;

@Controller
public class IndexController implements InitializingBean, ServletContextAware {

    @Autowired
    ItemMapper itemMapper;

    @RequestMapping("/index/backindex")
    public String backindex(){
        
        return "redirect:/index.jsp";


    }

    @RequestMapping("/index")
    public String index(Model model){
        System.out.println("首页控制器执行");
        List<Item> itemList = itemMapper.select3ByTime();
        model.addAttribute("newestitems",itemList);
        return "redirect:/index.jsp";
    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        System.out.println("setServletContext");
        List<Item> itemList = itemMapper.select3ByTime();
        servletContext.setAttribute("newestitems",itemList);
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.addObject("newestitems",itemList);


    }
}
