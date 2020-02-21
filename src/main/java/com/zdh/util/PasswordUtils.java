package com.zdh.util;

import org.springframework.util.DigestUtils;

public class PasswordUtils {

    public static boolean passwordConfirm(String password1, String password2){
        //将输入的密码转化成md5的形式与数据库中存储的md5进行对比

        String md5 = DigestUtils.md5DigestAsHex(password2.getBytes());

        if (password1.equals(md5)){
            return true;
        }else{
            return false;
        }
    }

}
