<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/26/2021
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar-widget mb-30">
    <div class="sidebar-title mb-10">
        <h3><fmt:message key="CONTENT.MENU.THUOCTINH"/></h3>
    </div>
    <div class="sidebar-widget-body">
        <ul>
            <c:forEach items="${lstAttribute}" var="attribute">
                <li><i class="fa fa-angle-right"></i>
                    <a href="#">
                            ${attribute.name} - ${attribute.value}
                    </a>
                    <span>
                        (
                        <c:set var="count" value="${0}"/>
                        <c:set var="tmp" value="${0}"/>
                        <c:forEach items="${attribute.lstProductDetails}" var="details">
                            <c:if test="${tmp == 0}">
                                <c:set var="tmp" value="${details.entityProduct.id}"/>
                            </c:if>
                            <c:if test="${details.entityProduct.id == tmp}">
                                <c:set var="count" value="${count + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${count}
                        )
                    </span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

