package com.zdh.pay;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.zdh.util.Constant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.Map;

public class AliPayDemo {
    public static void jumpToAliPay(HttpServletRequest request, HttpServletResponse response, Map params) throws Exception {
        AlipayClient aliPayClient = new DefaultAlipayClient(Constant.ALIPAY_SANDBOX_GATEWAY_URL,
                Constant.ALIPAY_SANDBOX_APP_ID,
                Constant.APP_PRIVATE_KEY,
                Constant.JSON,
                Constant.CHARSET,
                Constant.ALIPAY_PUBLIC_KEY,
                Constant.SIGN_TYPE);
        String orderId = (String) params.get("orderId");
        String totalAmount = (String) params.get("totalAmount");
        String itemName = (String) params.get("itemName");

        orderId = URLDecoder.decode(orderId, "UTF-8");
        totalAmount = URLDecoder.decode(totalAmount, "UTF-8");
        itemName = URLDecoder.decode(itemName, "UTF-8");

        AlipayTradePagePayRequest alipayTradePagePayRequest = new AlipayTradePagePayRequest();
        alipayTradePagePayRequest.setReturnUrl("localhost:8080/");
        alipayTradePagePayRequest.setBizContent("{" +
                "\"out_trade_no\":\""+ orderId + "\"," +
                "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "\"total_amount\":\""+ totalAmount +"\"," +
                "\"subject\":\""+ itemName +
                "\"}");//填充业务参数

        String form = "";
        form = aliPayClient.pageExecute(alipayTradePagePayRequest).getBody();
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println(form);//直接将完整的表单html输出到页面
        response.getWriter().close();

    }

}
