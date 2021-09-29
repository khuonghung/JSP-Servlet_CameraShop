<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý nhân viên</title>
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý nhân viên</a></li>
            </ol>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Danh sách nhân viên</h4>
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
<script>
    $('.btnBlock').click(function (e) {
        e.preventDefault();
        if (e.target.href === null || e.target.href === '' || e.target.href === 'undefined' || e.target.href === undefined) {
        } else {
            swal({
                title: 'Cảnh báo!',
                text: 'Bạn có chắc muốn thay đổi trạng thái nhân viên',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Thay đổi',
                closeOnConfirm: !1
            }, function () {
                window.location = e.target.href;
            })
        }
    })
</script>