<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/28/2021
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thanh toán hoá đơn - QRCode</title>

<div class="container">
    <h2 class="text-center text-dark">Thanh toán hoá đơn: ${paymentId}!</h2>
    <h3 class="text-center">Số tiền thanh toán: <fmt:formatNumber value="${totalAmount}" type="currency"
                                                                  currencySymbol=""/>!</h3>
    <h4 class="text-center">Vui lòng viết ghi chú:</h4>
    <h5 class="text-center">${paymentId}</h5>
    <div class="text-center">
        <iframe height="600px" width="600px" src="https://nhantien.momo.vn/0346238899/${totalAmount}"></iframe>
    </div>
</div>
