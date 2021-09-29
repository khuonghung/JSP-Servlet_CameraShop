package polymart.xyz.ass_jv4.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {

    private static CookieUtils cookieUtils;

    public String getCookieUtils(String name, HttpServletRequest request) {
        Cookie[] cookie = request.getCookies();
        if (cookie != null) {
            for (Cookie x : cookie) {
                if (x.getName().equalsIgnoreCase(name.toUpperCase())) {
                    return x.getValue();
                }
            }
        }
        return null;
    }

    public void setCookieUtils(String name, String value, HttpServletResponse response) {
        Cookie cookie = new Cookie(name.toUpperCase(), value);
        cookie.setMaxAge(60 * 60 * 24 * 30);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    public static CookieUtils getCookieUtils() {
        if (cookieUtils == null) {
            cookieUtils = new CookieUtils();
        }
        return cookieUtils;
    }
}
