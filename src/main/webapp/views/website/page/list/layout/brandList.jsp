<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-widget mb-30">
    <div class="sidebar-title mb-10">
        <h3><fmt:message key="HEADER.SIDEBAR.HANG"/></h3>
    </div>
    <div class="sidebar-widget-body">
        <ul>
            <c:forEach items="${lstBrand}" var="brand">
                <li><i class="fa fa-angle-right"></i>
                    <a href="<c:url value="/brand?id=${brand.id}"/>">${brand.name}</a>
                    <span>(${fn:length(brand.lstProducts)})</span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

