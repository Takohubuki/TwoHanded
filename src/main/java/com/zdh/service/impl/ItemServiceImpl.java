package com.zdh.service.impl;

import com.zdh.bean.Item;
import com.zdh.mappers.ItemMapper;
import com.zdh.service.ItemService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private ItemMapper itemMapper;

    @Override
    public ModelAndView selectById(ModelAndView modelAndView, String itemId) {

        Item item = itemMapper.selectBySerialNum(itemId);

        String kind = item.getKind();
        List<Item> items = recommendSameKind(kind, item);

//        List<Item> recommand_items = itemMapper.RecommandSameKind(kind);
//        recommand_items.remove(item);

        modelAndView.addObject("item", item);
        modelAndView.addObject("recommand_items",items);
        modelAndView.setViewName("singleitem");

        return modelAndView;
    }

    @Override
    public ModelAndView getIndexItem(ModelAndView modelAndView) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        modelAndView.addObject("wts_item",wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        modelAndView.addObject("wtb_item",wtb_item3);

        modelAndView.setViewName("/index.jsp");
        return modelAndView;
    }

    @Override
    public void getIndexItem(ServletContext servletContext) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        servletContext.setAttribute("wts_item",wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        servletContext.setAttribute("wtb_item",wtb_item3);

    }

    @Override
    public List<Item> recommendSameKind(String kind, Item item) {
        List<Item> items = itemMapper.RecommandSameKind(kind);
        items.remove(item);
        return items;
    }
}
