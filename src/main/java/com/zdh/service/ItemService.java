package com.zdh.service;

import com.zdh.bean.Item;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import java.util.List;

public interface ItemService {
    /**
     * 根据id查询商品信息
     * @param modelAndView
     * @param itemId
     * @return
     */
    public ModelAndView selectById(ModelAndView modelAndView, String itemId);

    /**
     * 获取首页展示商品信息
     * @param modelAndView
     * @return
     */
    public ModelAndView getIndexItem(ModelAndView modelAndView);

    /**
     * 获取首页展示商品
     * @param servletContext
     */
    public void getIndexItem(ServletContext servletContext);

    /**
     * 获取推荐的同类型商品
     * @param kind
     * @param item
     * @return
     */
    public List<Item> recommendSameKind(String kind, Item item);
}
