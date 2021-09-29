<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-widget mb-30">
    <div class="sidebar-title mb-10">
        <h3><fmt:message key="CONTENT.FILTER.LOCTHEOGIA"/></h3>
    </div>
    <div class="sidebar-widget-body">
        <div class="price-range-wrap">
            <c:set var="max" value="${0}"/>
            <c:forEach items="${lstNewProduct}" var="productFilterPrice">
                <c:forEach items="${productFilterPrice.lstEntityProductDetails}" var="detailsFilterPrice">
                    <c:if test="${detailsFilterPrice.price > max}">
                        <c:set var="max" value="${detailsFilterPrice.price}"/>
                    </c:if>
                </c:forEach>
            </c:forEach>
            <c:set var="min" value="${max}"/>
            <c:forEach items="${lstNewProduct}" var="productFilterPrice">
                <c:forEach items="${productFilterPrice.lstEntityProductDetails}" var="detailsFilterPrice">
                    <c:if test="${detailsFilterPrice.price < min}">
                        <c:set var="min" value="${detailsFilterPrice.price}"/>
                    </c:if>
                </c:forEach>
            </c:forEach>
            <div id="filterPrice" class="price-range" data-min="${min}" data-max="${max}"></div>
            <div class="range-slider">
                <form id="idformfilterprice" action="#" class="d-flex justify-content-between">
                    <button class="filter-btn"><fmt:message key="CONTENT.FILTER.BTN"/></button>
                    <%--                        <label for="amount">Giá: </label>--%>
                    <input type="text" id="amount" disabled/>
                </form>
            </div>
        </div>
    </div>
</div>

