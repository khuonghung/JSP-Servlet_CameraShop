<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/23/2021
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="row">
                <div class="col-12">
                    <div class="card-body">
                        <div class="card">
                            <img src="<c:url value="${imageBig}"/>"/>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row">
                        <c:forEach items="${product.lstEntityProductImages}" var="img" varStatus="theCount">
                            <div class="col-lg-3">
                                <div class="card">
                                    <img onclick="onClickImage(${theCount.index})" src="<c:url value="${img.image}"/>"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <h2 class="card-header">${product.name}</h2>
            <c:if test="${product.status}">
                <h3 class="badge-success text-center text-white">Đang kinh doanh</h3>
            </c:if>
            <c:if test="${!product.status}">
                <h3 class="badge-warning text-center text-white">Ngừng kinh doanh</h3>
            </c:if>
            <h3 class="text-danger">Giá tiền: <fmt:formatNumber value="${price}" type="currency"
                                                                currencySymbol=""/>₫</h3>
            <strong class="text-dark mr-4">Lượt xem: </strong><span>${product.view}</span><br/>
            <strong class="text-dark mr-4">Loại sản phẩm: </strong><span>${product.entityCategory.name}</span><br/>
            <strong class="text-dark mr-4">Thương hiệu: </strong><span>${product.entityBrand.name}</span><br/>
            <strong class="text-dark mr-4">Chọn loại: </strong><br/>
            <div class="outline-button">
                <c:forEach items="${product.lstEntityProductDetails}" var="details">
                    <c:if test="${idDetails == details.id}">
                        <button type="button" onclick="onClickProductAttribute(${details.id})"
                                class="btn mb-2 text-danger active"
                                style="border: 1px solid orangered; font-weight: bold;">
                                ${details.entityAttribute.name} - ${details.entityAttribute.value}
                        </button>
                    </c:if>
                    <c:if test="${idDetails != details.id}">
                        <button type="button" onclick="onClickProductAttribute(${details.id})"
                                class="btn mb-2 btn-default">
                                ${details.entityAttribute.name} - ${details.entityAttribute.value}
                        </button>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
