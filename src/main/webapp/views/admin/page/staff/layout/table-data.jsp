<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${lstStaff}" var="staff" varStatus="theCount">
    <c:if test="${!staff.removed}">
        <tr>
            <td>${theCount.index + 1}</td>
            <td>${staff.lastName} ${staff.firstName}</td>
            <td><fmt:formatDate value="${staff.birthday}" pattern="dd-MM-yyyy"/></td>
            <td>${staff.address}</td>
            <td>${staff.email}</td>
            <td>${staff.role}</td>
            <td>${staff.active ? "<span class='text-success'>Đã kích hoạt</span>"
                    : "<span class='text-danger'>Chưa kích hoạt</span>"}</td>
            <td>
                <c:if test="${staff.blocked}">
                    <button class="btnBlock btn btn-success mx-2">
                        <a href="<c:url value="/admin/staff/unblock?email=${staff.email}"/>"
                           class="btnBlock text-white">
                            Mở khoá</a>
                    </button>
                </c:if>
                <c:if test="${!staff.blocked}">
                    <button class="btn btn-warning mx-2">
                        <a href="<c:url value="/admin/staff/block?email=${staff.email}"/>" class="btnBlock text-white">Khoá</a>
                    </button>
                </c:if>
                    <%--                <button class="btn btn-danger mx-2">--%>
                    <%--                    <a href="<c:url value="/admin/staff/remove?email=${staff.email}"/>" class="text-white">Xoá</a>--%>
                    <%--                </button>--%>
                <button class="btn btn-info mx-2">
                    <a href="<c:url value="/admin/staff/edit?email=${staff.email}"/>" class="text-white">Sửa</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>
