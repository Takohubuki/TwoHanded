package com.zdh.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdh.bean.Item;
import com.zdh.service.ItemKindService;
import com.zdh.service.ItemService;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/items")
public class ItemsController {

    @Resource
    private ItemService itemService;

    @Resource
    private ItemKindService itemKindService;

    /**
     * 转跳求购商品列表
     * 根据时间降序排列商品
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("/listWtbByTime")
    public ModelAndView listWtbByTime(ModelAndView modelAndView, int pageNum, String timeSort, String clickSort) {
        if (pageNum != 0){
            modelAndView.setViewName("main/itemListPage");
        }else {
            pageNum = 1;
            modelAndView.setViewName("main/itemList");
            timeSort = "desc";
        }
        PageHelper.startPage(pageNum,6);
        List<Item> wtbAllByTime = itemService.listWtbByTime(timeSort, clickSort);
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtbAllByTime);
        modelAndView.addObject("wtbPageInfo", itemPageInfo);

        List<String> kindList = itemKindService.getAllKind();
        modelAndView.addObject("kindList", kindList);

        modelAndView.addObject("pageType", "listWtbByTime");

        return modelAndView;
    }

    /**
     * 转跳出售商品列表
     * 根据时间降序排列商品
     * @param modelAndView
     * @return
     */
    @RequestMapping("/listWtsByTime")
    public ModelAndView listWtsByTime(ModelAndView modelAndView, int pageNum, String timeSort, String clickSort){
        if (pageNum != 0){
            modelAndView.setViewName("main/itemListPage");
        }else {
            pageNum = 1;
            modelAndView.setViewName("main/itemList");
            timeSort = "desc";
        }
        PageHelper.startPage(pageNum,6);
        List<Item> wtsAllByTime = itemService.listWtsByTime(timeSort, clickSort);
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsAllByTime);
        modelAndView.addObject("wtsPageInfo", itemPageInfo);

        List<String> kindList = itemKindService.getAllKind();
        modelAndView.addObject("kindList", kindList);

        modelAndView.addObject("pageType", "listWtsByTime");

