<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/30/2021
  Time: 8:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý mã giảm giá</title>

<div class="content-body">

    <div class="container-fluid">
        <div class="float-left mt-2">
            <button class="btn btn-success">
                <a href="<c:url value="/admin/voucher/add"/>" class="text-white">Thêm mã giảm giá</a>
            </button>
        </div>
        <div class="row page-titles mx-0">
            <div class="col p-md-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý mã giảm giá</a></li>
                </ol>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Danh sách mã giảm giá</h2>
                        <h4 class="text-danger">${errorVoucher}</h4>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                <jsp:include page="table-title.jsp"/>
                                </thead>
                                <tbody>
                                <%@include file="table-data.jsp" %>
                                </tbody>
                                <tfoot>
                                <jsp:include page="table-title.jsp"/>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- #/ container -->

