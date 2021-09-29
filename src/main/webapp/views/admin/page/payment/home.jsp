<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/20/2021
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý hoá đơn thanh toán</title>
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Hoá đơn thanh toán</a></li>
            </ol>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Danh sách hoá đơn</h2>
                        <h4 class="text-danger">${errorPayment}</h4>
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
<!-- #/ container -->

<div class="modal fade open-detail-payment" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin hoá đơn thanh toán</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body" id="show-details-payment">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('a').click(function (e) {
        if (e.currentTarget.id === 'showDetails') {
            e.preventDefault();
            $.ajax({
                url: e.target.href,
                type: "get", //send it through get method
                success: function (response) {
                    document.getElementById("show-details-payment").innerHTML = response
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    })
</script>