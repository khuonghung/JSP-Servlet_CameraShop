<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Sửa thông tin nhân viên</title>

<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý nhân viên</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Sửa thông tin</a></li>
            </ol>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Sửa thông tin nhân viên</h2>
                        <h4 class="text-danger">${editError}</h4>
                        <div class="basic-form">
                            <form id="idformEditStaff"
                                  method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Họ và tên đệm: </label>
                                            <input type="text" class="form-control" placeholder="Họ và tên đệm"
                                                   id="lastname" name="lastName" value="${staff.lastName}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Tên: </label>
                                            <input type="text" class="form-control" placeholder="Tên"
                                                   id="firstname" name="firstName" value="${staff.firstName}"/>
                                        </div>
                                    </div>
                                    <%--                                    // TODO giao diện chọn ngày sinh lỗi--%>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group form-material">
                                            <label>Ngày sinh: </label>
                                            <input id="birthday" name="birthday" type="date" class="form-control"
                                                   value="${birthday}"/>
                                            <%--                                            <input id="birthday" name="birthday" type="date" class="form-control"--%>
                                            <%--                                                   placeholder="2017-06-04" id="mdate"--%>
                                            <%--                                                   value="<fmt:formatDate value="${staff.birthday}" pattern="yyyy-MM-dd" />">--%>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <label>Giới tính: </label>
                                        <div class="form-group">
                                            <c:choose>
                                                <c:when test="${staff.sex}">
                                                    <label class="radio-inline mr-3 py-3">
                                                        <input type="radio" name="sex" value="nam" checked>Nam</label>
                                                    <label class="radio-inline mr-3 py-3">
                                                        <input type="radio" name="sex" value="nu"> Nữ</label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio-inline mr-3 py-3">
                                                        <input type="radio" name="sex" value="nam">Nam</label>
                                                    <label class="radio-inline mr-3 py-3">
                                                        <input type="radio" name="sex" value="nu" checked> Nữ</label>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Email: </label>
                                            <input type="email" class="form-control" placeholder="Email"
                                                   id="email" name="email" value="${staff.email}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Số điện thoại: </label>
                                            <input type="text" class="form-control" placeholder="Số điện thoại"
                                                   id="phonenumber" name="phoneNumber" value="${staff.phoneNumber}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Địa chỉ: </label>
                                            <textarea class="form-control" id="address" name="address"
                                                      placeholder="Địa chỉ">${staff.address}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Ghi chú: </label>
                                            <textarea class="form-control" name="note"
                                                      placeholder="Ghi chú">${staff.note}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Chức vụ: </label>
                                            <select class="custom-select" name="role">
                                                <option value="0"
                                                        <c:if test="${staff.role == 0}">
                                                            selected
                                                        </c:if>>Nhân viên bán hàng
                                                </option>
                                                <option value="1"
                                                        <c:if test="${staff.role == 1}">
                                                            selected
                                                        </c:if>>Nhân viên thu ngân
                                                </option>
                                                <option value="2"
                                                        <c:if test="${staff.role == 2}">
                                                            selected
                                                        </c:if>>Quản lý cửa hàng
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label>Avatar: </label>
                                            <input id="avatar" name="avatar" type="file" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                                <button class="float-right btn btn-success">Thay đổi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $("#idformEditStaff").submit(function (event) {
        event.preventDefault();
        let lastName = document.getElementById('lastname').value;
        let firstName = document.getElementById('firstname').value;
        let birthday = document.getElementById('birthday').value;
        let email = document.getElementById('email').value;
        let phoneNumber = document.getElementById('phonenumber').value;
        let address = document.getElementById('address').value;
        let avatar = document.getElementById('avatar').value;
        if (!checkLastName(lastName) || !checkFirstName(firstName)
            || !check18Ages(birthday) || !checkEmail(email)
            || !checkPhoneNumber(phoneNumber) || !checkAddress(address)
            || !checkAvatarEdit(avatar)) {
            event.preventDefault();
        } else {
            swal({
                title: 'Thông báo!',
                text: 'Bạn có chắc muốn thay đổi thông tin nhân viên?',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Thay đổi',
                closeOnConfirm: !1
            }, function () {
                $("#idformEditStaff").submit();
            })
        }
    });

    function checkAvatarEdit(image) {
        if (image !== null && image !== '') {
            console.log('a')
            let validateImage = /.*\.(gif|jpe?g|bmp|png)$/igm;
            if (!validateImage.test(image)) {
                toastWarning('Avatar', 'Avatar không đúng định dạng .gif or .jpg or .jpe or .bmp or .png')
                return false;
            }
        }
        return true;
    }
</script>
