package polymart.xyz.ass_jv4.controller.account;

import polymart.xyz.ass_jv4.entity.EntityStaff;
import polymart.xyz.ass_jv4.service.IServiceAccount;
import polymart.xyz.ass_jv4.service.implement.ServiceAccount;
import polymart.xyz.ass_jv4.utils.ContaiUtils;
import polymart.xyz.ass_jv4.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletResultRegister", value = {"/account", "/voucher", "/visit", "/order", "/send-contact"})
public class ServletResultRegister extends HttpServlet {

    private IServiceAccount _iServiceStaff;

    @Override
    public void init() throws ServletException {
        _iServiceStaff = new ServiceAccount();
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getRequestURI();
        if (url.contains("/send-contact")) {
            String result = request.getParameter("result");
            if (result != null && result.equals("true")) {
                request.setAttribute("title", "Đã gửi phản hồi");
                request.setAttribute("message", "Chúng tôi sẽ trả lời bạn sớm nhất.");
                request.setAttribute("link", "contact");
            } else {
                request.setAttribute("title", "Gửi phản hồi thất bại");
                request.setAttribute("message", "Chúng tôi xin lỗi vì hệ thống đã gặp lỗi khi gửi phản hồi của bạn. Vui lòng nhập lại");
                request.setAttribute("link", "contact");
            }
        }
        if (url.contains("/voucher")) {
            String applyVoucher = request.getParameter("cart-voucher");
            String applyCheckoutVoucher = request.getParameter("checkout-voucher");
            if (applyVoucher != null) {
                if (applyVoucher.equals("true")) {
                    request.setAttribute("title", "Voucher");
                    request.setAttribute("message", "Bạn đã áp dụng voucher");
                    request.setAttribute("link", "cart");
                } else {
                    request.setAttribute("title", "Voucher");
                    request.setAttribute("message", "Voucher không tồn tại!");
                    request.setAttribute("link", "cart");
                }
            } else if (applyCheckoutVoucher != null) {
                if (applyCheckoutVoucher.equals("true")) {
                    request.setAttribute("title", "Voucher");
                    request.setAttribute("message", "Bạn đã áp dụng voucher");
                    request.setAttribute("link", "checkout");
                } else {
                    request.setAttribute("title", "Voucher");
                    request.setAttribute("message", "Voucher không tồn tại!");
                    request.setAttribute("link", "checkout");
                }
            }
        } else if (url.contains("/account")) {
            String result = request.getParameter("result");
            String active = request.getParameter("active");
            String changepassword = request.getParameter("changepassword");
            String forgotPassword = request.getParameter("forgot-password");
            String resetPassword = request.getParameter("reset-password");
            String sendResetPassword = request.getParameter("send-reset-password");
            if (result != null) {
                if (result.equals("signin-successfully")) {
                    request.setAttribute("title", ContaiUtils.LOGIN_TRUE);
                    request.setAttribute("message", "Bạn sẽ được điều hướng tới trang quản lý");
                    request.setAttribute("link", "admin");
                } else if (result.equals("signup-successfully")) {
                    request.setAttribute("title", ContaiUtils.REGISTER_TRUE);
                    request.setAttribute("message", "Vui lòng kiểu tra email");
                    request.setAttribute("link", "signin");
                }
            } else if (active != null) {
                if (_iServiceStaff.activeAccount(active)) {
                    request.setAttribute("title", ContaiUtils.ACTIVE_TRUE);
                    request.setAttribute("link", "signin");
                } else {
                    request.setAttribute("title", ContaiUtils.ACTIVE_FALSE);
                    request.setAttribute("link", "signin");
                }
            } else if (changepassword != null) {
                if (changepassword.equals("true")) {
                    request.setAttribute("title", "Đổi mật khẩu thành công");
                    request.setAttribute("link", "admin");
                } else if (changepassword.equals("false")) {
                    request.setAttribute("title", "Đổi mật khẩu thất bại");
                    request.setAttribute("message", "Mật khẩu không chính xác");
                    request.setAttribute("link", "admin");
                }
            } else if (forgotPassword != null) {
                EntityStaff entityStaff = _iServiceStaff.findById(forgotPassword);
                if (entityStaff != null) {
                    SessionUtils.getSessionUtils().saveSessionModel("userforgot", entityStaff, request);
                    response.sendRedirect(request.getContextPath() + "/reset-password");
                    return;
                } else {
                    request.setAttribute("title", "Link không hợp lệ");
                    request.setAttribute("link", "");
                }
            } else if (resetPassword != null) {
                if (resetPassword.equals("true")) {
                    request.setAttribute("title", "Lấy lại mật khẩu thành công");
                    request.setAttribute("link", "signin");
                } else {
                    request.setAttribute("title", "Lấy lại mật khẩu thất bại");
                    request.setAttribute("link", "forgot-password");
                }
            } else if (sendResetPassword != null) {
                if (sendResetPassword.equals("true")) {
                    request.setAttribute("title", "Đã gửi email");
                    request.setAttribute("message", "Kiểm tra email để lấy lại mật khẩu");
                    request.setAttribute("link", "signin");
                } else {
                    request.setAttribute("title", "Gửi email lấy mật khẩu thất bại");
                    request.setAttribute("link", "forgot-password");
                }
            }
        } else if (url.contains("/visit")) {
            String login = request.getParameter("login-visit");
            if (login != null) {
                if (login.equals("true")) {
                    request.setAttribute("title", ContaiUtils.LOGIN_TRUE);
                    request.setAttribute("link", "checkout");
                } else {
                    request.setAttribute("title", "Tài khoản không chính xác");
                    request.setAttribute("link", "checkout");
                }
            }
        } else if (url.contains("/order")) {
            String paymentSuccess = request.getParameter("payment-success");
            if (paymentSuccess != null && paymentSuccess.equals("true")) {
                request.setAttribute("title", "Đã thanh toán");
                request.setAttribute("message", "Xin cảm ơn");
                request.setAttribute("link", "");
            } else if (paymentSuccess != null && paymentSuccess.equals("false")) {
                request.setAttribute("title", "Thanh toán thất bại");
                request.setAttribute("message", "Vui lòng kiểm tra lại.");
                request.setAttribute("link", "");
            } else {
                String order = request.getParameter("payment-method");
                if (order != null && order.equals("cod")) {
                    request.setAttribute("title", "Đã tạo đơn hàng");
                    request.setAttribute("message", "Xin cảm ơn");
                    request.setAttribute("link", "");
                }
            }
        }
        request.getRequestDispatcher("/views/account/resultRegister.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
