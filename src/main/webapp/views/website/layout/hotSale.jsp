<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 7:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-4">
    <div class="category-wrapper mb-md-24 mb-sm-24">
        <div class="section-title-2 d-flex justify-content-between mb-28">
            <h3><fmt:message key="CONTENT.MENU.HOTSALE"/></h3>
            <div class="category-append"></div>
        </div> <!-- section title end -->
        <div class="category-carousel-active row" data-row="4">
            <c:forEach items="${lstHotSaleProduct}" var="product">
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="<c:url value="/product?id=${product.id}"/>">
                                <c:forEach items="${product.lstEntityProductImages}" var="img" varStatus="thecount">
                                    <c:if test="${thecount.index == 0}">
                                        <img src="<c:url value="${img.image}"/>" height="100px" alt="">
                                    </c:if>
                                </c:forEach>
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="<c:url value="/product?id=${product.id}"/>">
                                    ${product.name}
                            </a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    <c:set var="min" value="${0}"/>
                                    <c:set var="max" value="${0}"/>
                                    <c:forEach var="details" items="${product.lstEntityProductDetails}">
                                        <c:if test="${details.price >= max}">
                                            <c:set var="max" value="${details.price}"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach var="details" items="${product.lstEntityProductDetails}">
                                        <c:if test="${details.price < max}">
                                            <c:set var="min" value="${details.price}"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${min == 0}">
                                        <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/>₫
                                    </c:if>
                                    <c:if test="${min != 0}">
                                        <fmt:formatNumber value="${min}" type="currency" currencySymbol=""/>₫
                                        - <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/>₫
                                    </c:if>
                                    <c:if test="${product.persenSale >0}">
                                        <span class="text-dark">(-${product.persenSale}%)</span>
                                    </c:if>
                                </div>
                                <div class="old-price">
                                    <del></del>
                                </div>
                            </div>
                            <div class="ratings">
                                <span class="good"><i class="icon-like"></i></span>
                                <div class="pro-review">
                                    <span>
                                        ${fn:length(product.lstEntityLikes)} like(s)
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end single item -->
                </div>
                <!-- end single item column -->
            </c:forEach>
        </div>
    </div>
</div>

