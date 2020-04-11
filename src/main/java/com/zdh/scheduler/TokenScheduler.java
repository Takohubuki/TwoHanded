package com.zdh.scheduler;

import com.zdh.bean.Token;
import com.zdh.mappers.TokenMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Component
public class TokenScheduler {
    private Logger logger = LoggerFactory.getLogger(TokenScheduler.class);

    private Date now = new Date();

    @Resource
    private TokenMapper tokenMapper;

    @Scheduled(cron = "0 0 0/12 * * ?")
    public void handleExpiredToken() {

        logger.info("开始处理过期token");

        boolean flag = false;

        List<Token> tokenList = tokenMapper.getTokenByStatus("U");
        for (Token token : tokenList) {
            if (token.getExpireDate().before(now)) {
                token.setStatus("E");
                flag = true;
            }
        }
        if (flag) {
            tokenMapper.batchUpdateStatus(tokenList);
        }

        logger.info("处理完成");
    }
}
