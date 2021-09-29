<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/30/2021
  Time: 7:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstPayement}" var="payment">
    <c:if test="${not empty payment.lstEntityPaymentDetails}">
        <tr>
            <td class="text-center">${payment.id}</td>
            <td class="text-center">${payment.entityVisit.phoneNumber}</td>
            <td class="text-center">
                <c:if test="${not empty payment.entityVoucher}">
                    ${payment.entityVoucher.id}
                </c:if>
                <c:if test="${empty payment.entityVoucher}">
                    x
                </c:if>
            </td>
            <td>
                <c:if test="${payment.payments == 'qrcode'}">
                    Quét mã QRCode
                </c:if>
                <c:if test="${payment.payments == 'cod'}">
                    Thanh toán khi nhận hàng
                </c:if>
                <c:if test="${payment.payments == 'vnpay'}">
                    Thanh toán trực tuyến
                </c:if>
            </td>
            <td class="text-right">
                <fmt:formatNumber value="${payment.paymentAmount}" type="currency" currencySymbol=""/>₫
            </td>
            <td class="text-center">
                <c:if test="${!payment.statusPayment}">
                    <c:if test="${payment.statusBilling}">
                        <button type="submit" class="btn btn-success">
                            <a href="<c:url value="/admin/payments/status-payment?id=${payment.id}&action=true"/>">
                                Xác nhận thanh toán
                            </a>
                        </button>
                    </c:if>
                    <c:if test="${!payment.statusBilling}">
                        <span class="text-dark">Chờ xác nhận</span>
                    </c:if>
                </c:if>
                <c:if test="${payment.statusPayment}">
                    <span class="text-success">Đã thanh toán</span>
                </c:if>

            </td>
            <td class="text-center">
                <c:if test="${payment.statusBilling}">
                    <c:if test="${payment.statusPayment}">
                        <span class="text-success">Đã thanh toán</span>
                    </c:if>
                    <c:if test="${!payment.statusPayment}">
                        <span class="text-success">Đã xác nhận</span>
                    </c:if>
                </c:if>
                <c:if test="${!payment.statusBilling}">
                    <button type="submit" class="btn btn-success">
                        <a href="<c:url value="/admin/payments/status-bill?id=${payment.id}&action=true"/>">
                            Xác nhận
                        </a>
                    </button>
                </c:if>

            </td>
            <td class="text-center">
                <button type="submit" class="btn btn-secondary">
                    <a id="showDetails" href="<c:url value="/load/payment-details?id=${payment.id}"/>"
                       class="text-white"
                       data-toggle="modal" data-target=".open-detail-payment">Chi tiết</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>
