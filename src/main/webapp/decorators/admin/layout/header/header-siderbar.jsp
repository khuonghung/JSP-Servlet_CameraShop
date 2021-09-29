<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--**********************************
Sidebar start
***********************************-->
<div class="nk-sidebar">
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">
            <li class="nav-label">Dashboard</li>
            <li class="mega-menu mega-menu-sm" aria-expanded="false">
                <a href="<c:url value="/admin/staff/quan-ly-nhan-vien"/>">
                    <i class="icon-user menu-icon"></i><span class="nav-text">Quản lý nhân viên</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm" aria-expanded="false">
                <a href="<c:url value="/admin/visit/quan-ly-khach-hang"/>">
                    <i class="icon-people menu-icon"></i><span class="nav-text">Danh sách khách hàng</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-arrows-circle-plus menu-icon"></i><span class="nav-text">Quản lý cửa hàng</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="<c:url value="/admin/banner"/>">Quản lý banner website</a></li>
                    <li><a href="<c:url value="/admin/voucher"/>">Quản lý mã giảm giá</a></li>
                    <li><a href="<c:url value="/admin/contact"/>">Phản hồi cửa hàng</a></li>
                </ul>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a href="<c:url value="/admin/product/quan-ly-san-pham"/>">
                    <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Quản lý sản phẩm</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a href="<c:url value="/admin/brand/quan-ly-thuong-hieu"/>">
                    <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Quản lý thương hiệu</span>
                </a>
            </li>
            <li class="mega-menu mega-menu-sm">
                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    <i class="icon-arrows-circle-plus menu-icon"></i><span class="nav-text">Quản lý hoá đơn</span>
                </a>
                <ul aria-expanded="false">
                    <li><a href="<c:url value="/admin/payments/quan-ly-hoa-don-nhap-hang"/>">Quản lý hoá đơn nhập</a>
                    </li>
                    <li><a href="<c:url value="/admin/payments/quan-ly-hoa-don-thanh-toan"/>">Quản lý hoá đơn thanh
                        toán</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--**********************************
Sidebar end
***********************************-->
