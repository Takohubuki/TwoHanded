package com.zdh.util;

import java.util.Date;

public class TimeUtils {
    public static Date minsFromNow(int mins) {
        long currentTime = System.currentTimeMillis() + mins * 60 * 1000;
        return new Date(currentTime);
    }

    public static Date hoursFromNow(int hours) {
        long currentTime = System.currentTimeMillis() + hours * 60 * 60 * 1000;
        return new Date(currentTime);

    }

    public static Date daysFromNow(int days) {
        long currentTime = System.currentTimeMillis() + days * 24 * 60 * 60 * 1000;
        return new Date(currentTime);
    }

    public static Date daysFrom(int days, Date date) {
        long time = date.getTime();
        time = time + days * 24 * 60 * 60 * 1000;
        return new Date(time);
    }

    public static Date monthsFrom(int months, Date date) {
        long time = date.getTime();
        time = time + months * 30 * 24 * 60 * 60 * 1000;
        return new Date(time);
    }

    public static Date yearsFrom(int years, Date date) {
        long time = date.getTime();
        time = time + years * 12 * 30 * 24 * 60 * 60 * 1000;
        return new Date(time);
    }

}
