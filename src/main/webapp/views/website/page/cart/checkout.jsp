<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/27/2021
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Title</title>

<!-- breadcrumb area start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="<c:url value="/product"/>">shop</a></li>
                            <li class="breadcrumb-item active" aria-current="page">checkout</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<!-- checkout main wrapper start -->
<div class="checkout-page-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Checkout Login Coupon Accordion Start -->
                <div class="checkoutaccordion" id="checkOutAccordion">
                    <div class="card">
                        <c:if test="${visit==null}">
                            <%--                            <h3>Đã có tài khoản? <span data-toggle="collapse" data-target="#logInaccordion">Click để đăng nhập</span>--%>
                            <h3>Đã có tài khoản? <span data-target="#click-login"
                                                       data-toggle="modal">Click để đăng nhập</span>
                            </h3>

                            <div id="logInaccordion" class="collapse" data-parent="#checkOutAccordion">
                                <div class="card-body">
                                    <div class="login-reg-form-wrap mt-20">
                                        <div class="row">
                                            <div class="col-lg-7 m-auto">
                                                <form action="#" method="post">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="single-input-item">
                                                                <input name="login-phoneNumber" type="text"
                                                                       placeholder="Nhập số diện thoại"
                                                                       required/>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <div class="single-input-item">
                                                                <input name="login-password" type="password"
                                                                       placeholder="Nhập mật khẩu"
                                                                       required/>
                                                            </div>
                                                        </div>
                                                    </div>

                                                        <%--                                                    <div class="single-input-item">--%>
                                                        <%--                                                        <div class="login-reg-form-meta d-flex align-items-center justify-content-between">--%>
                                                        <%--                                                            <div class="remember-meta">--%>
                                                        <%--                                                                <div class="custom-control custom-checkbox">--%>
                                                        <%--                                                                    <input name="login-remember" type="checkbox"--%>
                                                        <%--                                                                           class="custom-control-input"--%>
                                                        <%--                                                                           id="rememberMe"/>--%>
                                                        <%--                                                                    <label class="custom-control-label"--%>
                                                        <%--                                                                           for="rememberMe">Nhớ--%>
                                                        <%--                                                                        mật khẩu</label>--%>
                                                        <%--                                                                </div>--%>
                                                        <%--                                                            </div>--%>

                                                        <%--                                                        </div>--%>
                                                        <%--                                                    </div>--%>

                                                    <div class="single-input-item">
                                                        <button class="check-btn sqr-btn">Đăng nhập</button>
                                                    </div>
                                                </form>
                                                <br/>
                                                <p>Nếu quên mật khẩu bạn có thể thêm đơn và chọn tạo tài khoản với một
                                                    mật khẩu mới</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <div class="card">
                        <h3>Bạn có mã giảm giá? <span data-toggle="collapse" data-target="#couponaccordion">Click để nhập mã giảm giá</span>
                        </h3>
                        <div id="couponaccordion" class="collapse" data-parent="#checkOutAccordion">
                            <div class="card-body">
                                <div class="cart-update-option">
                                    <div class="apply-coupon-wrapper">
                                        <form method="post" class=" d-block d-md-flex">
                                            <input type="text" name="voucher" placeholder="Nhập mã giảm giá" required/>
                                            <button class="check-btn sqr-btn">Áp dụng</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Checkout Login Coupon Accordion End -->
            </div>
        </div>
        <form id="idformorder" action="<c:url value="/payment/order"/>" method="post">
            <div class="row">
                <!-- Checkout Billing Details -->
                <div class="col-lg-6">
                    <div class="checkout-billing-details-wrap">
                        <h2>Chi tiết hoá đơn thanh toán</h2>
                        <div class="billing-form-wrap">
                            <div class="single-input-item">
                                <label for="name" class="required">Họ và tên</label>
                                <input type="text" name="fullName" id="name" placeholder="Họ và tên"
                                       value="${visit.fullName}" required/>
                            </div>

                            <div class="single-input-item">
                                <label for="phone" class="required">Điện thoại</label>
                                <input type="text" name="phoneNumber" id="phone" placeholder="Số điện thoại"
                                       value="${visit.phoneNumber}"/>
                            </div>

                            <div class="single-input-item">
                                <label for="email" class="required">Email</label>
                                <input type="email" name="email" id="email" placeholder="Địa chỉ email"
                                       value="${visit.email}" required/>
                            </div>

                            <div class="single-input-item">
                                <label for="address" class="required pt-20">Địa chỉ</label>
                                <input type="text" name="address" id="address" placeholder="Địa chỉ"
                                       value="${visit.address}" required/>
                            </div>

                            <div class="checkout-box-wrap">
                                <div class="single-input-item">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" name="create_account" class="custom-control-input"
                                               id="create_pwd">
                                        <label class="custom-control-label" for="create_pwd">Tạo 1 tài khoản?</label>
                                    </div>
                                </div>
                                <div class="account-create single-form-row">
                                    <div class="single-input-item">
                                        <label for="password" class="required">Mật khẩu tài khoản</label>
                                        <input type="password" name="password" id="password"
                                               placeholder="Nhập mật khẩu tài khoản" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Summary Details -->
                <div class="col-lg-6">
                    <div class="order-summary-details mt-md-26 mt-sm-26">
                        <h2>Thông tin đơn hàng</h2>
                        <div class="order-summary-content mb-sm-4">
                            <!-- Order Summary Table -->
                            <div class="order-summary-table table-responsive text-center">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Sản phầm</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${lstCart}" var="cart">
                                        <tr>
                                            <td>
                                                <a href="<c:url value="/product?id=${cart.entityProduct.id}"/>">
                                                        ${cart.entityProduct.name} <br/>
                                                    (${cart.entityAttribute.name} -
                                                        ${cart.entityAttribute.value})
                                                    <strong> × ${cart.quantity}</strong>
                                                </a>
                                            </td>
                                            <td>
                                                <c:if test="${cart.entityProduct.persenSale == 0}">
                                                    <fmt:formatNumber value="${cart.price}"
                                                                      type="currency" currencySymbol=""/>₫
                                                </c:if>
                                                <c:if test="${cart.entityProduct.persenSale > 0}">
                                                    <del>
                                                        <fmt:formatNumber value="${cart.price * cart.quantity}"
                                                                          type="currency" currencySymbol=""/>₫
                                                    </del>
                                                    <br/>
                                                    <fmt:formatNumber
                                                            value="${(cart.price - (cart.price *cart.entityProduct.persenSale)/100) * cart.quantity}"
                                                            type="currency" currencySymbol=""/>₫
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                    <c:set var="voucher" value="${discountVoucher}"/>
                                    <c:if test="${voucher > 0}">
                                        <tr>
                                            <td>Voucher</td>
                                            <td><strong>
                                                <fmt:formatNumber value="${voucher}" type="currency" currencySymbol=""/>₫
                                            </strong></td>
                                        </tr>
                                    </c:if>
                                    <tr>
                                        <td>Tổng tiền</td>
                                        <td>
                                            <strong>
                                                <c:set var="total" value="${0}"/>
                                                <c:forEach items="${lstCart}" var="cart">
                                                    <c:set var="total"
                                                           value="${total + ((cart.price - (cart.price *cart.entityProduct.persenSale)/100) * cart.quantity) - voucher}"/>
                                                </c:forEach>
                                                <fmt:formatNumber value="${total}" type="currency" currencySymbol=""/>₫
                                            </strong>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- Order Payment Method -->
                            <div class="order-payment-method">
                                <div class="single-payment-method">
                                    <div class="payment-method-name">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="cod" name="payments" value="cod"
                                                   class="custom-control-input" checked/>
                                            <label class="custom-control-label" for="cod">Thanh toán khi nhận
                                                hàng</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="qrcode" name="payments" value="qrcode"
                                                   class="custom-control-input"/>
                                            <label class="custom-control-label" for="qrcode">Quét mã QRCode</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="vnpay" name="payments" value="vnpay"
                                                   class="custom-control-input"/>
                                            <label class="custom-control-label" for="vnpay">Thanh toán trực
                                                tuyến</label>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${not empty lstCart}">
                                    <div class="summary-footer-area">
                                        <button id="idBtnOrder" type="submit" class="check-btn sqr-btn">Đặt hàng
                                        </button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- checkout main wrapper end -->

<script>
    $('#idBtnOrder').click(function () {
        let name = document.getElementById('name').value
        let phoneNumber = document.getElementById('phone').value
        let email = document.getElementById('email').value
        let address = document.getElementById('address').value
        let password = document.getElementById('password').value
        if (checkLastName(name) && checkPhoneNumber(phoneNumber) && checkEmail(email)
            && checkAddress(address)) {
            if (password !== null && password !== '') {
                if (checkPassword(password)) {
                    // sendMethod();
                    document.getElementById('idformorder').submit();
                }
            } else {
                // sendMethod();
                document.getElementById('idformorder').submit();
            }
        }
    })
</script>