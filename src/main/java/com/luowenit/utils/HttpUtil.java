package com.luowenit.utils;

import javax.servlet.http.HttpServletRequest;

public class HttpUtil {
    public static boolean isMobile(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.contains("mobile") || userAgent.contains("iPad")
                || userAgent.contains("Pad") || userAgent.contains("iPhone")
                || userAgent.contains("Phone") || userAgent.contains("Android")) {
            return true;
        } else {
            return false;
        }
    }
}
