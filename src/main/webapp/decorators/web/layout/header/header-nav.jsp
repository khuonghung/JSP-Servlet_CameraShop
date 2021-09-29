<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-menu">
    <nav id="mobile-menu">
        <ul>
            <li class="text-danger"><a href="#">
                <%--                <i class="fa fa-home"></i>--%>
                <fmt:message key="HEADER.MENU.SANPHAMMOIXEM"/>
                <i class="fa fa-angle-down"></i></a>
                <ul class="dropdown">
                    <li><a href="index.html">Home version 01</a></li>
                    <li><a href="index-2.html">Home version 02</a></li>
                    <li><a href="index-3.html">Home version 03</a></li>
                    <li><a href="index-4.html">Home version 04</a></li>
                </ul>
            </li>
            <li><a href="<c:url value="/contact"/>">
                <fmt:message key="HEADER.MENU.CONTACT"/>
            </a></li>
        </ul>
    </nav>
</div>
