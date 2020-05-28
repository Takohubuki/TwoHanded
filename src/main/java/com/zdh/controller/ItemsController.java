package com.zdh.controller;

import com.zdh.bean.Item;
import com.zdh.service.ItemKindService;
import com.zdh.service.ItemService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
    @RequestMapping("/listwtbbytime")
    public ModelAndView listWtbByTime(ModelAndView modelAndView, int pageNum) {
        return itemService.listWtbByTime(modelAndView, pageNum);
    }

    /**
     * 转跳出售商品列表
     * 根据时间降序排列商品
     * @param modelAndView
     * @return
     */
    @RequestMapping("/listwtsbytime")
    public ModelAndView listWtsByTime(ModelAndView modelAndView, int pageNum){
        return itemService.listWtsByTime(modelAndView, pageNum);
    }

    /**
     * 商品列表分页
     *
     * @param modelAndView
     * @param pageNum
     * @param request
     * @return
     */
    @RequestMapping(path = "/itempage", method = RequestMethod.GET)
    public ModelAndView itemPage(ModelAndView modelAndView, int pageNum, String searchName, HttpServletRequest request) {
        return itemService.itemPage(modelAndView, pageNum, request, searchName);
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
     * 跳转最新出售商品列表页
     * @param modelAndView
     * @return
     */
    @RequestMapping("/queryalltime")
    public ModelAndView queryWtsAllTime(ModelAndView modelAndView){
        return itemService.queryWtsAllTime(modelAndView);
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
     * @param searchName
     * @return
     */
    @RequestMapping("/searchbyname")
    public ModelAndView searchByName(ModelAndView modelAndView, String searchName, int pageNum){
        return itemService.searchByName(modelAndView, searchName, pageNum);
    }

    /**
     * 根据商品类型查询
     * @param modelAndView
     * @param kind
     * @return
     */
    @RequestMapping("/searchbykind")
    public ModelAndView searchByKind(ModelAndView modelAndView, String kind, int pageNum){
        return itemService.searchByKind(modelAndView, kind, pageNum);
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

    @RequestMapping("/waitForAccess")
    public ModelAndView waitForAccess(HttpSession session, ModelAndView modelAndView) {
        return itemService.waitForAccess(session, modelAndView);
    }

    @RequestMapping(path = "/wtsItem", produces = {"text/plain;charset=UTF-8"})
    public String wtsItem(String serialNum, HttpSession session) {
        return itemService.wtsItem(serialNum, session);
    }

    @RequestMapping(path = "/sort")
    public ModelAndView sort(String timeSort, String clickSort, String searchName, int pageNum){
        HashMap<String, String> param = new HashMap();
        param.put("timeSort", timeSort);
        param.put("clickSort", clickSort);
        param.put("searchName", searchName);

        itemService.getSortedItem(param);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main/itemListPage");
        return modelAndView;
    }

}
