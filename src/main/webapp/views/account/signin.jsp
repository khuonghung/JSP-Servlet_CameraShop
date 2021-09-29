<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Đăng nhập</title>

<div class="login-form-bg h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100">
            <div class="col-xl-6">
                <div class="form-input-content">
                    <div class="card login-form mb-0">
                        <div class="card-body pt-5">
                            <a class="text-center" href="<c:url value="/"/>"><h2>POLYMART</h2></a>
                            <h4 class="text-danger">${errorMessage}</h4>
                            <form id="idformlogin" method="post" class="mt-5 mb-5 login-input">
                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control"
                                           placeholder="Email" value="${email}"/>
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control"
                                           placeholder="Password" value="${password}"/>
                                </div>
                                <div class="form-group">
                                    <label class="css-control css-control-primary css-checkbox" for="val-terms">
                                        <input type="checkbox" class="css-control-input" id="val-terms"
                                               name="remember" checked/>
                                        <span class="css-control-indicator"></span>
                                        Remember password!
                                    </label>
                                </div>
                                <button class="btn login-form__btn submit w-100">Sign In</button>
                            </form>
                            <p class="mt-5 login-form__footer">Dont have account? <a href="<c:url value="/signup"/>"
                                                                                     class="text-primary">Sign Up</a>
                                now</p>
                            <p class="mt-5 login-form__footer">
                                <a href="<c:url value="/forgot-password"/>" class="text-primary">Forgot password</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--**********************************
Scripts validate
***********************************-->
<script>
    $("#idformlogin").submit(function (event) {
        let email = document.getElementById('email').value;
        let password = document.getElementById('password').value;
        if (!checkEmail(email) || !checkPassword(password)) {
            event.preventDefault();
        } else {
            $("#idformlogin").submit()
        }
    });

</script>
