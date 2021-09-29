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
        <img class="mr-3 rounded-circle" src="<c:url value="/assets/admin/images/avatar/1.jpg"/>">
        <div class="media-body">
            <h5 class="m-b-3">${contact.subject}</h5>
            <p class="m-b-2">
                <fmt:formatDate value="${contact.dateSend}" pattern="dd-MM-yyyy"/>
            </p>
        </div>
    </div>
    <hr>
    <div class="media mb-4 mt-1">
        <div class="media-body">
            <span class="float-right">
                <fmt:formatDate value="${contact.dateSend}" pattern="hh:mm a"/>
            </span>
            <small class="text-muted">From: ${contact.email}</small>
        </div>
    </div>
    <p>${contact.body}</p>
    <hr>
    <h3 class="text-dark">Trả lời</h3>
    <div class="form-group p-t-15">
        <textarea class="w-100 p-20 l-border-1" name="contact" id="body-repcontact" cols="30" rows="5"
                  placeholder="Nhập nội dung..."></textarea>
    </div>
</div>
<div class="text-right">
    <button class="btn btn-primaryw-md m-b-30" type="button" onclick="sendRepContact(${contact.id})">Send</button>
</div>

