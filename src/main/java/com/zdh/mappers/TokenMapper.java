package com.zdh.mappers;

import com.zdh.bean.Token;

import java.util.List;
import java.util.Map;

public interface TokenMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Token record);

    int insertSelective(Token record);

    Token selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Token record);

    int updateByPrimaryKey(Token record);

    Token verifyToken(Map param);

    List<Token> getTokenByStatus(String status);

    void batchUpdateStatus(List<Token> tokenList);
}