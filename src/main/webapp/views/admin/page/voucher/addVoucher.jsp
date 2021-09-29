<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/30/2021
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thêm mã giảm giá</title>

<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý mã giảm giá</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)"> <c:if test="${editVoucher}">Sửa</c:if>
                    <c:if test="${!editVoucher}">Thêm</c:if> mã giảm giá</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Thêm mã giảm giá</h2>
                        <h4 class="text-danger mb-4">${errorAddVoucher}</h4>
                        <div class="form-validation">
                            <form id="idformaddvoucher" class="form-valide" method="post">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="idVoucher">Mã giảm giá <span
                                            class="text-danger">*</span>
                                    </label>
                                    <c:if test="${editVoucher}">
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="idVoucher" name="id"
                                                   placeholder="Nhập một mã giảm giá.." value="${voucher.id}" disabled>
                                        </div>
                                    </c:if>
                                    <c:if test="${!editVoucher}">
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control" id="idVoucher" name="id"
                                                   placeholder="Nhập một mã giảm giá.." value="${voucher.id}">
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="eventVoucher">Sự kiện <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="eventVoucher" name="event"
                                               placeholder="Sự kiện giảm giá.." value="${voucher.event}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="quantityVoucher">Số lượng <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="number" class="form-control" id="quantityVoucher" name="quantity"
                                               placeholder="Nhập số lượng mã sử dụng.." value="${voucher.quantity}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="priceSaleVoucher">Tiền giảm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="number" class="form-control" id="priceSaleVoucher" name="priceSale"
                                               placeholder="Nhập số tiền giảm.." value="${voucher.priceSale}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="dateStartVoucher">Ngày bắt đầu <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="date" class="form-control" id="dateStartVoucher" name="dateStart"
                                               value="${dateStart}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="dateEndVoucher">Ngày kết thúc <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="date" class="form-control" id="dateEndVoucher" name="dateEnd"
                                               value="${dateEnd}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-8 ml-auto">
                                        <button type="submit" class="addVoucher btn btn-primary">
                                            <c:if test="${editVoucher}">Sửa</c:if>
                                            <c:if test="${!editVoucher}">Thêm</c:if>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #/ container -->
</div>
<!--**********************************
Content body end
***********************************-->

<script>
    $(document).ready(function () {
        $('#idformaddvoucher').submit(function (e) {
            e.preventDefault();
        })
    })

    $('.addVoucher').click(function () {
        console.log('a')
        let idVoucher = document.querySelector('#idVoucher').value
        let event = document.querySelector('#eventVoucher').value;
        let quantity = document.querySelector('#quantityVoucher').value;
        let priceSale = document.querySelector('#priceSaleVoucher').value;
        let date_start = document.querySelector('#dateStartVoucher').value;
        let date_end = document.querySelector('#dateEndVoucher').value;
        if (idVoucher == null || idVoucher.trim() === '') {
            toastDanger('Lỗi voucher', 'Vui lòng nhập mã giảm giá');
            return;
        }
        if (event === null || event.trim() === '') {
            toastDanger('Lỗi voucher', 'Vui lòng nhập sự kiện giảm giá');
            return;
        }
        if (quantity === null || quantity.trim() === '') {
            toastDanger('Lỗi voucher', 'Vui lòng nhập số lượng voucher');
            return;
        }
        if (priceSale === null || priceSale.trim() === '') {
            toastDanger('Lỗi voucher', 'Vui lòng nhập số tiền giảm');
            return;
        }
        if (!checkDate('Ngày bắt đầu', date_start) || !checkDate('Ngày kết thúc', date_end)) {
            return;
        }
        if (Number(quantity) && quantity > 0) {
            if (Number(priceSale) && priceSale > 0) {
                document.getElementById('idformaddvoucher').submit();
            } else {
                toastWarning('Lỗi tiền giảm', 'Số tiền giảm phải là một số nguyên lớn hơn 0.');
            }
        } else {
            toastWarning('Lỗi số lượng', 'Số lượng phải là một số nguyên lớn hơn 0.');
        }
    })

</script>