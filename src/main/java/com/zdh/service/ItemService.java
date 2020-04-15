package com.zdh.service;

import com.zdh.bean.Item;
import com.zdh.bean.Order;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
     * @param redirectAttributes
     * @return
     */
    public ModelAndView getIndexItem(ModelAndView modelAndView, RedirectAttributes redirectAttributes);

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

    /**
     * 时间降序获取求购信息列表
     * @param modelAndView
     * @return
     */
    public ModelAndView listWtbByTime(ModelAndView modelAndView);

    /**
     * 时间降序获取出售商品列表
     * @param modelAndView
     * @return
     */
    public ModelAndView listWtsByTime(ModelAndView modelAndView);

    /**
     * 商品信息分页列表
     * @param modelAndView
     * @param pageNum
     * @param request
     * @return
     */
    public ModelAndView itemPage(ModelAndView modelAndView, int pageNum, HttpServletRequest request);

    /**
     * 获取求购信息
     * @param itemId
     * @param modelAndView
     * @return
     */
    public ModelAndView wtbItem(String itemId, ModelAndView modelAndView);

    /**
     * 获取全部出售信息
     * @param modelAndView
     * @return
     */
    public ModelAndView queryWtsAllTime(ModelAndView modelAndView);

    /**
     * 发布出售求购信息
     * @param item
     * @param modelAndView
     * @param session
     * @param file
     * @param request
     * @return
     */
    public ModelAndView addPublish(Item item, ModelAndView modelAndView, HttpSession session, MultipartFile file, HttpServletRequest request) throws IOException;

    /**
     * 根据名称查询商品信息
     * @param modelAndView
     * @param search
     * @return
     */
    public ModelAndView searchByName(ModelAndView modelAndView, String search);

    /**
     * 根据类别查询商品信息
     * @param modelAndView
     * @param kind
     * @return
     */
    public ModelAndView searchByKind(ModelAndView modelAndView, String kind);

    /**
     * 更新商品信息
     * @param modelAndView
     * @param itemId
     * @return
     */
    public ModelAndView updateItemInfo(ModelAndView modelAndView, String itemId);

    /**
     *
     * @param modelAndView
     * @param item
     * @param file
     * @param request
     * @return
     */
    public ModelAndView updateItem(ModelAndView modelAndView, Item item, MultipartFile file, HttpServletRequest request) throws IOException;

    public void returnItemsFromOrder(List<Order> orderList);

    String offMyItem(String reason, String itemId);
}
