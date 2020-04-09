package com.zdh.util;

import java.util.Date;

public class TimeUtils {
    public static Date minsFromNow(int mins) {
        long currentTime = System.currentTimeMillis() + mins * 60 * 1000;
        return new Date(currentTime);
    }
}
