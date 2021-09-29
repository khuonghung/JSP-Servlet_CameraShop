<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${LANG}"/>
<fmt:setBundle basename="polymart.xyz.i18n.lang" scope="request"/>
<title><fmt:message key="TITLE.HOME"/></title>

<jsp:include page="layout/banner.jsp"/>

<!-- page wrapper start -->
<div class="page-wrapper pt-6 pb-28 pb-md-6 pb-sm-6 pt-xs-36">
    <div class="container">

        <jsp:include page="layout/featuredHome.jsp"/>

        <jsp:include page="layout/newArrivalsHome.jsp"/>

        <!-- category features area start -->
        <div class="category-feature-area">
            <div class="row">
                <jsp:include page="layout/newProduct.jsp"/>
                <!-- New Products area end -->
                <!-- Most viewed area start -->
                <jsp:include page="layout/mostViewed.jsp"/>
                <!-- Most viewed area end -->
                <!-- Most viewed area start -->
                <jsp:include page="layout/hotSale.jsp"/>
                <!-- Most viewed area end -->
            </div>
        </div>
        <!-- category features area end -->
        <jsp:include page="layout/lastestProduct.jsp"/>
    </div>
</div>
<!-- page wrapper end -->

<!-- latest product start -->
