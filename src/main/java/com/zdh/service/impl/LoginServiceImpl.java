package com.zdh.service.impl;

import com.zdh.mappers.MemberMapper;
import com.zdh.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {

    @Resource
    MemberMapper memberMapper;

    @Override
    public void signIn(String name, String password) {

    }
}
