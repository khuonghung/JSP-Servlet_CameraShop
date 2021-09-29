<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/27/2021
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Giỏ hàng</title>

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
                            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng</li>
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
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="pro-thumbnail">Hình ảnh</th>
                            <th class="pro-title">Sản phẩm</th>
                            <th class="pro-price">Giá</th>
                            <th class="pro-quantity">Số lượng</th>
                            <th class="pro-subtotal">Thành tiền</th>
                            <th class="pro-remove">Xoá</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lstCart}" var="cart">
                            <tr>
                                <td class="pro-thumbnail">
                                    <a href="#">
                                        <c:forEach items="${cart.entityProduct.lstEntityProductImages}" var="img"
                                                   varStatus="theCount">
                                            <c:if test="${theCount.index == 0}">
                                                <img class="img-fluid" src="<c:url value="${img.image}"/>"
                                                     alt="Product"/>
                                            </c:if>
                                        </c:forEach>
                                    </a>
                                </td>
                                <td class="pro-title">
                                    <a href="<c:url value="/product?id=${cart.entityProduct.id}"/>">
                                            ${cart.entityProduct.name} (${cart.entityAttribute.name}
                                        - ${cart.entityAttribute.value})
                                    </a>
                                </td>
                                <td class="pro-price">
                                    <span>
                                        <c:if test="${cart.entityProduct.persenSale == 0}">
                                            <fmt:formatNumber value="${cart.price}"
                                                              type="currency" currencySymbol=""/>₫
                                        </c:if>
                                        <c:if test="${cart.entityProduct.persenSale > 0}">
                                            <del>
                                                <fmt:formatNumber value="${cart.price}"
                                                                  type="currency" currencySymbol=""/>₫
                                            </del>
                                            <fmt:formatNumber
                                                    value="${cart.price - (cart.price *cart.entityProduct.persenSale)/100}"
                                                    type="currency" currencySymbol=""/>₫
                                        </c:if>
                                    </span>
                                </td>
                                <td class="pro-quantity">
                                        ${cart.quantity}
                                </td>
                                <td class="pro-subtotal">
                                    <span>
                                        <fmt:formatNumber
                                                value="${(cart.price - (cart.price *cart.entityProduct.persenSale)/100) * cart.quantity}"
                                                type="currency" currencySymbol=""/>₫
                                    </span>
                                </td>
                                <td class="pro-remove"><a href="<c:url value="/cart?remove=true&id=${cart.id}"/>"><i
                                        class="fa fa-trash-o"></i></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Update Option -->
                <div class="cart-update-option d-block d-md-flex justify-content-between">
                    <div class="apply-coupon-wrapper">
                        <form method="post" class=" d-block d-md-flex">
                            <input type="text" id="voucher" name="voucher" placeholder="Nhập mã giảm giá" required/>
                            <button class="sqr-btn">Áp dụng</button>
                        </form>
                    </div>
                    <div class="cart-update mt-sm-16">
                        <a href="<c:url value="/product"/>" class="sqr-btn">Mua thêm</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5 ml-auto">
                <!-- Cart Calculation Area -->
                <div class="cart-calculator-wrapper">
                    <div class="cart-calculate-items">
                        <h3>Tổng tiền hoá đơn</h3>
                        <div class="table-responsive">
                            <table class="table">
                                <tr>
                                    <td>Tổng tiền</td>
                                    <td>
                                        <c:set var="total" value="${0}"/>
                                        <c:forEach items="${lstCart}" var="cart">
                                            <c:set var="total"
                                                   value="${total + (cart.price * cart.quantity)}"/>
                                        </c:forEach>
                                        <fmt:formatNumber value="${total}" type="currency" currencySymbol=""/>₫
                                    </td>
                                </tr>
                                <tr>
                                    <td>Giảm giá</td>
                                    <td>
                                        <c:set var="discount" value="${0}"/>
                                        <c:forEach items="${lstCart}" var="cart">
                                            <c:set var="discount"
                                                   value="${discount + ((cart.price * (cart.entityProduct.persenSale)/100) * cart.quantity)}"/>
                                        </c:forEach>
                                        <fmt:formatNumber value="${discount}" type="currency" currencySymbol=""/>₫
                                    </td>
                                </tr>
                                <c:set var="voucher" value="${discountVoucher}"/>
                                <c:if test="${voucher > 0}">
                                    <tr>
                                        <td>Voucher</td>
                                        <td>
                                            <fmt:formatNumber value="${voucher}" type="currency" currencySymbol=""/>₫
                                        </td>
                                    </tr>
                                </c:if>
                                <tr class="total">
                                    <td>Thành tiền</td>
                                    <td class="total-amount">
                                        <fmt:formatNumber value="${total - discount - voucher}" type="currency"
                                                          currencySymbol=""/>₫
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <c:if test="${not empty lstCart}">
                        <a href="<c:url value="/checkout"/>" class="sqr-btn d-block">Thanh toán</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- cart main wrapper end -->

