package com.zdh.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.SimpleDateFormat;
import java.util.Random;

public class TokenTools {

    private static final SimpleDateFormat sdf = new SimpleDateFormat(Constant.COMMON_DATE_PATTERN);
    private static Logger logger = LoggerFactory.getLogger(TokenTools.class);

    public static String createToken() {
        Algorithm algorithm = Algorithm.HMAC256(Constant.TOKEN_KEY);
        return JWT.create().withIssuer("auth0").withExpiresAt(TimeUtils.minsFromNow(60)).sign(algorithm);
    }

    public static boolean TokenVerifier(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(Constant.TOKEN_KEY);
            JWTVerifier auth0 = JWT.require(algorithm).withIssuer(Constant.TOKEN_ISSUER).build();
            DecodedJWT verify = auth0.verify(token);
        } catch (JWTVerificationException e) {
            e.printStackTrace();
            logger.debug("token验证失败");
            return false;
        }
        return true;
    }

    public static String createVerifyCode() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int j = 0; j < 6; j++) {
            sb.append(Constant.VERIFY_CODE_CHARSET.charAt(random.nextInt(61)));
        }
        return sb.toString();
    }

}
