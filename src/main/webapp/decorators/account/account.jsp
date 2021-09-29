<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><dec:title default="Trang chủ"></dec:title></title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/assets/admin/images/favicon.png"/>">
    <!-- Link ngoài -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Style -->
    <link href="<c:url value="/assets/admin/css/style.css"/>" rel="stylesheet">
    <!-- Toastr -->
    <link href="<c:url value="/assets/admin/plugins/toastr/css/toastr.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/admin/plugins/sweetalert/css/sweetalert.css"/>" rel="stylesheet">

</head>
<body class="h-100">

<dec:body></dec:body>

<script src="<c:url value="/assets/admin/js/query-NQN.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/common/common.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/custom.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/settings.js"/>"></script>
<script src="<c:url value="/assets/admin/js/gleek.js"/>"></script>
<script src="<c:url value="/assets/admin/js/styleSwitcher.js"/>"></script>
</body>
</html>