<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/22/2021
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${lstBillImport}" var="bill" varStatus="theCount">
    <c:if test="${!bill.removed}">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>${bill.id}</td>
            <td>${bill.entityStaffImport.lastName} ${bill.entityStaffImport.firstName}</td>
            <td>${bill.entityStaffCheck.lastName} ${bill.entityStaffCheck.firstName}</td>
            <td><fmt:formatDate value="${bill.dateImport}" pattern="dd-MM-yyyy"/></td>
            <td>
                <c:set var="total" value="${0}"/>
                <c:forEach items="${bill.lstBillimportDetails}" var="details">
                    <c:set var="total" value="${total + details.price * details.quantity}"/>
                </c:forEach>
                <fmt:formatNumber value="${total}" type="currency"
                                  currencySymbol=""/>₫
            </td>
            <td>
                    <%--                <button class="btn btn-info mx-2">--%>
                    <%--                    <a href="<c:url value="/admin/billimport/edit?id=${bill.id}"/>" class="text-white">Sửa</a>--%>
                    <%--                </button>--%>
                <button class="btn btn-info mx-2 text-center">
                    <a id="showDetails" href="<c:url value="/load/bilimport-details?id=${bill.id}"/>" class="text-white"
                       data-toggle="modal" data-target=".open-detail-billimport">Xem</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>