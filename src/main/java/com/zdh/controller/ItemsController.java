package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.mappers.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    ItemMapper itemMapper;
    //跳转商品详情页
    @RequestMapping("/singleitem")
    public String singleitem(Model model, String itemname){
        Item item = itemMapper.selectItemOnSellByName();
        model.addAttribute("item",item);
        return "singleitem";
    }

    //跳转最新商品列表页
    @RequestMapping("/queryalltime")
    public String query(Model model){
        List<Item> items = itemMapper.selectAllByTime();
        model.addAttribute("itemlist",items);
        return "itemlist";
    }
}
