<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/20/2021
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý sản phẩm</title>

<div class="content-body">

    <div class="container-fluid">
        <div class="float-left mt-2">
            <button class="btn btn-success">
                <a href="<c:url value="/admin/product/add"/>" class="addAttribute text-white"
                   data-toggle="modal" data-target=".add-attribue">
                    Thêm sản phẩm
                </a>
            </button>
        </div>
        <div class="row page-titles mx-0">
            <div class="col p-md-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý sản phẩm</a></li>
                </ol>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Danh sách sản phẩm</h2>
                        <h4 class="text-danger">${errorProduct}</h4>
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

<%--open thêm thuộc tính trước khi thêm sản phẩm mới--%>
<div class="modal fade add-attribue" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thuộc tính sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped verticle-middle">
                    <thead>
                    <tr>
                        <td>#</td>
                        <td>Thuộc tính</td>
                        <td>Value</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody id="show-attribute">

                    </tbody>
                    <tfoot>
                    <tr>
                        <td>#</td>
                        <td>Thuộc tính</td>
                        <td>Value</td>
                        <td></td>
                    </tr>
                    </tfoot>
                </table>
                <hr/>
                <div class="card-body">
                    <h3 class="card-header">Thêm thuộc tính</h3>
                    <div class="form-group row">
                        <input type="text" class="form-control" id="addnameattribute"
                               placeholder="Nhập tên thuộc tính..">
                    </div>
                    <div class="form-group row">
                        <input type="text" class="form-control" id="addvalueattribute"
                               placeholder="Giá trị..."/>
                    </div>
                    <button id="idaddattribute" class="btn btn-primary float-right">Thêm</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="close-add-attribute btn btn-success" data-dismiss="modal">Xong</button>
            </div>
        </div>
    </div>
</div>

<%--open sửa thuộc tính trước khi thêm sản phẩm mới--%>
<div class="modal fade edit-attribue" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sửa thuộc tính</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div class="form-group row">
                        <input type="text" class="form-control" id="editnameattribute"
                               placeholder="Nhập tên thuộc tính..">
                    </div>
                    <div class="form-group row">
                        <input type="text" class="form-control" id="editvalueattribute"
                               placeholder="Giá trị..."/>
                    </div>
                    <button id="ideditattribute" class="btn btn-primary float-right">Chỉnh sửa</button>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<%--open details produce--%>
