<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/25/2021
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<strong class="text-dark">Mã hoá đơn: </strong>
<span>${billimport.id}</span><br/>
<strong class="text-dark">Người nhập: </strong>
<span>
                    ${billimport.entityStaffImport.lastName} ${billimport.entityStaffImport.firstName}
                </span><br/>
<strong class="text-dark">Người kiểm tra: </strong>
<span>
                    ${billimport.entityStaffCheck.lastName} ${billimport.entityStaffCheck.firstName}
                </span><br/>
<strong class="text-dark">Ngày nhập: </strong>
<span>
                   <fmt:formatDate value="${billimport.dateImport}" pattern="dd-MM-yyyy"/>
                </span><br/>
<strong class="text-dark">Tổng tiền: </strong>
<span>
                    <c:set var="total" value="${0}"/>
                <c:forEach items="${billimport.lstBillimportDetails}" var="details">
                    <c:set var="total" value="${total + details.price * details.quantity}"/>
                </c:forEach>
                <fmt:formatNumber value="${total}" type="currency"
                                  currencySymbol=""/>₫
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
        <td>Giá nhập</td>
        <td>Số lượng nhập</td>
        <td>Thành tiền</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${billimport.lstBillimportDetails}" var="details" varStatus="theCount">
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
                <fmt:formatNumber value="${details.entityProductDetails.price}" type="currency"
                                  currencySymbol=""/>₫
            </td>
            <td>
                <fmt:formatNumber value="${details.price}" type="currency"
                                  currencySymbol=""/>₫
            </td>
            <td>${details.quantity}</td>
            <td>
                <c:set var="total" value="${details.price * details.quantity}"/>
                <fmt:formatNumber value="${total}" type="currency"
                                  currencySymbol=""/>₫
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


