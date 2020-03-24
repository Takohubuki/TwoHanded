package com.zdh.util;

public class AmountUtils {

    public static String getTotalAmount(String price, String num){
        double prices = getAmount(price);
        double v = Double.parseDouble(num);
        return String.valueOf(v * prices);
    }

    public static double getAmount(String amount){
        String s = amount.replace("¥", "");
        return Double.parseDouble(s);
    }

}
