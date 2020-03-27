package com.zdh.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdh.bean.Item;
import com.zdh.bean.Member;
import com.zdh.mappers.ItemKindMappers;
import com.zdh.mappers.ItemMapper;
import com.zdh.service.ItemService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Resource
    private ItemKindMappers itemKindMappers;

    @Resource
    private ItemMapper itemMapper;

    @Override
    public ModelAndView selectById(ModelAndView modelAndView, String itemId) {

        Item item = itemMapper.selectBySerialNum(itemId);

        item.setViewedTimes(item.getViewedTimes() + 1);
        itemMapper.updateItemInfo(item);

        String kind = item.getKind();
        List<Item> items = recommendSameKind(kind, item);

        modelAndView.addObject("item", item);
        modelAndView.addObject("recommand_items",items);
        modelAndView.setViewName("singleItem");

        return modelAndView;
    }

    @Override
    public ModelAndView getIndexItem(ModelAndView modelAndView) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        modelAndView.addObject("wts_item",wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        modelAndView.addObject("wtb_item",wtb_item3);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        modelAndView.setViewName("redirect:/");
        return modelAndView;
    }

    @Override
    public void getIndexItem(ServletContext servletContext) {

        List<Item> wts_item3 = itemMapper.select3WtsItemByTime();
        servletContext.setAttribute("wts_item",wts_item3);

        List<Item> wtb_item3 = itemMapper.select3WtbItemByTime();
        servletContext.setAttribute("wtb_item",wtb_item3);

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
        modelAndView.addObject("itemPageInfo",itemPageInfo);

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
        modelAndView.addObject("itemPageInfo",itemPageInfo);

        List<String> kindList = itemKindMappers.getKindList();
        modelAndView.addObject("kindList", kindList);

        modelAndView.setViewName("itemList");
        return modelAndView;

    }

    @Override
    public ModelAndView itemPage(ModelAndView modelAndView, int pageNum, HttpServletRequest request) {
        PageHelper.startPage(pageNum,6);
        PageInfo<Item> itemPageInfo = null;
        if (request.getHeader("Referer").contains("listwtsbytime")){
            Page<Item> itemPage = itemMapper.selectWtsAllByTime();
            itemPageInfo = new PageInfo<>(itemPage);
        }else if (request.getHeader("Referer").contains("searchbyname")){
            String search = request.getParameter("search");
            List<Item> items = itemMapper.selectByName(search);
            itemPageInfo = new PageInfo<>(items);
        }else if (request.getHeader("Referer").contains("searchbykind")){
            String kind = request.getParameter("kind");
            List<Item> items = itemMapper.selectByKind(kind);
            itemPageInfo = new PageInfo<>(items);
        }else if (request.getHeader("Referer").contains("listwtbbytime")){
            Page<Item> items = itemMapper.selectWtbAllByTime();
            itemPageInfo = new PageInfo<>(items);
        }
        modelAndView.addObject("itemPageInfo",itemPageInfo);
        modelAndView.setViewName("itemListPage");
        return modelAndView;
    }

    @Override
    public ModelAndView wtbItem(String itemId, ModelAndView modelAndView) {
        Item wtb_item = itemMapper.selectBySerialNum(itemId);

        wtb_item.setViewedTimes(wtb_item.getViewedTimes() + 1);
        itemMapper.updateItemInfo(wtb_item);

        modelAndView.addObject("item", wtb_item);
        modelAndView.setViewName("wtbItem");
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

        //生成商品序列号
        item.setSerialNum(format+sid);

        //发布信息进入审核状态
        item.setIsUndercarriage(true);
        item.setUndercarriageReason("待审核");

        itemMapper.addPublish(item);
        return getIndexItem(modelAndView);
    }

    @Override
    public ModelAndView searchByName(ModelAndView modelAndView, String search) {
        PageHelper.startPage(1,6);
        List<Item> items = itemMapper.selectByName(search);
        PageInfo<Item> itemPageInfo = new PageInfo<>(items);
        modelAndView.addObject("itemPageInfo",itemPageInfo);
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
        modelAndView.addObject("itemPageInfo",itemPageInfo);
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
}
