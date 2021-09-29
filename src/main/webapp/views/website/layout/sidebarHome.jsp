<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 7:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- start home sidebar -->
<div class="col-lg-3">
    <div class="home-sidebar">
        <!-- hot deals area start -->
        <div class="main-sidebar hot-deals-wrap mb-30">
            <div class="section-title-2 d-flex justify-content-between mb-28">
                <h3>hot deals</h3>
                <div class="slick-append"></div>
            </div> <!-- section title end -->
            <div class="deals-carousel-active slick-padding slick-arrow-style">
                <!-- product single item start -->
                <div class="product-item fix">
                    <div class="product-thumb">
                        <a href="product-details.html">
                            <img src="<c:url value="/assets/website/img/product/product-img7.jpg"/>"
                                 class="img-pri" alt="">
                            <img src="<c:url value="/assets/website/img/product/product-img13.jpg"/>"
                                 class="img-sec" alt="">
                        </a>
                        <div class="product-label">
                            <span>hot</span>
                        </div>
                        <div class="product-action-link">
                            <a href="#${productTopBuy.id}" class="quick_view" data-toggle="modal"
                               data-target="#quick_view"> <span
                                    data-toggle="tooltip" data-placement="left" title="Xem trước"><i
                                    class="fa fa-search"></i></span> </a>
                            <c:if test="${not empty VISIT}">
                                <c:if test="${empty lstLikeByVisit}">
                                    <a href="#${productTopBuy.id}" class="click_like" data-toggle="tooltip"
                                       data-placement="left" title="Yêu thích"><i
                                            class="click_wish_list fa fa-heart"></i></a>
                                </c:if>
                                <c:set var="count" value="${0}"/>
                                <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                                    <c:if test="${likeByVisit == productTopBuy.id}">
                                        <a href="#${productTopBuy.id}" class="click_like" data-toggle="tooltip"
                                           data-placement="left" title="Đã thích"><i
                                                class="click_wish_list fa fa-heart"></i></a>
                                        <c:set var="count" value="${1}"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${count == 0}">
                                    <a href="#${productTopBuy.id}" class="click_like" data-toggle="tooltip"
                                       data-placement="left" title="Yêu thích"><i
                                            class="click_wish_list fa fa-heart-o"></i></a>
                                </c:if>
                            </c:if>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Compare"><i
                                    class="fa fa-refresh"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Add to cart"><i
                                    class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-details.html">vertual product 01</a></h4>
                        <div class="pricebox">
                            <span class="regular-price">$70.00</span>
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
                        </div>
                    </div>
                </div>
                <!-- product single item end -->
                <!-- product single item start -->
                <div class="product-item fix">
                    <div class="product-thumb">
                        <a href="product-details.html">
                            <img src="<c:url value="/assets/website/img/product/product-img3.jpg"/>"
                                 class="img-pri" alt="">
                            <img src="<c:url value="/assets/website/img/product/product-img4.jpg"/>"
                                 class="img-sec" alt="">
                        </a>
                        <div class="product-label">
                            <span>hot</span>
                        </div>
                        <div class="product-action-link">
                            <a href="#${productTopBuy.id}" class="quick_view" data-toggle="modal"
                               data-target="#quick_view"> <span
                                    data-toggle="tooltip" data-placement="left" title="Xem trước"><i
                                    class="fa fa-search"></i></span> </a>
                            <c:if test="${not empty VISIT}">
                                <c:if test="${empty lstLikeByVisit}">
                                    <a href="#${productHot.id}" class="click_like" data-toggle="tooltip"
                                       data-placement="left" title="Yêu thích"><i
                                            class="click_wish_list fa fa-heart"></i></a>
                                </c:if>
                                <c:set var="count" value="${0}"/>
                                <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                                    <c:if test="${likeByVisit == productHot.id}">
                                        <a href="#${productHot.id}" class="click_like" data-toggle="tooltip"
                                           data-placement="left" title="Đã thích"><i
                                                class="click_wish_list fa fa-heart"></i></a>
                                        <c:set var="count" value="${1}"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${count == 0}">
                                    <a href="#${productHot.id}" class="click_like" data-toggle="tooltip"
                                       data-placement="left" title="Yêu thích"><i
                                            class="click_wish_list fa fa-heart-o"></i></a>
                                </c:if>
                            </c:if>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Compare"><i
                                    class="fa fa-refresh"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Add to cart"><i
                                    class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-details.html">vertual product 01</a></h4>
                        <div class="pricebox">
                            <span class="regular-price">$70.00</span>
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
                        </div>
                    </div>
                </div>
                <!-- product single item end -->
                <!-- product single item start -->
                <div class="product-item fix">
                    <div class="product-thumb">
                        <a href="product-details.html">
                            <img src="<c:url value="/assets/website/img/product/product-img5.jpg"/>"
                                 class="img-pri" alt="">
                            <img src="<c:url value="/assets/website/img/product/product-img1.jpg"/>"
                                 class="img-sec" alt="">
                        </a>
                        <div class="product-label">
                            <span>hot</span>
                        </div>
                        <div class="product-action-link">
                            <a href="#${productTopBuy.id}" class="quick_view" data-toggle="modal"
                               data-target="#quick_view"> <span
                                    data-toggle="tooltip" data-placement="left" title="Xem trước"><i
                                    class="fa fa-search"></i></span> </a>
                            <c:if test="${not empty VISIT}">
                                <c:if test="${empty lstLikeByVisit}">
                                    <a href="#" class="click_like" data-toggle="tooltip" data-placement="left"
                                       title="Yêu thích"><i
                                            class="click_wish_list fa fa-heart"></i></a>
                                </c:if>
                                <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                                    <c:if test="${likeByVisit == productTopBuy.id}">
                                        <a href="#" class="click_like" data-toggle="tooltip" data-placement="left"
                                           title="Đã thích"><i
                                                class="click_wish_list fa fa-heart"></i></a>
                                    </c:if>
                                    <c:if test="${likeByVisit != productTopBuy.id}">
                                        <a href="#" class="click_like" data-toggle="tooltip" data-placement="left"
                                           title="Yêu thích"><i
                                                class="click_wish_list fa fa-heart"></i></a>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Compare"><i
                                    class="fa fa-refresh"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="left" title="Add to cart"><i
                                    class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                    <div class="product-content">
                        <h4><a href="product-details.html">vertual product 01</a></h4>
                        <div class="pricebox">
                            <span class="regular-price">$70.00</span>
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
                        </div>
                    </div>
                </div>
                <!-- product single item end -->
            </div>
        </div>
        <!-- hot deals area end -->

        <!-- best seller area start -->
        <div class="main-sidebar category-wrapper mb-24">
            <div class="section-title-2 d-flex justify-content-between mb-28">
                <h3>best seller</h3>
                <div class="category-append"></div>
            </div> <!-- section title end -->
            <div class="category-carousel-active row" data-row="4">
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img1.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img2.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img3.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img4.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img5.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img6.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">Virtual Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img10.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">simple Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $150.00
                                </div>
                                <div class="old-price">
                                    <del>$180.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
                <div class="col">
                    <div class="category-item">
                        <div class="category-thumb">
                            <a href="product-details.html">
                                <img src="<c:url value="/assets/website/img/product/product-img12.jpg"/>"
                                     alt="">
                            </a>
                        </div>
                        <div class="category-content">
                            <h4><a href="product-details.html">external Product 01</a></h4>
                            <div class="price-box">
                                <div class="regular-price">
                                    $140.00
                                </div>
                                <div class="old-price">
                                    <del>$160.00</del>
                                </div>
                            </div>
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
                        </div>
                    </div> <!-- end single item -->
                </div> <!-- end single item column -->
            </div>
        </div>
        <!-- best seller area end -->

    </div>
</div>
<!-- end home sidebar -->

