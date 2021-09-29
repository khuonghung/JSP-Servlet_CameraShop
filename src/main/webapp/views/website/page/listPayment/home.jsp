<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/4/2021
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${LANG}"/>
<fmt:setBundle basename="polymart.xyz.i18n.lang" scope="request"/>
<title><fmt:message key="HEADER.TOP.HOADONDAMUA"/></title>

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
                            <li class="breadcrumb-item active" aria-current="page"><fmt:message
                                    key="HEADER.TOP.HOADONDAMUA"/></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->
<!-- cart main wrapper start -->
<div class="cart-main-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Cart Table Area -->
                <div class="cart-table table-responsive">
                    <c:if test="${not empty VISIT}">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="pro-thumbnail">#</th>
                                <th class="pro-title">Mã hoá đươn</th>
                                <th class="pro-price">Số tiền</th>
                                <th class="pro-quantity">Mã giảm giá</th>
                                <th class="pro-subtotal">Thanh toán</th>
                                <th class="pro-remove"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="theCount" value="${0}"/>
                            <c:forEach items="${lstPayment}" var="payment">
                                <c:if test="${VISIT.phoneNumber == payment.entityVisit.phoneNumber}">
                                    <c:if test="${not empty payment.lstEntityPaymentDetails}">
                                        <c:set var="theCount" value="${theCount + 1}"/>
                                        <tr>
                                            <td class="pro-thumbnail">
                                                    ${theCount}
                                            </td>
                                            <td class="pro-title">
                                                    ${payment.id}
                                            </td>
                                            <td class="pro-price">
                                                <fmt:formatNumber
                                                        value="${payment.paymentAmount}"
                                                        type="currency" currencySymbol=""/>₫
                                            </td>
                                            <td class="pro-quantity">
                                                <c:if test="${not empty payment.entityVoucher}">
                                                    ${payment.entityVoucher.id}
                                                </c:if>
                                                <c:if test="${empty payment.entityVoucher}">
                                                    x
                                                </c:if>
                                            </td>
                                            <td class="pro-subtotal">
                                                <c:if test="${payment.statusPayment}">
                                                    Đã thanh toán
                                                </c:if>
                                                <c:if test="${!payment.statusPayment}">
                                                    Chưa thanh toán
                                                </c:if>
                                            </td>
                                            <td class="pro-remove">
                                                <a href="<c:url value="/payment-visit?id=${payment.id}"/>">Xem chi
                                                    tiết</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty VISIT}">
                        <span>Vui lòng đăng nhập để xem chi tiết đơn hàng</span>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- cart main wrapper end -->
