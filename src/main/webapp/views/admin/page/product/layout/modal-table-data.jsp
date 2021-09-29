<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 11:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstCategory}" var="category" varStatus="theCount">
    <c:if test="${!category.removed}">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>${category.name}</td>
            <td>${category.description}</td>
            <td>
                <button class="btn btn-danger mx-2">
                    <a href="<c:url value="/admin/product/quan-ly-san-pham?remove=true&id=${product.id}"/>"
                       class="text-white">Xoá</a>
                </button>
                <button class="btn btn-info mx-2">
                    <a href="<c:url value="/admin/product/edit?id=${product.id}"/>" class="text-white">Sửa</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>

