<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><dec:title default="Trang chủ"></dec:title></title>
    <%@include file="layout/head.jsp" %>
</head>
<body>
<fmt:setLocale value="${LANG}"/>
<fmt:setBundle basename="polymart.xyz.i18n.lang" scope="request"/>

<jsp:include page="layout/switcherColor.jsp"/>

<div class="wrapper">

    <jsp:include page="layout/header/header.jsp"/>

    <!-- hero slider end -->
    <dec:body></dec:body>
    <!-- footer area start -->
    <jsp:include page="layout/footer/footer.jsp"/>
    <!-- footer area end -->
</div>

<!-- Login Content Start -->
<div class="modal fade" id="click-login" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><fmt:message key="HEADER.TOP.DANGNHAP"/></h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="idloginvisit" action="<c:url value="/checkout"/>" method="post">
                    <div class="single-input-item">
                        <input type="text" id="login-phoneNumber" name="login-phoneNumber"
                               placeholder="<fmt:message key="SODIENTHOAI"/>" required/>
                    </div>
                    <div class="single-input-item">
                        <input type="password" id="login-password" name="login-password"
                               placeholder="<fmt:message key="MATKHAU"/>" required/>
                    </div>
                    <%--                    <div class="single-input-item">--%>
                    <%--                        <div class="login-reg-form-meta d-flex align-items-center justify-content-between">--%>
                    <%--                            <div class="remember-meta">--%>
                    <%--                                <div class="custom-control custom-checkbox">--%>
                    <%--                                    <input type="checkbox" class="custom-control-input" id="rememberMe">--%>
                    <%--                                    <label class="custom-control-label" for="rememberMe">Remember Me</label>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <a href="#" class="forget-pwd">Forget Password?</a>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <div class="single-input-item">
                        <button class="sqr-btn"><fmt:message key="HEADER.TOP.DANGNHAP"/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Login Content End -->

<script>

    $('#idloginvisit').submit(function (e) {
        e.preventDefault();
        let phoneNumber = document.getElementById('login-phoneNumber').value
        let password = document.getElementById('login-password').value
        if (checkPhoneNumber(phoneNumber) && checkPassword(password)) {
            document.getElementById('idloginvisit').submit();
        }
    })

    $('.header-mini-cart').click(function (e) {
        window.location = 'http://localhost:8081/ASS_JV4_war_exploded/cart'
    })

    $('.click_like').click(function (e) {
        e.preventDefault();
        let inHtml = e.currentTarget.innerHTML
        let fakeId = e.currentTarget.href;
        let id = fakeId.substring(fakeId.lastIndexOf("#") + 1);
        if (Number(id) && id > 0) {
            $.ajax({
                url: "/ASS_JV4_war_exploded/load/like",
                type: "get", //send it through get method
                data: {
                    id: id
                },
                success: function (response) {
                    if (inHtml === '<i class="click_wish_list fa fa-heart"></i>') {
                        e.currentTarget.innerHTML = '<i class="click_wish_list fa fa-heart-o"></i>'
                    } else {
                        e.currentTarget.innerHTML = '<i class="click_wish_list fa fa-heart"></i>'
                    }
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        }
    })

    $('a').click(function (e) {
        if (e.currentTarget.href.includes('product?id=')) {
            e.preventDefault();
            let id = e.currentTarget.href;
            id = id.substring(id.lastIndexOf('product?id=') + 11)
            console.log(id);
            try {
                if (Number(id)) {
                    $.ajax({
                        url: "/ASS_JV4_war_exploded/load/product",
                        type: "get", //send it through get method
                        data: {
                            view: id
                        },
                        success: function (response) {
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                    setTimeout(function () {
                        window.location = e.currentTarget.href
                    }, 10)
                }
            } catch (x) {
                e.preventDefault();
            }
        }
        if (e.currentTarget.className === 'quick_view') {
            let id = e.currentTarget.href;
            id = id.substring(id.lastIndexOf('#') + 1)
            try {
                if (Number(id)) {
                    $.ajax({
                        url: "/ASS_JV4_war_exploded/load/web/product",
                        type: "get", //send it through get method
                        data: {
                            id: id
                        },
                        success: function (response) {
                            document.getElementById('quick_view_show').innerHTML = response;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
            } catch (x) {
                e.preventDefault();
            }
        }
    })
</script>
<jsp:include page="layout/js.jsp"/>
</body>
</html>
