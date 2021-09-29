<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-widget mb-22">
    <div class="sidebar-title mb-10">
        <h3><fmt:message key="HEADER.SIDEBAR.LOAI"/></h3>
    </div>
    <div class="sidebar-widget-body">
        <ul>
            <c:forEach items="${lstCategory}" var="category">
                <li>
                    <a href="<c:url value="/category?id=${category.id}"/>">${category.name}</a><span>(${fn:length(category.lstEntityProducts)})</span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

