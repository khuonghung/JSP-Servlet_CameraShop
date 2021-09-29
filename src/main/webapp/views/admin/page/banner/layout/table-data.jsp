<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/25/2021
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstBanner}" var="banner" varStatus="theCount">
    <c:if test="${!banner.removed}">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>
                    ${banner.entityStaff.lastName} ${banner.entityStaff.firstName}
            </td>
            <td>${banner.name}</td>
            <td>${banner.event}</td>
            <td>${banner.description}</td>
            <td>
                <a href="<c:url value="${banner.image}"/>">Link ảnh</a>
            </td>
            <td>
                <a href="<c:url value="${banner.link}"/>">Link website</a>
            </td>
            <td><fmt:formatDate value="${banner.dateEnded}" pattern="dd-MM-yyyy"/></td>
            <td class="text-center">
                <button class="btn btn-danger">
                    <a id="idBanner" href="<c:url value="/admin/banner?remove=true&id=${banner.id}"/>">
                        Xoá
                    </a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>

