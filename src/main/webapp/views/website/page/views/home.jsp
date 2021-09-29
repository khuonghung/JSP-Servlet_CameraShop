<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>${product.name}</title>
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
                            <li class="breadcrumb-item"><a href="<c:url value="/product"/>">shop</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<!-- product details wrapper start -->
<div class="product-details-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <!-- product details inner end -->
                <jsp:include page="layout/details.jsp"/>
                <!-- product details inner end -->

                <!-- product details reviews start -->
                <jsp:include page="layout/reviews.jsp"/>
                <!-- product details reviews end -->

                <!-- related products area start -->
                <jsp:include page="layout/reloadProduct.jsp"/>
                <!-- related products area end -->
            </div>

            <!-- sidebar start -->
            <div class="col-lg-3">
                <div class="shop-sidebar-wrap fix mt-md-22 mt-sm-22">
                    <!-- featured category start -->
                    <jsp:include page="layout/featured.jsp"/>
                    <!-- featured category end -->

                    <!-- manufacturer start -->
                    <jsp:include page="layout/manufacturer.jsp"/>
                    <!-- manufacturer end -->

                    <!-- product tag start -->
                    <jsp:include page="layout/tagList.jsp"/>
                    <!-- product tag end -->
                </div>
            </div>
            <!-- sidebar end -->
        </div>
    </div>
</div>
<!-- product details wrapper end -->


