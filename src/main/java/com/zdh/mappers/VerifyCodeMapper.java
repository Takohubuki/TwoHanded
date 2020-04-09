package com.zdh.mappers;

import com.zdh.bean.VerifyCode;

import java.util.Map;

public interface VerifyCodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VerifyCode record);

    int insertSelective(VerifyCode record);

    VerifyCode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VerifyCode record);

    int updateByPrimaryKey(VerifyCode record);

    VerifyCode verifyEmail(Map param);
}