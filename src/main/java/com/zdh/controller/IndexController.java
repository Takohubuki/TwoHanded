package com.zdh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
    @RequestMapping("/backindex")
    public String backindex(){

        return "redirect:/index.jsp";


    }
}
