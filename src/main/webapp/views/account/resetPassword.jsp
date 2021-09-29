<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/25/2021
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Nhập mật khẩu mới</title>

<div class="login-form-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="form-input-content">
                    <div class="card login-form mb-0">
                        <div class="card-body pt-5">
                            <a class="text-center" href="<c:url value="/"/>"><h2>POLYMART</h2></a>
                            <h4 class="text-danger">${errorForgotpassword}</h4>
                            <form id="idformresetpassword" class="mt-5 mb-5 login-input" method="post">
                                <div class="form-group">
                                    <input id="newpassword" type="password" class="form-control" name="newPassword"
                                           placeholder="Nhập mật khẩu mới...">
                                </div>
                                <div class="form-group">
                                    <input id="repassword" type="password" class="form-control" name="newPassword"
                                           placeholder="Nhập lại mật khẩu mới...">
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
    $('#idformresetpassword').submit(function (e) {
        let newPassword = document.getElementById('newpassword').value;
        let rePassword = document.getElementById('repassword').value;
        if (!checkPassword(newPassword) || !checkPassword(rePassword)
            || !checkConfilm(newPassword, rePassword, 'Lỗi', 'Nhập lại mật khẩu không đúng')) {
            e.preventDefault();
        } else {
            $('#idformresetpassword').submit()
        }
    })
</script>
