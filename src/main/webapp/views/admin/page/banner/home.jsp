<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/25/2021
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý banner website</title>
<div class="content-body">

    <div class="container-fluid">
        <div class="float-left mt-2">
            <button class="btn btn-success">
                <a href="<c:url value="/admin/banner/add"/>" class="text-white">Tạo banner</a>
            </button>
        </div>
        <div class="row page-titles mx-0">
            <div class="col p-md-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý banner website</a></li>
                </ol>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Danh sách banner đã tạo</h2>
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered zero-configuration">
                                <thead>
                                <jsp:include page="layout/table-title.jsp"/>
                                </thead>
                                <tbody>
                                <%@include file="layout/table-data.jsp" %>
                                </tbody>
                                <tfoot>
                                <jsp:include page="layout/table-title.jsp"/>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $('a').click(function (e) {
        if (e.currentTarget.id === 'idBanner') {
            swal({
                title: 'Cảnh báo!',
                text: 'Xoá banner sẽ không thể khôi phục. Tiếp tục?',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Tiếp tục',
                closeOnConfirm: !1
            }, function () {
                window.location = e.target.href;
            })
        }
    })

</script>
