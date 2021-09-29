<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/20/2021
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${lstBrand}" var="brand" varStatus="theCount">
    <c:if test="${!brand.removed}">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>${brand.name}</td>
            <td>${brand.phoneNumber}</td>
            <td>${brand.email}</td>
            <td>${brand.address}</td>
            <td>${brand.description}</td>
            <td>
                    <%--                <button class="btn btn-danger mx-2">--%>
                    <%--                    <a href="<c:url value="/admin/brand/quan-ly-thuong-hieu?remove=true&id=${brand.id}"/>"--%>
                    <%--                       class="text-white">Xoá</a>--%>
                    <%--                </button>--%>
                <button class="btn btn-info mx-2">
                    <a href="<c:url value="/admin/brand/edit?id=${brand.id}"/>" class="text-white">Sửa</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>

