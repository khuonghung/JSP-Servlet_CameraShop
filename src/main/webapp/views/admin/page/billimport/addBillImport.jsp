<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/22/2021
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thêm hoá đơn nhập hàng</title>

<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý sản phẩm</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm sản phẩm</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Nhập hàng</h2>
                        <h4 class="text-danger mb-4">${addProductError}</h4>
                        <div class="form-validation">
                            <form id="idformaddbillimport" class="form-valide" method="post">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Người nhập:
                                        <span type="button" class="btn mb-1 btn-rounded btn-info">
                                        <span class="btn-icon-left">
                                            <i class="fa fa-plus color-info"></i>
                                        </span>PH${USER.id}
                                            - ${USER.lastName} ${USER.firstName}</span>
                                    </label>
                                    <div class="col-lg-6 input-group">
                                        <select class="custom-select" id="staffCheck" name="staffCheck">
                                            <option value="0" selected>Người kiểm tra...</option>
                                            <c:forEach items="${lstStaff}" var="staff">
                                                <c:if test="${!staff.removed}">
                                                    <c:if test="${emailStaffCheck == staff.email}">
                                                        <option value="${staff.email}" selected>
                                                            PH${staff.id} - ${staff.lastName} ${staff.firstName}
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${emailStaffCheck != staff.email}">
                                                        <option value="${staff.email}">
                                                            PH${staff.id} - ${staff.lastName} ${staff.firstName}
                                                        </option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <hr/>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label">Sản phẩm
                                        <button id="btnAdd" type="button" class="btn mb-1 btn-rounded btn-info">
                                        <span class="btn-icon-left">
                                            <i class="fa fa-plus color-info"></i>
                                        </span>Add
                                        </button>
                                    </label>
                                    <div class="col-lg-3 input-group row">
                                        <c:forEach items="${lstIdProduct}" var="idProduct" varStatus="theCount">
                                            <div class="add-product mb-2" hidden>
                                                <select class="custom-select idProduct" name="idProduct">
                                                    <option value="0" selected>Chọn sản phẩm ${theCount.index+1}...
                                                    </option>
                                                    <c:forEach items="${lstProductDetails}" var="details">
                                                        <c:if test="${!details.entityProduct.removed}">
                                                            <c:if test="${idProduct == details.id}">
                                                                <option value="${details.id}" selected>
                                                                        ${details.entityProduct.name}
                                                                    - ${details.entityAttribute.name}
                                                                    - ${details.entityAttribute.value}
                                                                </option>
                                                            </c:if>
                                                            <c:if test="${idProduct != details.id}">
                                                                <option value="${details.id}">
                                                                        ${details.entityProduct.name}
                                                                    - ${details.entityAttribute.name}
                                                                    - ${details.entityAttribute.value}
                                                                </option>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="col-lg-2 input-group row">
                                        <c:forEach items="${lstQuantity}" var="quantity" varStatus="theCount">
                                            <div class="add-quantity mb-2" hidden>
                                                <input type="number" min="1" class="form-control quantity"
                                                       name="quantity"
                                                       placeholder="Số lượng nhập ${theCount.index +1}"
                                                       value="${quantity}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="col-lg-3 input-group row">
                                        <c:forEach items="${lstPrice}" var="price" varStatus="theCount">
                                            <div class="add-price mb-2" hidden>
                                                <input type="number" min="1" class="form-control price" name="price"
                                                       placeholder="Giá nhập ${theCount.index +1}"
                                                       value="${billImportDetails.price}">
                                            </div>
                                            <button hidden type="button" class="btnRemove btn mb-1 btn-danger">
                                                <i class="fa fa-close"></i>
                                            </button>
                                        </c:forEach>
                                    </div>
                                </div>
                                <hr/>
                                <div class="form-group row">
                                    <div class="col-lg-8 ml-auto">
                                        <button id="add-bill-import" class="btn btn-primary">Thêm</button>
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
        loadFirstProduct();
        $('#idformaddbillimport').submit(function (e) {
            e.preventDefault();
        })
    })

    let addProduct = document.querySelectorAll(".add-product")
    let addQuantity = document.querySelectorAll(".add-quantity")
    let addPricue = document.querySelectorAll(".add-price")
    let remove = document.querySelectorAll(".btnRemove")

    function loadFirstProduct() {
        document.querySelector(".add-product").hidden = false;
        document.querySelector(".add-quantity").hidden = false;
        document.querySelector(".add-price").hidden = false;
        document.querySelector(".btnRemove").hidden = false;
        setTimeout(function () {
            for (let i = 0; i < remove.length; i++) {
                remove[i].onclick = function () {
                    if (remove[i].hidden === false) {
                        let check = 0;
                        for (let i = 0; i < remove.length; i++) {
                            if (remove[i].hidden === false) {
                                check++;
                                if (check >= 2) {
                                    break;
                                }
                            }
                        }
                        if (check > 1) {
                            addProduct[i].hidden = true
                            addQuantity[i].hidden = true
                            addPricue[i].hidden = true
                            remove[i].hidden = true
                        } else {
                            swal('Cảnh báo!', 'Bạn cần thêm ít nhất 1 sản phẩm', "error")
                        }
                    }
                }
            }
        }, 100);
    }

    $('#btnAdd').click(function () {
        setTimeout(function () {
            let flag = false;
            for (let i = 0; i < addProduct.length; i++) {
                if (addProduct[i] !== undefined) {
                    if (addProduct[i].hidden === true) {
                        addProduct[i].hidden = false
                        addQuantity[i].hidden = false
                        addPricue[i].hidden = false
                        remove[i].hidden = false
                        flag = true
                        break
                    }
                }
            }
            if (!flag) {
                swal('Thông báo!', 'Bạn đã thêm tối đa sản phẩm cho phép', "error")
            }
        }, 100);
    })

    $('#add-bill-import').click(function () {
        console.log('check')
        let staffCheck = document.getElementById('staffCheck').value;
        let idProduct = document.querySelectorAll('.idProduct');
        let quantity = document.querySelectorAll('.quantity');
        let price = document.querySelectorAll('.price');
        console.log(staffCheck)
        if (staffCheck === '' || staffCheck === '0') {
            toastDanger('Lỗi', 'Vui lòng chọn người kiểm tra hàng nhập')
            return;
        }
        setTimeout(function () {
            let flag = false;
            console.log('for')
            for (let i = 0; i < remove.length; i++) {
                if (remove[i].hidden === false) {
                    console.log(idProduct[i].value)
                    if (idProduct[i].value === undefined || idProduct[i].value === '0') {
                        toastDanger('Lỗi', 'Vui lòng chọn sản phẩm ' + (i + 1))
                        flag = false;
                        break;
                    }
                    if (quantity[i].value === null || quantity[i].value === '') {
                        toastDanger('Lỗi', 'Số lượng nhập của sản phẩm ' + (i + 1) + ' không được để trống');
                        flag = false;
                        break;
                    }
                    if (!/^[0-9]+$/.test(quantity[i].value)) {
                        toastDanger('Lỗi', 'Số lượng nhập của sản phẩm ' + (i + 1) + ' phải là số nguyên dương');
                        flag = false;
                        break;
                    }
                    if (Number(quantity[i].value) < 1) {
                        toastDanger('Lỗi', 'Số lượng nhập của sản phẩm ' + (i + 1) + ' phải lớn hơn 0');
                        flag = false;
                        break;
                    }
                    if (price[i].value === null || price[i].value === '') {
                        toastDanger('Lỗi', 'Giá nhập của sản phẩm ' + (i + 1) + ' không được để trống');
                        flag = false;
                        break;
                    }
                    if (!/^[0-9]+$/.test(price[i].value)) {
                        toastDanger('Lỗi', 'Giá nhập của sản phẩm ' + (i + 1) + ' phải là số nguyên dương');
                        flag = false;
                        break;
                    }
                    if (Number(price[i].value) < 1) {
                        toastDanger('Lỗi', 'Giá nhập nhập của sản phẩm ' + (i + 1) + ' phải lớn hơn 0');
                        flag = false;
                        break;
                    } else {
                        flag = true;
                    }
                }
            }
            console.log(flag)
            if (flag) {
                console.log('submit')
                swal({
                    title: 'Thông báo!',
                    text: 'Thêm hoá đơn sẽ không thể xoá bỏ. Tiếp tục?',
                    type: "warning",
                    showCancelButton: !0,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: 'Tiếp tục',
                    closeOnConfirm: !1
                }, function () {
                    document.getElementById('idformaddbillimport').submit();
                })
            }
        }, 100)
    })

</script>