package com.zdh.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdh.bean.Item;
import com.zdh.bean.ItemPage;
import com.zdh.bean.Member;
import com.zdh.mappers.ItemMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    ItemMapper itemMapper;

    @Autowired
    ItemPage itemPage;

    //转跳求购商品列表
    //根据时间降序排列商品
    @RequestMapping("/listwtbbytime")
    public String listwtbbytime(Model model){
        PageHelper.startPage(1,6);
        Page<Item> wtsAllByTime = itemMapper.selectWtbAllByTime();
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsAllByTime);
        model.addAttribute("itemPageInfo",itemPageInfo);
        return "itemlist";
    }

    //转跳出售商品列表
    //根据时间降序排列商品
    @RequestMapping("/listwtsbytime")
    public String listwtsbytime(Model model){
        PageHelper.startPage(1,6);
        Page<Item> wtsAllByTime = itemMapper.selectWtsAllByTime();
        PageInfo<Item> itemPageInfo = new PageInfo<>(wtsAllByTime);
        model.addAttribute("itemPageInfo",itemPageInfo);
        return "itemlist";
    }

    //商品列表分页
    @RequestMapping("/itempage")
    public String itempage(Model model, @Param("pageNum")int pageNum, HttpServletRequest request){
        PageHelper.startPage(pageNum,6);
        PageInfo<Item> itemPageInfo = null;
        if (request.getRequestURI().contains("listwtsbytime")){
            Page<Item> itemPage = itemMapper.selectWtsAllByTime();
            itemPageInfo = new PageInfo<>(itemPage);
        }else if (request.getRequestURI().contains("searchbyname")){
            String search = request.getParameter("search");
            List<Item> items = itemMapper.selectByName(search);
            itemPageInfo = new PageInfo<>(items);
        }
        model.addAttribute("itemPageInfo",itemPageInfo);
        return "itemlist_page";
    }
    //跳转求购商品详情页
    @RequestMapping("/wtbitem")
    public String wtbitem(String itemname, Model model){
        Item wtb_item = itemMapper.select1WtbItemByName(itemname);
        model.addAttribute("item",wtb_item);
        return "wtbitem";
    }

    //跳转出售商品详情页
    @RequestMapping("/singleitem")
    public String singleitem(Model model, String itemname){
        Item item = itemMapper.select1WtsItemByName(itemname);
        if (item == null){
            item = itemMapper.select1WtbItemByName(itemname);
        }
        model.addAttribute("item",item);

        //搜索同类型商品
        String kind = item.getKind();
        List<Item> recommand_items = itemMapper.RecommandSameKind(kind);
        recommand_items.remove(item);
        model.addAttribute("recommand_items",recommand_items);
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
    public String addpublish(Item item, Model model, HttpSession session, @RequestParam("imagefile") MultipartFile file, HttpServletRequest request) throws IOException {
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Member member = (Member) session.getAttribute("member");
        String sid = member.getSid();
        item.setPublisher(sid);
        Date date = new Date();
        item.setPublish_time(date);
        item.setUpdate_time(date);
        String format = sdf.format(date);
        item.setSerial_num(format+sid);
        itemMapper.addpublish(item);


        List<Item> wtb_item = itemMapper.select3WtbItemByTime();
        List<Item> wts_item = itemMapper.select3WtsItemByTime();
        model.addAttribute("wtb_item",wtb_item);
        model.addAttribute("wts_item",wts_item);
        return "redirect:/index.jsp";
    }

    //根据商品名查询
    @RequestMapping("/searchbyname")
    public String sreachbyname(Model model,String search){
        PageHelper.startPage(1,6);
        List<Item> items = itemMapper.selectByName(search);
        PageInfo<Item> itemPageInfo = new PageInfo<>(items);
        model.addAttribute("itemPageInfo",itemPageInfo);
        return "itemlist";
    }
}
