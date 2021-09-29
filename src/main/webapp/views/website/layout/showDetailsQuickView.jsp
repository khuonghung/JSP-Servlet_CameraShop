<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 9:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- product details inner end -->
<div class="product-details-inner">
    <div class="row">
        <div class="col-lg-5">
            <div class="product-large-slider slick-arrow-style_2 mb-20">
                <c:forEach items="${product1.lstEntityProductImages}" var="img">
                    <div class="pro-large-img">
                        <img src="<c:url value="${img.image}"/>" alt=""/>
                    </div>
                </c:forEach>
            </div>
            <div class="pro-nav slick-padding2 slick-arrow-style_2">
                <c:forEach items="${product1.lstEntityProductImages}" var="img">
                    <div class="pro-nav-thumb"><img src="<c:url value="${img.image}"/>" alt=""/></div>
                </c:forEach>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="product-details-des mt-md-34 mt-sm-34">
                <h3><a href="<c:url value="/product?id=${product1.id}"/>">${product1.name}</a></h3>
                <div class="ratings">
                    <span class="good"><i class="fa fa-star"></i></span>
                    <span class="good"><i class="fa fa-star"></i></span>
                    <span class="good"><i class="fa fa-star"></i></span>
                    <span class="good"><i class="fa fa-star"></i></span>
                    <span><i class="fa fa-star"></i></span>
                    <div class="pro-review">
                        <span>1 review(s)</span>
                    </div>
                </div>
                <div class="availability mt-10">
                    <h5>Loại:</h5>
                    <span>${product1.entityCategory.name}</span>
                </div>
                <div class="availability mt-10">
                    <h5>Hãng:</h5>
                    <span>${product1.entityBrand.name}</span>
                </div>
                <div class="pricebox">
                                    <span class="regular-price">
                        <c:set var="min" value="${0}"/>
                        <c:set var="max" value="${0}"/>
                        <c:forEach var="details1" items="${product1.lstEntityProductDetails}">
                            <c:if test="${details1.price >= max}">
                                <c:set var="max" value="${details1.price}"/>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="details1" items="${product1.lstEntityProductDetails}">
                            <c:if test="${details1.price < max}">
                                <c:set var="min" value="${details1.price}"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${min == 0}">
                            <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/>₫
                        </c:if>
                        <c:if test="${min != 0}">
                            <fmt:formatNumber value="${min}" type="currency" currencySymbol=""/>₫
                            - <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/>₫
                        </c:if>
                                                                                                    <c:if test="${product1.persenSale >0}">
                                                                                                        <span class="text-dark">(-${product1.persenSale}%)</span>
                                                                                                    </c:if>
                                    </span>
                </div>
                <p>
                    <c:set var="description1"
                           value="${fn:substring(product1.description, 0, 200)}"/>
                    <c:out value="${description1}" escapeXml="false"/>
                </p>
                <table class="table table-bordered group-product-table mt-10 mb-20">
                    <tbody>
                    <c:forEach items="${product1.lstEntityProductDetails}" var="details1">
                        <tr class="text-center">
                            <td>
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </td>
                            <td><a href="#">
                                    ${details1.entityAttribute.name} - ${details1.entityAttribute.value}
                            </a></td>
                            <td>
                                <fmt:formatNumber value="${details1.price - (details1.price * product1.persenSale)/100}"
                                                  type="currency" currencySymbol=""/>₫
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="quantity-cart-box d-flex align-items-center mt-20">
                    <div class="action_link">
                        <a class="buy-btn" href="#">add to cart<i class="fa fa-shopping-cart"></i> </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- product details inner end -->
<jsp:include page="/decorators/web/layout/js.jsp"/>


