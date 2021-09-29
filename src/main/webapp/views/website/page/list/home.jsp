<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Danh sách sản phẩm</title>
<fmt:setLocale value="${LANG}"/>
<fmt:setBundle basename="polymart.xyz.i18n.lang" scope="request"/>

<!-- breadcrumb area start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value="/"/>">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Shop</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<!-- page wrapper start -->
<div class="page-main-wrapper">
    <div class="container">
        <div class="row">
            <!-- sidebar start -->
            <div class="col-lg-3 order-2 order-lg-1">
                <div class="shop-sidebar-wrap mt-md-28 mt-sm-28">
                    <!-- sidebar categorie start -->
                    <jsp:include page="layout/sidebarCategory.jsp"/>
                    <!-- sidebar categorie start -->

                    <!-- brand start -->
                    <jsp:include page="layout/brandList.jsp"/>
                    <!-- brand end -->

                    <!-- pricing filter start -->
                    <jsp:include page="layout/filterByPrice.jsp"/>
                    <!-- pricing filter end -->

                    <!-- product size start -->
                    <jsp:include page="layout/filterByAttribute.jsp"/>
                    <!-- product size end -->
                </div>
            </div>
            <!-- sidebar end -->

            <!-- product main wrap start -->
            <div class="col-lg-9 order-1 order-lg-2">
                <!-- product view wrapper area start -->
                <div class="shop-product-wrapper pt-34">
                    <!-- shop product top wrap start -->
                    <div class="shop-top-bar">
                        <div class="row">
                            <div class="col-lg-7 col-md-6">
                                <div class="top-bar-left">
                                    <div class="product-view-mode mr-70 mr-sm-0">
                                        <a class="active" href="#" data-target="grid"><i class="fa fa-th"></i></a>
                                        <a href="#" data-target="list"><i class="fa fa-list"></i></a>
                                    </div>
                                    <div class="product-amount">
                                        <p>Showing 1–16 of 21 results</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-5 col-md-6">
                                <div class="top-bar-right">
                                    <div class="product-short">
                                        <p>Sort By : </p>
                                        <select class="nice-select" name="sortby">
                                            <option value="trending">Relevance</option>
                                            <option value="sales">Name (A - Z)</option>
                                            <option value="sales">Name (Z - A)</option>
                                            <option value="rating">Price (Low &gt; High)</option>
                                            <option value="date">Rating (Lowest)</option>
                                            <option value="price-asc">Model (A - Z)</option>
                                            <option value="price-asc">Model (Z - A)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- shop product top wrap start -->

                    <!-- product item start -->
                    <div class="shop-product-wrap grid row">
                        <c:forEach items="${lstNewProduct}" var="product">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <!-- product single grid item start -->
                                <div class="product-item fix mb-30">
                                    <div class="product-thumb">
                                        <a href="<c:url value="/product?id=${product.id}"/>">
                                            <c:forEach items="${product.lstEntityProductImages}" var="img"
                                                       varStatus="theCount">
                                                <c:if test="${theCount.index == 0}">
                                                    <img src="<c:url value="${img.image}"/>" class="img-pri"
                                                         height="150px" alt=""/>
                                                </c:if>
                                                <c:if test="${theCount.index == 1}">
                                                    <img src="<c:url value="${img.image}"/>" class="img-sec"
                                                         height="150px" alt=""/>
                                                </c:if>
                                            </c:forEach>
                                        </a>
                                        <div class="product-label">
                                            <span>hot</span>
                                        </div>
                                        <div class="product-action-link">
                                            <a href="#${product.id}" class="quick_view" data-toggle="modal"
                                               data-target="#quick_view"> <span
                                                    data-toggle="tooltip" data-placement="left" title="Xem trước"><i
                                                    class="fa fa-search"></i></span> </a>
                                            <c:if test="${not empty VISIT}">
                                                <c:if test="${empty lstLikeByVisit}">
                                                    <a href="#${product.id}" class="click_like" data-toggle="tooltip"
                                                       data-placement="left" title="Yêu thích"><i
                                                            class="click_wish_list fa fa-heart-o"></i></a>
                                                </c:if>
                                                <c:set var="count" value="${0}"/>
                                                <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                                                    <c:if test="${likeByVisit == product.id}">
                                                        <a href="#${product.id}" class="click_like"
                                                           data-toggle="tooltip" data-placement="left" title="Đã thích"><i
                                                                class="click_wish_list fa fa-heart"></i></a>
                                                        <c:set var="count" value="${1}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${count == 0}">
                                                    <a href="#${product.id}" class="click_like" data-toggle="tooltip"
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
                                        <h4><a href="<c:url value="/product?id=${product.id}"/>">${product.name}</a>
                                        </h4>
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
                                            </span>
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
                                <!-- product single grid item end -->
                                <!-- product single list item start -->
                                <div class="product-list-item mb-30">
                                    <div class="product-thumb">
                                        <a href="<c:url value="/product?id=${product.id}"/>">
                                            <c:forEach items="${product.lstEntityProductImages}" var="img"
                                                       varStatus="theCount">
                                                <c:if test="${theCount.index == 0}">
                                                    <img src="<c:url value="${img.image}"/>" class="img-pri"
                                                         height="200px" alt=""/>
                                                </c:if>
                                                <c:if test="${theCount.index == 1}">
                                                    <img src="<c:url value="${img.image}"/>" class="img-sec"
                                                         height="200px" alt=""/>
                                                </c:if>
                                            </c:forEach>
                                        </a>
                                        <div class="product-label">
                                            <span>hot</span>
                                        </div>
                                    </div>
                                    <div class="product-list-content">
                                        <h3><a href="<c:url value="/product?id=${product.id}"/>">${product.name}</a>
                                        </h3>
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
                                        <div class="pricebox">
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
                                                <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/> ₫
                                            </c:if>
                                            <c:if test="${min != 0}">
                                                <fmt:formatNumber value="${min}" type="currency" currencySymbol=""/> ₫
                                                - <fmt:formatNumber value="${max}" type="currency" currencySymbol=""/> ₫
                                            </c:if>
                                        </div>
                                            <%--                                        <p>--%>
                                            <%--                                            <c:set var="description"--%>
                                            <%--                                                   value="${fn:substring(product.description, 0, 200)}"/>--%>
                                            <%--                                            <c:out value="${description}" escapeXml="false"/>--%>
                                            <%--                                        </p>--%>
                                        <div class="product-list-action-link">
                                            <a class="buy-btn" href="#" data-toggle="tooltip" data-placement="top"
                                               title="Add to cart">go to buy <i class="fa fa-shopping-cart"></i> </a>
                                            <a href="#${product.id}" class="quick_view" data-toggle="modal"
                                               data-target="#quick_view"> <span
                                                    data-toggle="tooltip" data-placement="left" title="Xem trước"><i
                                                    class="fa fa-search"></i></span> </a>
                                            <c:if test="${not empty VISIT}">
                                                <c:if test="${empty lstLikeByVisit}">
                                                    <a href="#${product.id}" class="click_like" data-toggle="tooltip"
                                                       data-placement="left" title="Yêu thích"><i
                                                            class="click_wish_list fa fa-heart"></i></a>
                                                </c:if>
                                                <c:set var="count" value="${0}"/>
                                                <c:forEach items="${lstLikeByVisit}" var="likeByVisit">
                                                    <c:if test="${likeByVisit == product.id}">
                                                        <a href="#${product.id}" class="click_like"
                                                           data-toggle="tooltip" data-placement="left" title="Đã thích"><i
                                                                class="click_wish_list fa fa-heart"></i></a>
                                                        <c:set var="count" value="${1}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${count == 0}">
                                                    <a href="#${product.id}" class="click_like" data-toggle="tooltip"
                                                       data-placement="left" title="Yêu thích"><i
                                                            class="click_wish_list fa fa-heart-o"></i></a>
                                                </c:if>
                                            </c:if>
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><i
                                                    class="fa fa-refresh"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- product single list item start -->
                            </div>
                            <!-- product single column end -->
                        </c:forEach>
                    </div>
                    <!-- product item end -->
                </div>
                <!-- product view wrapper area end -->

                <!-- start pagination area -->
                <div class="paginatoin-area text-center pt-28">
                    <div class="row">
                        <div class="col-12">
                            <ul class="pagination-box">
                                <li><a class="Previous" href="#">Previous</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a class="Next" href="#"> Next </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- end pagination area -->

            </div>
            <!-- product main wrap end -->
        </div>
    </div>
