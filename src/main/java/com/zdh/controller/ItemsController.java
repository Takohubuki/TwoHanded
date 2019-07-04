package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.mappers.ItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    ItemMapper itemMapper;

    //跳转求购商品详情页
    @RequestMapping("/wtbitem")
    public String wtbitem(String itemname, Model model){
        Item wtb_item = itemMapper.select1WtbItemByName(itemname);
        model.addAttribute("wtb_item",wtb_item);
        return "wtbitem";
    }

    //跳转出售商品详情页
    @RequestMapping("/singleitem")
    public String singleitem(Model model, String itemname){
        Item item = itemMapper.select1WtsItemByName(itemname);
        model.addAttribute("item",item);
        return "singleitem";
    }

    //跳转最新出售商品列表页
    @RequestMapping("/queryalltime")
    public String query(Model model){
        List<Item> items = itemMapper.selectWtsAllByTime();
        model.addAttribute("itemlist",items);
        return "itemlist";
    }

    //发布信息
    @RequestMapping("/publish")
    public String publish(){
        System.out.println("----------------------------跳转发布信息页--------------------------");
        return "publish";
    }

    //发布信息存入数据库
    //返回主页时更新最新商品
    @RequestMapping("/addpublish")
    public String addpublish(Item item, Model model, HttpSession session){
        Member member = (Member) session.getAttribute("member");
        item.setPublisher(member.getUsername());
        Date date = new Date();
        item.setPublish_time(date);
        item.setUpdate_time(date);

        itemMapper.addpublish(item);
        List<Item> wtb_item = itemMapper.select3WtbItemByTime();
        List<Item> wts_item = itemMapper.select3WtsItemByTime();
        model.addAttribute("wtb_item",wtb_item);
        model.addAttribute("wts_item",wts_item);
        return "redirect:/index.jsp";
    }
}
