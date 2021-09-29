<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="category-toggle-wrap">
    <div class="category-toggle">
        <fmt:message key="HEADER.SIDEBAR.SANPHAM"/>
        <div class="cat-icon">
            <i class="fa fa-angle-down"></i>
        </div>
    </div>
    <nav class="category-menu category-style-2">
        <ul>
            <li class="menu-item-has-children"><a href="<c:url value="/product"/>">
                <i class="fa fa-camera"></i>
                <fmt:message key="HEADER.SIDEBAR.CAMERA"/> </a>
                <!-- Mega Category Menu Start -->
                <ul class="category-mega-menu">
                    <li class="menu-item-has-children">
                        <a href="<c:url value="/category"/>">
                            <fmt:message key="HEADER.SIDEBAR.LOAI"/>
                        </a>
                        <ul>
                            <c:forEach items="${lstCategory}" var="category">
                                <li><a href="<c:url value="/category?id=${category.id}"/>">${category.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="menu-item-has-children">
                        <a href="<c:url value="/brand"/>">
                            <fmt:message key="HEADER.SIDEBAR.HANG"/>
                        </a>
                        <ul>
                            <c:forEach items="${lstBrand}" var="brand">
                                <li><a href="<c:url value="/brand?id=${brand.id}"/>">${brand.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul><!-- Mega Category Menu End -->
            </li>
        </ul>
    </nav>
</div>