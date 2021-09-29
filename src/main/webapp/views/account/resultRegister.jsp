<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    window.onload = submitForm;

    function submitForm() {
        swal({
            title: '${title}!',
            text: '${message}',
            type: "success",
            showCancelButton: !0,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: 'Tiếp tục',
            closeOnConfirm: !1
        }, function (kq) {
            if (kq) {
                window.location = '${pageContext.request.contextPath}/${link}'
            } else {
                window.location = '${pageContext.request.contextPath}/'
            }
        })
    }
</script>
