<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="product-details-inner">
    <div class="row">
        <div class="col-lg-6">
            <div class="product-large-slider mb-20 slick-arrow-style_2">
                <c:forEach items="${product.lstEntityProductImages}" var="img">
                    <div class="pro-large-img img-zoom">
                        <img src="<c:url value="${img.image}"/>" alt=""/>
                    </div>
                </c:forEach>
            </div>
            <div class="pro-nav slick-padding2 slick-arrow-style_2">
                <c:forEach items="${product.lstEntityProductImages}" var="img">
                    <div class="pro-large-img img-zoom">
                        <div class="pro-nav-thumb"><img src="<c:url value="${img.image}"/>" alt=""/></div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="product-details-des mt-md-34 mt-sm-34">
                <h3><a href="#">${product.name}</a></h3>
                <div class="ratings">
                    <span><i class="icon-like"></i></span>
                    <div class="pro-review">
                        <span> ${fn:length(product.lstEntityLikes)} like(s)</span>
                    </div>
                </div>
                <div class="availability mt-10">
                    <h5>Loại:</h5>
                    <span>${product.entityCategory.name}</span>
                </div>
                <div class="pricebox">
                    <span class="regular-price">
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
                    </span>
                </div>
                <strong class="text-dark">Thương hiệu: </strong>
                <span>${product.entityBrand.name}</span><br/>
                <table class="table table-bordered group-product-table mt-10 mb-20">
                    <tbody>
                    <c:forEach items="${product.lstEntityProductDetails}" var="details" varStatus="theCount">
                        <tr class="text-center">
                            <td>
                                <div class="pro-qty">
                                    <input class="get-quantity" id="${details.id}" type="text" value="1">
                                </div>
                            </td>
                            <td><a href="#">
                                    ${details.entityAttribute.name} - ${details.entityAttribute.value}
                            </a></td>
                            <td>
                                <fmt:formatNumber value="${details.price - (details.price * product.persenSale)/100}"
                                                  type="currency" currencySymbol=""/> ₫
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="quantity-cart-box d-flex align-items-center">
                    <div class="action_link">
                        <a class="buy-btn" href="#add">add to cart<i class="fa fa-shopping-cart"></i> </a>
                    </div>
                </div>
                <div class="useful-links mt-20">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><i class="fa fa-refresh"></i>compare</a>
                    <c:if test="${not empty VISIT}">
                        <c:if test="${empty lstLikeByVisit}">
                            <a href="#${product.id}" class="click_like" data-toggle="tooltip" data-placement="left"
                               title="Yêu thích"><i
                                    class="click_wish_list fa fa-heart"></i></a>
                        </c:if>
                        <c:set var="count" value="${0}"/>
                        <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                            <c:if test="${likeByVisit == product.id}">
                                <a href="#${product.id}" class="click_like" data-toggle="tooltip" data-placement="left"
                                   title="Đã thích"><i
                                        class="click_wish_list fa fa-heart"></i></a>
                                <c:set var="count" value="${1}"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${count == 0}">
                            <a href="#${product.id}" class="click_like" data-toggle="tooltip" data-placement="left"
                               title="Yêu thích"><i
                                    class="click_wish_list fa fa-heart-o"></i></a>
                        </c:if>
                    </c:if>
                </div>
                <div class="share-icon mt-20">
                    <a class="facebook" href="#"><i class="fa fa-facebook"></i>like</a>
                    <a class="twitter" href="#"><i class="fa fa-twitter"></i>tweet</a>
                    <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>save</a>
                    <a class="google" href="#"><i class="fa fa-google-plus"></i>share</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('a').click(function (e) {
        if (e.currentTarget.className === 'buy-btn' && e.currentTarget.href.includes('#add')) {
            let getQuantity = document.getElementsByClassName('get-quantity');
            for (let i = 0; i < getQuantity.length; i++) {
                console.log(getQuantity[i].id)
                console.log(getQuantity[i].value)
                if (Number(getQuantity[i].value) > 0) {
                    $.ajax({
                        url: "/ASS_JV4_war_exploded/load/web/cart",
                        type: "get", //send it through get method
                        data: {
                            id: getQuantity[i].id,
                            quantity: getQuantity[i].value
                        },
                        success: function (response) {
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
            }
            swal('Thông báo', 'Đã thêm vào giỏ hàng', 'success')
        }
    })
</script>