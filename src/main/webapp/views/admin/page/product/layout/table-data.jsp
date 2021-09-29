<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${lstProduct}" var="product" varStatus="theCount">
    <c:if test="${!product.removed}">
        <tr>
            <td class="text-center">
                <button class="btn btn-outline-secondary idproduct" id="${product.id}" data-toggle="modal"
                        data-target=".open-details-product">
                    <i class="icon-eye"></i>
                </button>
            </td>
            <td>${product.name}</td>
            <td>${product.entityCategory.name}</td>
            <td>${product.entityBrand.name}</td>
            <td class="text-center">${product.view}</td>
            <td class="text-center">${fn:length(product.lstEntityLikes)}</td>
            <td class="text-center">
                <c:set var="sumQuantity" value="${0}"/>
                <c:forEach items="${product.lstEntityProductDetails}" var="details">
                    <c:set var="sumQuantity" value="${sumQuantity + details.quantity}"/>
                </c:forEach>
                    ${sumQuantity}
            </td>
                <%--            <td>--%>
                <%--                    ${product.status ? "<span class='text-success'>Đang kinh doanh</span>"--%>
                <%--                            : "<span class='text-danger'>Ngừng kinh doanh</span>"}--%>
                <%--            </td>--%>
            <td class="text-center">
                    ${product.persenSale}
            </td>
            <td>
                <c:if test="${product.status}">
                    <button class="statusProduct btn btn-success mx-2">
                        <a href="<c:url value="/admin/product/quan-ly-san-pham?status=false&id=${product.id}"/>"
                           class="text-white">
                            Đang kinh doanh
                        </a>
                    </button>
                </c:if>
                <c:if test="${!product.status}">
                    <button class="statusProduct btn btn-warning mx-2">
                        <a href="<c:url value="/admin/product/quan-ly-san-pham?status=true&id=${product.id}"/>"
                           class="text-white">
                            Ngừng kinh doanh
                        </a>
                    </button>
                </c:if>
                    <%--                <button class="btn btn-danger mx-2">--%>
                    <%--                    <a href="<c:url value="/admin/product/quan-ly-san-pham?remove=true&id=${product.id}"/>"--%>
                    <%--                       class="text-white">Xoá</a>--%>
                    <%--                </button>--%>
                <button class=" btn btn-primary mx-2">
                    <a href="<c:url value="/admin/product/edit?id=${product.id}"/>" class="text-white">Sửa</a>
                </button>
            </td>
        </tr>
    </c:if>
</c:forEach>
