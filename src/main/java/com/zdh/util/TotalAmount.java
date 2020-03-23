package com.zdh.util;

public class TotalAmount {
    public static String getTotalAmount(String price, String num){
        Double prices = Double.valueOf(price);
        Integer nums = Integer.valueOf(num);
        return String.valueOf(prices * nums);
    }
}
