<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/30/2021
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<strong class="text-dark">Mã hoá đơn: </strong>
<span>${payment.id}</span><br/>
<strong class="text-dark">Nhân viên bán hàng: </strong>
<span>
<c:if test="${not empty payment.entityStaffSale}">
    ${payment.entityStaffSale.lastName} ${payment.entityStaffSale.firstName}
</c:if>
</span>
<br/>
<strong class="text-dark">Nhân viên thu ngân: </strong>
<span>
    <c:if test="${not empty payment.entityStaffCashier}">
        ${payment.entityStaffCashier.lastName} ${payment.entityStaffCashier.firstName}
    </c:if>
</span><br/>
<strong class="text-dark">Số điện thoại khách: </strong>
<span>
    ${payment.entityVisit.phoneNumber}
</span><br/>
<strong class="text-dark">Voucher: </strong>
<span>
    <c:if test="${not empty payment.entityVoucher}">
        ${payment.entityVoucher.id}
    </c:if>
</span><br/>
<strong class="text-dark">Tổng tiền: </strong>
<span>
    <fmt:formatNumber value="${payment.paymentAmount}" type="currency" currencySymbol=""/>₫
</span><br/>
<table class="table table-striped table-bordered zero-configuration">
    <thead>
    <tr>
        <td>#</td>
        <td>Tên sản phẩm</td>
        <td>Loại</td>
        <td>Thương hiệu</td>
        <td>Thuộc tính</td>
        <td>Giá bán</td>
        <td>Số lượng</td>
        <td>Thành tiền</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${payment.lstEntityPaymentDetails}" var="details" varStatus="theCount">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>${details.entityProductDetails.entityProduct.name}</td>
            <td>${details.entityProductDetails.entityProduct.entityCategory.name}</td>
            <td>${details.entityProductDetails.entityProduct.entityBrand.name}</td>
            <td>
                    ${details.entityProductDetails.entityAttribute.name}
                - ${details.entityProductDetails.entityAttribute.value}
            </td>
            <td>
                <fmt:formatNumber value="${details.price}" type="currency"
                                  currencySymbol=""/>₫
            </td>
            <td>${details.quantity}</td>
            <td>
                <fmt:formatNumber value="${details.price * details.quantity}" type="currency"
                                  currencySymbol=""/>₫
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