</div>
<!-- page wrapper end -->


<script>
    $('#idformfilterprice').click(function (e) {
        e.preventDefault();
        let value = document.getElementById('amount').value
        // let min = value.substring(value.indexOf('$') + 1, value.indexOf(' '))
        // let max = value.substring(value.lastIndexOf('$') + 1)
        let min = value.substring(0, value.indexOf('₫'))
        let max = value.substring(value.lastIndexOf(' ') + 1, value.lastIndexOf('₫'))
        try {
            console.log(min)
            console.log(max)
            if (Number(min) && Number(max)) {
                window.location = '${pageContext.request.contextPath}/product?min=' + min + '&max=' + max
            } else {
                toastr.warning('Vui lòng chọn khoảng giá.', 'Thông báo!', {
                    positionClass: "toast-bottom-left",
                    timeOut: 5e3,
                    closeButton: !0,
                    debug: !1,
                    newestOnTop: !0,
                    progressBar: !0,
                    preventDuplicates: !0,
                    onclick: null,
                    showDuration: "300",
                    hideDuration: "1000",
                    extendedTimeOut: "1000",
                    showEasing: "swing",
                    hideEasing: "linear",
                    showMethod: "fadeIn",
                    hideMethod: "fadeOut",
                    tapToDismiss: !1
                })
            }
        } catch (x) {
            console.log(x)
        }
    })
</script>