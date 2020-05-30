package com.zdh.scheduler;

import com.zdh.bean.Member;
import com.zdh.bean.Order;
import com.zdh.mappers.MemberMapper;
import com.zdh.util.TimeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MemberScheduler {

    private final Logger logger = LoggerFactory.getLogger(MemberScheduler.class);

    private Date now = null;

    @Resource
    MemberMapper memberMapper;

    /**
     * 检查可以删除的用户
     * 并将其改为可删除状态
     * 24小时执行一次
     */
    @Scheduled(cron = "0 0 0/24 * * ?")
    public void deletableMember() throws ParseException {

        logger.info("开始检查可以删除的用户");

        now = new Date();
        List<Member> members = memberMapper.selectAllMember();

        for (Member member : members) {
            String dateString = "20" + member.getSid().substring(1, 2) + "-06";
            Date date = TimeUtils.parseStringToDate(dateString);

            date = TimeUtils.yearsFrom(4, date);
            if (now.after(date)){
                member.setStatus("D");
                memberMapper.deletableMember(member);
            }
        }


        logger.info("处理完成");
    }


}
