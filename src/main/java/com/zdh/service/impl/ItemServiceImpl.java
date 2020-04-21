package com.zdh.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.ItemKindMappers;
import com.zdh.mappers.ItemMapper;
import com.zdh.mappers.MemberMapper;
import com.zdh.service.ItemService;
import com.zdh.util.Constant;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class ItemServiceImpl implements ItemService {
    @Resource
    private ItemKindMappers itemKindMappers;

    @Resource
    private ItemMapper itemMapper;

    @Resource
    private MemberMapper memberMapper;

    @Override
    public ModelAndView selectById(ModelAndView modelAndView, String itemId) {

        Item item = itemMapper.selectBySerialNum(itemId);

        String sellerId = item.getPublisher();
        Member publisher = memberMapper.selectByPrimaryKey(sellerId);

        item.setViewedTimes(item.getViewedTimes() + 1);
        itemMapper.updateItemInfo(item);

        String kind = item.getKind();
        List<Item> items = recommendSameKind(kind, item);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        if ("出售".equals(item.getConditions())) {
            modelAndView.addObject("item", item);
            modelAndView.addObject("recommand_items", items);
            modelAndView.addObject("publisher", publisher);
            modelAndView.setViewName("wtsInfo");
        } else if ("求购".equals(item.getConditions())) {
            modelAndView.addObject("item", item);
            modelAndView.addObject("publisher", publisher);
            modelAndView.setViewName("wtbInfo");
        }
        return modelAndView;
    }

    @Override
    public ModelAndView getIndexItem(ModelAndView modelAndView, RedirectAttributes redirectAttributes) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        redirectAttributes.addFlashAttribute("wts_item", wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        redirectAttributes.addFlashAttribute("wtb_item3", wtb_item3);

        List<Item> mostViewed = itemMapper.select3MostViewedWts();
        redirectAttributes.addFlashAttribute("mostViewed", mostViewed);

        List<String> kindList = itemKindMappers.getKindList();
        redirectAttributes.addFlashAttribute("kindList", kindList);

        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @Override
    public void getIndexItem(ServletContext servletContext) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        servletContext.setAttribute("wts_item", wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        servletContext.setAttribute("wtb_item", wtb_item3);

        List<Item> mostViewed = itemMapper.select3MostViewedWts();
        servletContext.setAttribute("mostViewed", mostViewed);

        List<String> kindList = itemKindMappers.getKindList();
        servletContext.setAttribute("kindList", kindList);

    }

    @Override
    public List<Item> recommendSameKind(String kind, Item item) {
        List<Item> items = itemMapper.recommandSameKind(kind);
        items.remove(item);
        return items;
    }

    @Override
    public ModelAndView listWtbByTime(ModelAndView modelAndView) {
        PageHelper.startPage(1,6);
        Page<Item> wtsAllByTime = itemMapper.selectWtbAllByTime();
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsAllByTime);
        modelAndView.addObject("wtbPageInfo", itemPageInfo);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        modelAndView.setViewName("itemList");
        return modelAndView;
    }

    @Override
    public ModelAndView listWtsByTime(ModelAndView modelAndView) {
        PageHelper.startPage(1,6);
        Page<Item> wtsAllByTime = itemMapper.selectWtsAllByTime();
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsAllByTime);
        modelAndView.addObject("wtsPageInfo", itemPageInfo);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        modelAndView.setViewName("itemList");
        return modelAndView;

    }

    @Override
    public ModelAndView itemPage(ModelAndView modelAndView, int pageNum, HttpServletRequest request, String searchName) {
        PageInfo<Item> itemPageInfo = null;
        if (request.getHeader("Referer").contains("listwtsbytime")) {

            PageHelper.startPage(pageNum, 6);
            Page<Item> itemPage = itemMapper.selectWtsAllByTime();
            itemPageInfo = new PageInfo<>(itemPage);

        } else if (request.getHeader("Referer").contains("searchbyname")) {
            String uri = request.getHeader("Referer");

            PageHelper.startPage(pageNum, 3);
            List<Item> wtsByName = itemMapper.selectWtsByName(searchName);

            PageHelper.startPage(pageNum, 3);
            List<Item> wtbByName = itemMapper.selectWtbByName(searchName);

            itemPageInfo = new PageInfo<>(wtsByName);
            PageInfo<Item> wtbPageInfo = new PageInfo<>(wtbByName);
            modelAndView.addObject("wtbPageInfo", wtbPageInfo);

        }else if (request.getHeader("Referer").contains("searchbykind")) {

            PageHelper.startPage(pageNum, 6);
            String kind = request.getParameter("kind");
            List<Item> items = itemMapper.selectByKind(kind);
            itemPageInfo = new PageInfo<>(items);

        }else if (request.getHeader("Referer").contains("listwtbbytime")) {

            PageHelper.startPage(pageNum, 6);
            Page<Item> items = itemMapper.selectWtbAllByTime();
            itemPageInfo = new PageInfo<>(items);
        }
        modelAndView.addObject("wtsPageInfo", itemPageInfo);
        modelAndView.setViewName("itemListPage");
        return modelAndView;
    }

    @Override
    public ModelAndView wtbItem(String itemId, ModelAndView modelAndView) {
        Item wtb_item = itemMapper.selectBySerialNum(itemId);

        wtb_item.setViewedTimes(wtb_item.getViewedTimes() + 1);
        itemMapper.updateItemInfo(wtb_item);

        modelAndView.addObject("item", wtb_item);
        modelAndView.setViewName("wtbInfo");
        return modelAndView;
    }

    @Override
    public ModelAndView queryWtsAllTime(ModelAndView modelAndView) {
        List<Item> items = itemMapper.selectWtsAllByTime();
        modelAndView.addObject("itemlist",items);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        modelAndView.setViewName("itemList");
        return modelAndView;
    }

    @Override
    public ModelAndView addPublish(Item item, ModelAndView modelAndView, HttpSession session, MultipartFile file, HttpServletRequest request) throws IOException {
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/images/");

            System.out.println(path);
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            //输出文件上传最终的路径 测试查看
            System.out.println(path + File.separator + filename);

            item.setImage("images/"+filename);
        }
        //写入发布时间和更新时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        Member member = (Member) session.getAttribute("member");

        String format = sdf.format(date);
        String sid = member.getSid();

        item.setPublisher(sid);
        item.setPublishTime(date);
        item.setUpdateTime(date);
        item.setViewedTimes(0);

        //生成商品序列号
        item.setSerialNum(format+sid);

        //发布信息进入审核状态
        item.setIsUndercarriage(true);
        item.setUndercarriageReason("待审核");

        itemMapper.addPublish(item);
        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @Override
    public ModelAndView searchByName(ModelAndView modelAndView, String search) {
        PageHelper.startPage(1, 3);
        List<Item> wtsByName = itemMapper.selectWtsByName(search);

        PageHelper.startPage(1, 3);
        List<Item> wtbByName = itemMapper.selectWtbByName(search);

        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsByName);
        PageInfo<Item> wtbPageInfo = new PageInfo<>(wtbByName);

        modelAndView.addObject("wtsPageInfo", itemPageInfo);
        modelAndView.addObject("wtbPageInfo", wtbPageInfo);

        modelAndView.setViewName("itemList");

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        return modelAndView;

    }

    @Override
    public ModelAndView searchByKind(ModelAndView modelAndView, String kind) {
        PageHelper.startPage(1,6);
        List<Item> items = itemMapper.selectByKind(kind);
        PageInfo<Item> itemPageInfo = new PageInfo<>(items);
        modelAndView.addObject("wtsPageInfo", itemPageInfo);
        modelAndView.setViewName("itemList");

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        return modelAndView;
    }

    @Override
    public ModelAndView updateItemInfo(ModelAndView modelAndView, String itemId) {
        Item item = itemMapper.selectBySerialNum(itemId);
        modelAndView.addObject("item",item);
        modelAndView.setViewName("update");
        return modelAndView;
    }

    @Override
    public ModelAndView updateItem(ModelAndView modelAndView, Item item, MultipartFile file, HttpServletRequest request) throws IOException {
        if(!file.isEmpty()) {
            //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/images/");

            System.out.println(path);
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            //输出文件上传最终的路径 测试查看
            System.out.println(path + File.separator + filename);

            item.setImage(filename);
        }
        Date date = new Date();

        item.setUpdateTime(date);

        itemMapper.updateItemInfo(item);

        modelAndView.setViewName("profile");
        return modelAndView;
    }

    @Override
    public void returnItemsFromOrder(List<Order> orderList) {

        List<Item> itemList = new ArrayList<>();
        Item item;
        Integer itemNum;

        for (Order order : orderList) {

            item = order.getItem();
            itemNum = order.getItemNum();
            itemNum = item.getNumber() + itemNum;
            item.setNumber(itemNum);

            if (item.getIsUndercarriage() && "库存不足".equals(item.getUndercarriageReason())) {
                item.setIsUndercarriage(false);
                item.setUndercarriageReason("");
            }

            itemList.add(item);

            order.setIsCanceled(true);
        }

        itemMapper.batchUpdateItemNum(itemList);
    }

    @Override
    public String offMyItem(String reason, String itemId) {
        if (StringUtils.isEmpty(reason)) {
            reason = "";
        }
        Map<String, String> param = new HashMap<>();
        param.put("itemId", itemId);
        param.put("reason", reason);
        itemMapper.offItem(param);
        return "success";
    }

    @Override
    public ModelAndView waitForAccess(HttpSession session, ModelAndView modelAndView) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        List<Item> approvalItem = itemMapper.getApprovalItemOfUser(sid);
        modelAndView.addObject("itemWaitForAccess", approvalItem);
        modelAndView.setViewName("itemWaitToAccessOfUser");
        return modelAndView;
    }

    @Override
    public String wtsItem(String serialNum, HttpSession session) {
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();

        itemMapper.wtsItem(serialNum);
        return Constant.SUCCESS_CODE;
    }
}
