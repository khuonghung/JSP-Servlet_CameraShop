<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/8/2021
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstInbox}" var="inbox">
    <div class="email-list m-t-15">
        <div class="message">
            <a href="#" onclick="loadRead(${inbox.id})">
                <div class="col-mail col-mail-1">
                    <img class="mr-3 rounded-circle" src="<c:url value="/assets/admin/images/avatar/1.jpg"/>">
                </div>
                <c:if test="${inbox.seen}">
                    <div class="col-mail col-mail-2">
                        <div class="subject">
                                ${fn:substring(inbox.subject, 0, 50)}
                            - <fmt:formatDate value="${inbox.dateSend}" pattern="hh:mm a"/>
                        </div>
                        <div class="date">
                            <fmt:formatDate value="${inbox.dateSend}" pattern="dd-MM-yyyy"/>
                        </div>
                    </div>
                </c:if>
                <c:if test="${!inbox.seen}">
                    <div class="col-mail col-mail-2">
                        <strong>
                            <div class="subject">
                                    ${fn:substring(inbox.subject, 0, 50)}
                                - <fmt:formatDate value="${inbox.dateSend}" pattern="hh:mm a"/>
                            </div>
                            <div class="date">
                                <fmt:formatDate value="${inbox.dateSend}" pattern="dd-MM-yyyy"/>
                            </div>
                        </strong>
                    </div>
                </c:if>
            </a>
            <hr/>
        </div>
    </div>
</c:forEach>
<!-- panel -->

