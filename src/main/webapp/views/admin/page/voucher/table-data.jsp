<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${lstVoucher}" var="voucher">
    <c:if test="${!voucher.removed}">
        <tr>
            <td>${voucher.id}</td>
            <td>${voucher.event}</td>
            <td>
                <fmt:formatNumber value="${voucher.priceSale}" type="currency" currencySymbol=""/>₫
            </td>
            <td>${voucher.quantity}</td>
            <td>${voucher.reQuantity}</td>
            <td>
                <fmt:formatDate value="${voucher.dateStart}" pattern="dd-MM-yyyy"/>
            </td>
            <td>
                <fmt:formatDate value="${voucher.dateEnd}" pattern="dd-MM-yyyy"/>
            </td>
            <td>
                <button type="submit" class="btn btn-danger">
                    <a href="<c:url value="/admin/voucher/delete?id=${voucher.id}"/>">Xoá</a>
                </button>
                <button type="submit" class="btn btn-info">
                    <a href="<c:url value="/admin/voucher/edit?id=${voucher.id}"/>">Sửa</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>

