<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/5/2021
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Title</title>
<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet"/>
<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>

<script>
    window.onload = function () {
        console.log('a')
        if ('${code}' === '00') {
            console.log('thafnh coong')
            if (window.vnpay) {
                vnpay.open({width: 768, height: 600, url: '${data}'});
            } else {
                location.href = '${data}';
            }
            return false;
        } else {
            console.log('that bai')
            toastWarning('Thất bại', '${message}');
        }
    }
</script>

