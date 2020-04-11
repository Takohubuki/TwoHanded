package com.zdh.scheduler;

import com.zdh.bean.VerifyCode;
import com.zdh.mappers.VerifyCodeMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Component
public class VerifyCodeScheduler {
    private Logger logger = LoggerFactory.getLogger(VerifyCodeScheduler.class);

    private Date now = new Date();

    @Resource
    private VerifyCodeMapper verifyCodeMapper;

    /**
     * 5分钟执行一次
     */
    @Scheduled(cron = "0 0/5 * * * ?")
    public void checkCodeStatus() {

        logger.info("开始处理过期验证码");

        boolean flag = false;

        List<VerifyCode> verifyCodeList = verifyCodeMapper.getCodeWithStatus("U");
        for (VerifyCode verifyCode : verifyCodeList) {
            if (verifyCode.getExpireTime().before(now)) {
                verifyCode.setState("E");
                flag = true;
            }
        }
        if (flag) {
            verifyCodeMapper.batchUpdateStatus(verifyCodeList);
        }

        logger.info("处理完成");
    }

}
