package com.zdh.service.impl;

import com.zdh.mappers.ItemKindMappers;
import com.zdh.service.ItemKindService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.List;

@Service
public class ItemKindServiceImpl implements ItemKindService {

    @Resource
    private ItemKindMappers itemKindMappers;

    @Override
    public List<String> getAllKind(ServletContext servletContext) {

        List<String> kindList = itemKindMappers.getKindList();
        servletContext.setAttribute("kindList", kindList);
        return kindList;
    }
}
