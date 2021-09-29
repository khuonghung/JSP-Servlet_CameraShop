<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/20/2021
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thêm thương hiệu sản phẩm</title>


<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý thương hiệu</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm thương hiệu</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Thêm thương hiệu</h2>
                        <h4 class="text-danger mb-4">${addBrandError}</h4>
                        <div class="form-validation">
                            <form id="idformaddbrand" class="form-valide" action="#" method="post">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="namebrand">Tên thương hiệu <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="namebrand" name="name"
                                               placeholder="Enter a name.." value="${brand.name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="phonenumberbrand">Số điện thoại <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="phonenumberbrand" name="phoneNumber"
                                               placeholder="Enter a phone number.." value="${brand.phoneNumber}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="emailbrand">Email <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <input type="email" class="form-control" id="emailbrand" name="email"
                                               placeholder="Your valid email.." value="${brand.email}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="addressbrand">Địa chỉ <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-6">
                                        <textarea class="form-control" id="addressbrand" name="address" rows="5"
                                                  placeholder="What is the brand address?">${brand.address}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="descriptionbrand">Mô tả</label>
                                    <div class="col-lg-6">
                                        <textarea class="form-control" id="descriptionbrand" name="description" rows="5"
                                                  placeholder="What is the brand description?">${brand.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-8 ml-auto">
                                        <button type="submit" class="addBrand btn btn-primary">Thêm</button>
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
    $("#idformaddbrand").submit(function (event) {
        event.preventDefault();
        let name = document.getElementById('namebrand').value;
        let phonenumber = document.getElementById('phonenumberbrand').value;
        let email = document.getElementById('emailbrand').value;
        let address = document.getElementById('addressbrand').value;
        if (!checkNameBrand(name) || !checkPhoneNumber(phonenumber) || !checkEmail(email) || !checkAddress(address)) {
            event.preventDefault();
        } else {
            swal({
                title: 'Thông báo!',
                text: 'Thêm thương hiệu mới?',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Thêm',
                closeOnConfirm: !1
            }, function () {
                $("#idformaddbrand").submit();
            })
        }
    });

    // $("#idformaddbrand").submit(function (event) {
    //     event.preventDefault();
    // });
</script>