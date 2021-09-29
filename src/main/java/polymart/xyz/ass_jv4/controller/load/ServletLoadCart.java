package polymart.xyz.ass_jv4.controller.load;

import polymart.xyz.ass_jv4.utils.CookieUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLoadCart", value = "/load/web/cart")
public class ServletLoadCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");

        if (id != null && quantity != null) {
            try {
                if (Integer.parseInt(quantity) > 0) {
                    String cart = CookieUtils.getCookieUtils().getCookieUtils("cart", request);
                    if (cart == null) {
                        cart = "";
                    }
                    String newCart = "";
                    if (!cart.contains(id + "-")) {
                        newCart = cart + "c" + id + "-" + quantity;
                    } else {
                        String[] arrCart = cart.split("c");
                        for (int i = 0; i < arrCart.length; i++) {
                            if (arrCart[i].contains(id + "-")) {
                                int oldQuantity = Integer.parseInt(arrCart[i].substring(arrCart[i].lastIndexOf("-") + 1));
                                arrCart[i] = id + "-" + (oldQuantity + Integer.parseInt(quantity));
                            }
                            newCart = newCart + "c" + arrCart[i];
                        }
                    }
                    if (newCart.charAt(0) == 'c') {
                        cart = newCart.substring(newCart.indexOf("c") + 1);
                    } else {
                        cart = newCart;
                    }
                    CookieUtils.getCookieUtils().setCookieUtils("cart", cart, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(CookieUtils.getCookieUtils().getCookieUtils("cart", request));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
