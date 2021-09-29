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
<title>Chi tiết hoá đơn</title>

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
                            <li class="breadcrumb-item"><a href="<c:url value="/payment-visit"/>">Hoá đơn mua hàng</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Chi tiết hoá đơn</li>
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
                                <th class="pro-title">Tên sản phẩm</th>
                                <th class="pro-price">Loại sản phẩm</th>
                                <th class="pro-quantity">Thương hiệu</th>
                                <th class="pro-subtotal">Chi tiết</th>
                                <th class="pro-remove">Giá bán</th>
                                <th class="pro-remove">Số lượng</th>
                                <th class="pro-remove">Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${VISIT.phoneNumber == payment.entityVisit.phoneNumber}">
                                <c:forEach items="${payment.lstEntityPaymentDetails}" var="details"
                                           varStatus="theCount">
                                    <tr>
                                        <td class="pro-thumbnail">
                                                ${theCount.index+1}
                                        </td>
                                        <td class="pro-title">
                                                ${details.entityProductDetails.entityProduct.name}
                                        </td>
                                        <td class="pro-price">
                                                ${details.entityProductDetails.entityProduct.entityCategory.name}
                                        </td>
                                        <td class="pro-price">
                                                ${details.entityProductDetails.entityProduct.entityBrand.name}
                                        </td>
                                        <td class="pro-price">
                                                ${details.entityProductDetails.entityAttribute.name}
                                            - ${details.entityProductDetails.entityAttribute.value}
                                        </td>
                                        <td class="pro-price">
                                            <fmt:formatNumber value="${details.entityProductDetails.price}"
                                                              type="currency" currencySymbol=""/>₫
                                        </td>

                                        <td class="pro-quantity">
                                                ${details.quantity}
                                        </td>
                                        <td class="pro-subtotal">
                                            <fmt:formatNumber
                                                    value="${(details.entityProductDetails.price- details.priceSale) * details.quantity}"
                                                    type="currency" currencySymbol=""/>₫
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
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
