package com.zdh.util;

/**
 * 常量类
 */
public class Constant {

    //修改密码地址（本地）
    public final static String RESET_PASSWORD_URL_LOCAL = "http://localhost:8080/user/resetPassword";
    //修改密码地址（服务器端）
    public final static String RESET_PASSWORD_URL_REMOTE = "http://45.63.111.162:8080/user/resetPassword";

    //验证码用字符集合
    public final static String VERIFY_CODE_CHARSET = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //token生成密钥
    public final static String TOKEN_KEY = "HRB_SECOND_HAND_TOKEN_KEY";

    //token签发人
    public final static String TOKEN_ISSUER = "HRB_SECOND_HAND_PLATFORM";

    //默认邮件发送方
    public final static String MAIL_SENDER = "932421804@qq.com";

    //默认时间格式
    public final static String COMMON_DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public final static String YEAR_MONTH_DAY_DATE_PATTERN = "yyyy-MM-dd";

    //返回前台的状态码
    public final static String SUCCESS_CODE = "0";
    public final static String BUY_OWN_ITEM = "1";

    //支付宝沙箱网关地址
    public static final String ALIPAY_SANDBOX_GATEWAY_URL = "https://openapi.alipaydev.com/gateway.do";
    //app_id    沙箱 2016101800719515
    public static final String ALIPAY_SANDBOX_APP_ID = "2016101800719515";
    //开发者应用私钥，由开发者自己生成
    public static final String APP_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCgenASwxq4ehRMKi8RLoxabFOSY4aoc/rdU9hNLZuh4fDVKurydG4NZl5sxYFrFne7u/O5M4Of497Vmffr9s57MvTvDaj6CT7tsXeGLj1KeyfnIu53P+PY3Q/C/N3yug8DwoZDA0Ic0YSl/9MFlCu3SApmmGn7/k6/nht4rgGiarxQvNS04M3/b1oHXbKqmFYCI2Gv4xhfEnRL0VR6ZemZPFFuV+StV5qZfLkwrf7iDXR9Wv8l08O+1rw/oCFe0dTaHjJCWkFUGzE3JC7HX4vqdzG1fck9ju7Gyr4uvrxHqMFC7QMHFhw4lleS86wcw89hM0HD+kwyN8gPzzwKFuv1AgMBAAECggEASXAeb4eXZ8p+FWjMhzldA1hFWl1vVxFUQQrIlnEDoq5JztNIF1IOttUc6vvrQL1UZ7YYT61yU64s4GUIXpRgY2KrUeZXaKzofk/TWbU5WSdI2G5U4H99XlWzi9C6JQTeMCNJ28rW62c6I9kRkaD/7GzsTYz8G1SCZxAMlEpU9yTVIhfV5dOxdCoPFzh8w89OXHinkxurHaq3q5jq+ums+M9/OkJP7nzitxYYnnciQmgCWFWQd6MfSHHrfbjD0JlBnNktD67JqWK9KJv++D7loqOCBeJJRlNe9DuGtwcbhbBlAeQPvlDEillgqP6ZdL7si+dZhbY/F1KaXRmOQRggwQKBgQDau//xvh3mfnJqFNcIGTDazyBK5SqZKSX5m8XPNQQgpeoxEXPt5f3wkd5f8XNHI1npELoOgsn5yEFcaHq+h9dU5P9tCFFgAj/QVqbD9iQHCJnRbitKtlCKdgvBR4ZTdg9WmZ+xfSVJdIjUiif/cvLNLZMyoxeUwqKOi2WBSw2P5QKBgQC70Z/oRIBQO2HJZZoepSN7nGM2GoMcjMcj70hMvT71objhlVv+fQNA60OQOM3PhXUUwWHg5RwMQbTHSju6feOHJwF52yAYR+jCEEojH02MQuHridKgDVQdAotsSrmLVvKejHELWn5tLd1K4c9ZfsRFQth6S8wqmOhkf30NPXeK0QKBgQCPOn+0Kkul/LKq6A6OTQCCpxJ8OGeWdy1YrznuHscfIcWib807wFhySPIWXSKhOHLNfJh4nAfpucmi2v9U99p2yqS/Hq06cv6aS8NTmj+pI2aljsBmYc+HexjjbRR2Xl5Y1KuPK2VZHifjFLxwNzLqS6eRht4QGQsc0AadjSnKSQKBgGgWZGh0jifowOi8Rg11t5RptxHk34STAEoJ8ieVOa8nUS6zd6gx3/u6ZlcnI+g+LgSyp2vbjQ+92lIX8cIIwm/ETi0aI09Ris0B+hQ85N02s721Q+Uvfc4V+u6o+usd5Je5fWytWiNnp5w4SJFwj5VS1mXwW9W/qAsKHGOaDQYBAoGAaWN12T/D3FjZ/tKL0T/lqoz6ld/K7Yu3hORNBxRopmmSZeqC6P7L7YdBPCCkizFdapd0rEhlSnj9YIzS25fDSUCub22tFb1thi666h+cxH16gTZBP9cLEmX9hYypyOLphMtNA51/23fMup59JsIpEVEqsbT2FcqR8R2+Bj9QQ1g=";
    //参数返回格式，只支持 json 格式
    public static final String JSON = "json";
    //请求和签名使用的字符编码格式，支持 GBK和 UTF-8
    public static final String CHARSET = "UTF-8";
    //支付宝公钥，由支付宝生成
    public static final String ALIPAY_PUBLIC_KEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB\n+Pe1Zn36/bOezL07w2o+gk+7bF3hi49Snsn5yLudz/j2N0Pwvzd8roPA8KGQwNCHNGEpf/TBZQrt0gKZphp+/5Ov54beK4Bomq8ULzUtODN/29aB12yqphWAiNhr+MYXxJ0S9FUemXpmTxRblfkrVeamXy5MK3+4g10fVr/JdPDvta8P6AhXtHU2h4yQlpBVBsxNyQux1+L6ncxtX3JPY7uxsq+Lr68R6jBQu0DBxYcOJZXkvOsHMPPYTNBw/pMMjfID888Chbr9QIDAQAB";
    //商户生成签名字符串所使用的签名算法类型，目前支持 RSA2 和 RSA，推荐商家使用 RSA2。
    public static final String SIGN_TYPE = "RSA2";

}
