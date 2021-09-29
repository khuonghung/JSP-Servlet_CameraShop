<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/8/2021
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="read-content">
    <div class="media pt-5">
        <img class="mr-3 rounded-circle" src="<c:url value="${contact.entityStaff.avatar}"/>" width="50px"
             height="50px"/>
        <div class="media-body">
            <h5 class="m-b-3">${contact.entityStaff.lastName} ${contact.entityStaff.firstName}</h5>
            <p class="m-b-2">
                <fmt:formatDate value="${contact.dateRep}" pattern="dd-MM-yyyy"/>
            </p>
        </div>
    </div>
    <hr>
    <div class="media mb-4 mt-1">
        <div class="media-body">
            <span class="float-right">
                <fmt:formatDate value="${contact.dateRep}" pattern="hh:mm a"/>
            </span>
            <h5 class="m-b-3">${contact.subject}</h5>
            <small class="text-muted">To: ${contact.email}</small>
        </div>
    </div>
    <c:if test="${not empty contact.entityContact}">
        <div class="container bg-light"
             style="border: 1px solid slategray;
          border-radius: 5px;">
        <span class="float-right">
            <fmt:formatDate value="${contact.entityContact.dateSend}" pattern="hh:mm a"/>
        </span>
            <h5 class="m-b-3">${contact.entityContact.subject}</h5>
            <p>${contact.entityContact.body}</p>
        </div>
        <hr/>
    </c:if>
    <p>${contact.body}</p>
</div>