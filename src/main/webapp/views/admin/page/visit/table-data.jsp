<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${lstVisit}" var="visit" varStatus="theCount">
    <tr>
        <td>${theCount.index + 1}</td>
        <td>${visit.fullName}</td>
        <td>${visit.phoneNumber}</td>
        <td>${visit.email}</td>
        <td>${visit.address}</td>
    </tr>
</c:forEach>