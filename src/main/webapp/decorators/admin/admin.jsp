<%@include file="/commont/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head class="h-100">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title><dec:title default="Trang chủ"></dec:title></title>
    <jsp:include page="layout/head.jsp"/>
</head>
<body>
<div id="main-wrapper">
    <jsp:include page="layout/header/header.jsp"/>

    <dec:body></dec:body>

    <jsp:include page="layout/footer/footer.jsp"/>
</div>

<jsp:include page="layout/script.jsp"/>
</body>
</html>