<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Lấy lại mật khẩu</title>

<div class="login-form-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="form-input-content">
                    <div class="card login-form mb-0">
                        <div class="card-body pt-5">
                            <a class="text-center" href="<c:url value="/"/>"><h2>POLYMART</h2></a>
                            <h4 class="text-danger">${errorForgotpassword}</h4>
                            <form id="idformforgotpassword" class="mt-5 mb-5 login-input" method="post">
                                <div class="form-group">
                                    <input id="email" type="email" class="form-control" name="email"
                                           placeholder="Nhập email đã đăng ký...">
                                </div>
                                <button class="btn login-form__btn submit w-100">Send</button>
                            </form>
                            <p class="mt-5 login-form__footer">Dont have account?
                                <a href="<c:url value="/signup"/>" class="text-primary">
                                    Sign Up</a> now</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#idformforgotpassword').submit(function (e) {
        let email = document.getElementById('email').value;
        if (!checkEmail(email)) {
            e.preventDefault();
        } else {
            $('#idformforgotpassword').submit()
        }
    })
</script>