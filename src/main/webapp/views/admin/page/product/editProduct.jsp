<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Chỉnh sửa thông tin sản phẩm</title>

<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý sản phẩm</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Sửa sản phẩm</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Sửa sản phẩm</h2>
                        <h4 class="text-danger mb-4">${editProductError}</h4>
                        <div class="form-validation">
                            <form id="idformeditproduct" class="form-valide" action="#" method="post">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="nameproduct">Tên sản phẩm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" id="nameproduct" name="name"
                                               placeholder="Enter a name.." value="${product.name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="categoryproduct">Loại sản phẩm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="categoryproduct" name="category">
                                            <option value="" selected>Vui lòng chọn...</option>
                                            <c:forEach items="${lstCategory}" var="category">
                                                <c:if test="${!category.removed}">
                                                    <c:if test="${product.entityCategory.id == category.id}">
                                                        <option value="${category.id}"
                                                                selected>${category.name}</option>
                                                    </c:if>
                                                    <c:if test="${product.entityCategory.id != category.id}">
                                                        <option value="${category.id}">${category.name}</option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="brandproduct">Thương hiệu <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <select class="form-control" id="brandproduct" name="brand">
                                            <option value="" selected>Vui lòng chọn...</option>
                                            <c:forEach items="${lstBrand}" var="brand">
                                                <c:if test="${!brand.removed}">
                                                    <c:if test="${product.entityBrand.id == brand.id}">
                                                        <option value="${brand.id}" selected>${brand.name}</option>
                                                    </c:if>
                                                    <c:if test="${product.entityBrand.id != brand.id}">
                                                        <option value="${brand.id}">${brand.name}</option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="nameproduct">Mổ tả: <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <textarea class="form-control" id="descriptionproduct"
                                                  name="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="percenproduct">Giảm giá (Tỉ lệ %): <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <input type="number" min="0" max="99" class="form-control" id="percenproduct"
                                               name="persenSale"
                                               placeholder="Enter a number.." value="${product.persenSale}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-8 ml-auto">
                                        <button type="submit" id="btnEditProduct" class="btn btn-primary">Chỉnh sửa
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
        editor = CKEDITOR.replace('descriptionproduct');
        $('#idformeditproduct').submit(function (e) {
            e.preventDefault();
        })
    })

    document.getElementById("btnEditProduct").onclick = onClickEditProduct

    function onClickEditProduct() {
        let nameproduct = document.getElementById('nameproduct').value;
        let categoryproduct = document.getElementById('categoryproduct').value;
        let brandproduct = document.getElementById('brandproduct').value;
        let percenproduct = document.getElementById('percenproduct').value;
        console.log(percenproduct)
        if (nameproduct === null || nameproduct === '') {
            toastDanger('Error', 'Tên sản phẩm không được để trống');
            return;
        }
        if (nameproduct.trim().length < 15) {
            toastWarning('Warning', 'Tên sản phầm phải từ 15 ký tự');
            return;
        }
        if (categoryproduct === null || categoryproduct.trim() === '') {
            toastDanger('Error', 'Chưa chọn loại sản phẩm');
            return;
        }
        if (brandproduct === null || brandproduct.trim() === '') {
            toastDanger('Error', 'Chưa chọn thương hiệu sản phẩm');
            return;
        }
        if (percenproduct === null || percenproduct.trim() === '') {
            toastWarning('Warning', 'Giảm giá không được để trống');
            return;
        } else if ((Number(percenproduct) >= 0 && Number(percenproduct) <= 50)
            || percenproduct === '0.0' || percenproduct === '0') {
            swal({
                title: 'Thông báo!',
                text: 'Sửa thông tin sản phẩm. Tiếp tục?',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Tiếp tục',
                closeOnConfirm: !1
            }, function () {
                document.getElementById("idformeditproduct").submit();
            })
        } else {
            toastWarning('Warning', 'Chỉ được giảm từ 0 tới 50%');
        }
    }

</script>