<div class="modal fade open-details-product" tabindex="-1" role="dialog"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="nameProduct">Thông tin sản phẩm</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body show-details-product">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <%--                <button type="button" id="idbtnchangepassword" class="btn btn-primary">Đổi mật khẩu</button>--%>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {
        loadAttribute();
        onClickEdit()
    })

    var idAttribute = -1;
    // TODO sửa thuộc tính
    $('#ideditattribute').click(function () {
        let name = document.getElementById('editnameattribute').value
        let value = document.getElementById('editvalueattribute').value
        if (name === null || name.trim() === '') {
            toastDanger('Lỗi tên', 'Tên thuộc tính không được để trống')
            return;
        }
        if (value === null || value.trim() === '') {
            toastDanger('Lỗi giá trị', 'Giá trị thuộc tính không được để trống')
            return;
        }
        if (name.trim().length < 4) {
            toastWarning('Lỗi tên', 'Tên thuộc tính phải từ 4 ký tự')
            return;
        }
        if (name.trim().length < 2) {
            toastWarning('Lỗi giá trị', 'Giá trị thuộc tính phải từ 2 ký tự')
            return;
        }
        swal({
            title: 'Cảnh báo!',
            text: 'Đồng ý sửa thuộc tính?',
            type: "warning",
            showCancelButton: !0,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: 'Tiếp tục',
            closeOnConfirm: !1
        }, function () {
            console.log(idAttribute);
            if (idAttribute > 0) {
                updateAttribute(idAttribute, name, value, 'edit');
                swal('Thông báo', 'Đã chỉnh sửa thuộc tính', "success")
            } else {
                swal('Thông báo', 'Chỉnh sửa thuộc tính thất bại', "error")
            }
        })
    })

    // TODO Thêm thuộc tính
    $('#idaddattribute').click(function () {
        let name = document.getElementById('addnameattribute').value
        let value = document.getElementById('addvalueattribute').value
        if (name === null || name.trim() === '') {
            toastDanger('Lỗi tên', 'Tên thuộc tính không được để trống')
            return;
        }
        if (value === null || value.trim() === '') {
            toastDanger('Lỗi giá trị', 'Giá trị thuộc tính không được để trống')
            return;
        }
        if (name.trim().length < 4) {
            toastWarning('Lỗi tên', 'Tên thuộc tính phải từ 4 ký tự')
            return;
        }
        swal({
            title: 'Thông báo!',
            text: 'Thuộc tính sẽ không thể xoá bỏ. Tiếp tục thêm?',
            type: "warning",
            showCancelButton: !0,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: 'Tiếp tục',
            closeOnConfirm: !1
        }, function () {
            updateAttribute(null, name, value, 'add');
            swal('Thông báo', 'Đã thêm thuộc tính mới', "success")
        })
    })

    function updateAttribute(id, name, value, evt) {
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/attribute/" + evt,
            type: "get",
            data: {
                id: id,
                name: name,
                value: value
            },
            success: function (data) {
                document.getElementById("show-attribute").innerHTML = data;
                document.getElementById('addnameattribute').value = '';
                document.getElementById('addvalueattribute').value = '';
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
        onClickEdit()
    }

    // TODO hiển thị thêm thuộc tính trước khi thêm sản phẩm mới
    $('.addAttribute').click(function (e) {
        e.preventDefault();
    })

    $('.close-add-attribute').click(function () {
        window.location = document.querySelector('.addAttribute').href
    })

    function onClickEdit() {
        let arrBtn = document.getElementsByClassName('btnEditAttribute');
        let arrID = document.getElementsByClassName('idAttribute');
        let arrName = document.getElementsByClassName('nameAttribute');
        let arrValue = document.getElementsByClassName('valueAttribute');
        setTimeout(function () {
            for (let i = 0; i < arrBtn.length; i++) {
                arrBtn[i].onclick = onClickBtnEditAttribute

                function onClickBtnEditAttribute() {
                    idAttribute = arrID[i].innerHTML;
                    document.getElementById('editnameattribute').value = arrName[i].innerHTML
                    document.getElementById('editvalueattribute').value = arrValue[i].innerHTML
                }
            }
        }, 1000);
    }

    function loadAttribute() {
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/attribute",
            type: "get",
            success: function (data) {
                document.getElementById("show-attribute").innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    // TODO hiển thị detials product
    var idProductDetails = -1;
    var idProduct = -1;

    function onClickImage(image) {
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/product",
            type: "get",
            data: {
                id: idProduct,
                imageBig: image
            },
            success: function (data) {
                document.querySelector(".show-details-product").innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function onClickProductAttribute(e) {
        idProductDetails = e;
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/product",
            type: "get",
            data: {
                id: idProduct,
                idDetails: idProductDetails
            },
            success: function (data) {
                document.querySelector(".show-details-product").innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    $('.idproduct').click(function (e) {
        idProduct = e.currentTarget.id
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/product",
            type: "get",
            data: {
                id: e.currentTarget.id
            },
            success: function (data) {
                document.querySelector(".show-details-product").innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    })

    $(".statusProduct").click(function (e) {
        e.preventDefault();
        if (e.target.href === null || e.target.href === '' || e.target.href === 'undefined' || e.target.href === undefined) {
        } else {
            swal({
                    title: "Cảnh báo?",
                    text: "Bạn có chắc muốn thay đổi trạng thái kinh doanh của sản phẩm!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Tiếp tục!',
                    cancelButtonText: "Huỷ!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {

                    if (isConfirm) {
                        window.location = e.target.href
                    } else {
                        e.preventDefault();
                        swal("Thất bại", "Dừng thay đổi trạng thái", "error");
                    }
                });
        }
    });
</script>