package com.zdh.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;

public class TokenTools {

    private static final SimpleDateFormat sdf = new SimpleDateFormat(Constant.COMMON_DATE_PATTERN);
    private static Logger logger = LoggerFactory.getLogger(TokenTools.class);

    public static String createToken(String sid) {
        Algorithm algorithm = Algorithm.HMAC256(Constant.TOKEN_KEY);
        return JWT.create()
                .withIssuer(Constant.TOKEN_ISSUER)
                .withIssuedAt(new Date())
                .withClaim("sid", sid)
                .withExpiresAt(TimeUtils.hoursFromNow(12))
                .sign(algorithm);
    }

    public static Map tokenVerifier(String token) throws JWTVerificationException {
        Algorithm algorithm = Algorithm.HMAC256(Constant.TOKEN_KEY);
        JWTVerifier auth0 = JWT.require(algorithm)
                .withIssuer(Constant.TOKEN_ISSUER)
                .build();
        DecodedJWT verify = auth0.verify(token);
        Map<String, Claim> claims = verify.getClaims();

        Date iat = claims.get("iat").asDate();
        Date exp = claims.get("exp").asDate();
        String sid1 = claims.get("sid").asString();
        logger.debug("接受签发用户" + sid1);
        logger.debug("token签发时间" + sdf.format(iat));
        logger.debug("token过期时间" + sdf.format(exp));
        return claims;
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
