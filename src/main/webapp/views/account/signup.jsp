<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Đăng ký tài khoản</title>

<div class="login-form-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="form-input-content">
                    <div class="card login-form mb-0">
                        <div class="card-body pt-5">
                            <a class="text-center" href="<c:url value="/"/>"><h2>POLYMART</h2></a>
                            <h4 class="text-danger">${errorRegister}</h4>
                            <form method="post" id="idformregister" class="mt-5 mb-5 login-input"
                                  enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" id="ho" class="form-control" placeholder="Họ" name="lastName"
                                           value="${account.lastName}"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="ten" class="form-control" placeholder="Tên"
                                           name="firstName" value="${account.firstName}"/>
                                </div>
                                <div class="form-group">
                                    <input type="date" id="ngaysinh" class="form-control" name="birthday"
                                           value="${birthday}"/>
                                </div>
                                <div class="form-group">
                                    <label class="css-control css-control-primary css-radio" for="nam">
                                        <input type="radio" class="css-control-input" id="nam"
                                               name="sex" checked/>
                                        <span class="css-control-indicator"></span>
                                        Nam
                                    </label>
                                    <label class="css-control css-control-primary css-radio" for="nu">
                                        <input type="radio" class="css-control-input" id="nu"
                                               name="sex"/>
                                        <span class="css-control-indicator"></span>
                                        Nữ
                                    </label>
                                </div>
                                <div class="form-group">
                                    <textarea id="diachi" class="form-control" name="address"
                                              placeholder="Địa chỉ">${account.address}</textarea>
                                </div>
                                <div class="form-group">
                                    <input type="text" id="phoneNumber" class="form-control"
                                           placeholder="Số điện thoại"
                                           name="phoneNumber" value="${account.phoneNumber}"/>
                                </div>
                                <div class="form-group">
                                    <input type="email" id="email" class="form-control" placeholder="Email"
                                           name="email" value="${account.email}"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="password" class="form-control" name="password"
                                           placeholder="Mật khẩu" value="${account.password}"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" id="repassword" class="form-control" name="repassword"
                                           placeholder="Xác nhận mật khẩu"/>
                                </div>
                                <div class="form-group">
                                    <input type="file" id="avatar" class="form-control" name="avatar"/>
                                </div>
                                <div class="form-group">
                                    <textarea class="form-control" name="note"
                                              placeholder="Ghi chú">${account.note}</textarea>
                                </div>
                                <button class="btn login-form__btn submit w-100">Đăng ký</button>
                            </form>
                            <p class="mt-5 login-form__footer">Have account <a href="<c:url value="/signin"/>"
                                                                               class="text-primary">Sign In </a> now</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $("#idformregister").submit(function (event) {

        let ho = document.getElementById('ho').value;
        let ten = document.getElementById('ten').value;
        let ngaysinh = document.getElementById('ngaysinh').value;
        let diachi = document.getElementById('diachi').value;
        let avatar = document.getElementById('avatar').value;
        let email = document.getElementById('email').value;
        let repassword = document.getElementById('repassword').value;
        let password = document.getElementById('password').value;

        let phoneNumber = document.getElementById('phoneNumber').value;
        console.log(phoneNumber)

        if (!checkLastName(ho) || !checkFirstName(ten) || !check18Ages(ngaysinh)
            || !checkAddress(diachi) || !checkPhoneNumber(phoneNumber) || !checkEmail(email)
            || !checkPassword(password)
            || !checkConfilm(password, repassword, "Lỗi dữ liệu", "Mật khẩu nhập lại không khớp")
            || !checkImage("Avatar", avatar)) {
            event.preventDefault();
        } else {
            $("#idformregister").submit()
        }
    });

</script>
