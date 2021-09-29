<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="header-top-area bg-gray text-center text-md-left">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-5">
                <div class="header-call-action">
                    <a href="?lang=en_US">
                        EN
                    </a>
                    <a href="?lang=vi_VN">
                        VI
                    </a>
                    <a href="?lang=zh_CN">
                        CN
                    </a>
                </div>
            </div>
            <div class="col-lg-6 col-md-7">
                <div class="header-top-right float-md-right float-none">
                    <nav>
                        <ul>
                            <c:if test="${empty VISIT}">
                                <li>
                                    <a href="#click-login" data-toggle="modal">
                                        <fmt:message key="HEADER.TOP.DANGNHAP"/>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${not empty VISIT}">
                                <li>
                                    <a href="<c:url value="/logout"/>">
                                        <fmt:message key="HEADER.TOP.DANGXUAT"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/payment-visit"/>">
                                        <fmt:message key="HEADER.TOP.HOADONDAMUA"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/cart"/>">
                                        <fmt:message key="HEADER.TOP.GIOHANG"/>
                                    </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/checkout"/>">
                                        <fmt:message key="HEADER.TOP.THANHTOAN"/>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>