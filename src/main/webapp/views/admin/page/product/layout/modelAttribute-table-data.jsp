<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/25/2021
  Time: 8:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstAttribute}" var="attribute" varStatus="theCount">
    <c:if test="${!attribute.removed}">
        <tr>
            <td class="idAttribute">${attribute.id}</td>
            <td class="nameAttribute">${attribute.name}</td>
            <td class="valueAttribute">${attribute.value}</td>
            <td class="text-center">
                <button class="btnEditAttribute btn btn-info" data-toggle="modal" data-target=".edit-attribue">
                    Sửa
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>


