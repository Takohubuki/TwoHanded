package com.zdh.controller;

import com.zdh.bean.Members;
import com.zdh.mappers.MembersMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.InputStream;

@Controller
public class LoginController {
    @RequestMapping("/login")
    public String login(String username, String password) throws IOException {
        String resource = "mybatis.xml";
        InputStream resourceAsStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder().build(resourceAsStream);
        SqlSession sqlSession = sqlSessionFactoryBuilder.openSession();
        MembersMapper mapper = sqlSession.getMapper(MembersMapper.class);
        Members member = mapper.selectByName(username);
        System.out.println(member);
        return "success";
    }
}