        return modelAndView;

    }


    /**
     * 跳转求购商品详情页
     * @param itemId
     * @param modelAndView
     * @return
     */
    @RequestMapping("/wtbitem")
    public ModelAndView wtbItem(String itemId, ModelAndView modelAndView){
        return itemService.wtbItem(itemId, modelAndView);
    }

    /**
     * 跳转出售商品详情页
     * @param modelAndView
     * @param itemId
     * @return
     */
    @RequestMapping("/singleitem")
    public ModelAndView singleItem(ModelAndView modelAndView, String itemId){
        return itemService.selectById(modelAndView, itemId);
    }

    /**
     * 发布信息
     * @return
     */
    @RequestMapping("/publish")
    public ModelAndView publish(ModelAndView modelAndView) {
        List<String> allKind = itemKindService.getAllKind();
        modelAndView.addObject("kindList", allKind);
        modelAndView.setViewName("main/publish");
        return modelAndView;
    }

    /**
     * 发布信息存入数据库
     * 返回主页时更新最新商品
     * @param item
     * @param modelAndView
     * @param session
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/addpublish")
    public ModelAndView addPublish(Item item, ModelAndView modelAndView, HttpSession session, @RequestParam("imagefile") MultipartFile file, HttpServletRequest request) throws IOException {
        return itemService.addPublish(item, modelAndView, session, file, request);
    }

    /**
     * 根据商品名查询
     * @param modelAndView
     * @param
     * @return
     */
    @RequestMapping("/searchByName")
    public ModelAndView searchByName(ModelAndView modelAndView, String searchName, int pageNum, String timeSort, String clickSort, String condition){
        if (pageNum != 0 && !StringUtils.isEmpty(condition)){
            PageHelper.startPage(pageNum, 3);
            List<Item> result = itemService.searchByName(searchName, timeSort, clickSort, condition);
            PageInfo<Item> itemPageInfo = new PageInfo<>(result);
            modelAndView.addObject(condition + "PageInfo", itemPageInfo);
            modelAndView.setViewName("main/itemListPage");
        }else if (!StringUtils.isEmpty(timeSort) || !StringUtils.isEmpty(clickSort)){
            HashMap<String, PageInfo<Item>> result = itemService.searchByName(searchName, timeSort, clickSort);

            modelAndView.addObject("wtsPageInfo", result.get("wts"));
            modelAndView.addObject("wtbPageInfo", result.get("wtb"));
            modelAndView.setViewName("main/itemListPage");
        }else if (pageNum == 0){
            HashMap<String, PageInfo<Item>> result = itemService.searchByName(searchName, "", "");

            modelAndView.addObject("wtsPageInfo", result.get("wts"));
            modelAndView.addObject("wtbPageInfo", result.get("wtb"));
            modelAndView.setViewName("main/itemList");
        }

        List<String> kindList = itemKindService.getAllKind();
        modelAndView.addObject("kindList", kindList);

        modelAndView.addObject("pageType", "searchByName");

        return modelAndView;
    }

    /**
     * 根据商品类型查询
     * @param modelAndView
     * @param kind
     * @return
     */
    @RequestMapping("/searchByKind")
    public ModelAndView searchByKind(ModelAndView modelAndView, String kind, int pageNum, String timeSort, String clickSort){
        if (pageNum != 0){
            modelAndView.setViewName("main/itemListPage");
        }else {
            pageNum = 1;
            modelAndView.setViewName("main/itemList");
        }

        PageHelper.startPage(pageNum,6);
        List<Item> items = itemService.searchByKind(kind, timeSort, clickSort);
        PageInfo<Item> itemPageInfo = new PageInfo<>(items);

        modelAndView.addObject("wtsPageInfo", itemPageInfo);

        List<String> kindList = itemKindService.getAllKind();
        modelAndView.addObject("kindList", kindList);

        modelAndView.addObject("pageType", "searchByKind");

        return modelAndView;
    }

    /**
     * 更新商品信息
     * @param modelAndView
     * @param item_id
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView updateItemInfo(ModelAndView modelAndView, String item_id) {
        return itemService.updateItemInfo(modelAndView, item_id);
    }

    @RequestMapping("/updateitem")
    public ModelAndView updateItem(ModelAndView modelAndView, Item item, @RequestParam("imagefile") MultipartFile file, HttpServletRequest request) throws IOException {
        return itemService.updateItem(modelAndView, item, file, request);
    }

    @RequestMapping(path = "/offMyItem", produces = {"text/plain;charset=UTF-8"})
    public String offMyItem(String reason, String itemId) {
        return itemService.offMyItem(reason, itemId);
    }

    @RequestMapping(path = "/delItem", produces = {"text/plain;charset=UTF-8"})
    public String delItem(String itemId) {
        return itemService.delItem(itemId);
    }

    @RequestMapping("/waitForAccess")
    public ModelAndView waitForAccess(HttpSession session, ModelAndView modelAndView) {
        return itemService.waitForAccess(session, modelAndView);
    }

    @RequestMapping(path = "/wtsItem", produces = {"text/plain;charset=UTF-8"})
    public String wtsItem(String serialNum, HttpSession session) {
        return itemService.wtsItem(serialNum, session);
    }

/*
    @RequestMapping(path = "/sort")
    public ModelAndView sort(String timeSort, String clickSort, int pageNum, String condition){
        HashMap<String, String> param = new HashMap();
        param.put("timeSort", timeSort);
        param.put("clickSort", clickSort);
        param.put("condition", condition);

        HashMap<String, ArrayList<Item>> result = itemService.getSortedItem(param, pageNum);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main/itemListPage");
        return modelAndView;
    }
*/

}
