<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/8/2021
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<fmt:setLocale value="${LANG}"/>
<fmt:setBundle basename="polymart.xyz.i18n.lang" scope="request"/>
<title><fmt:message key="HEADER.MENU.CONTACT"/></title>

<!-- breadcrumb area start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <fmt:message key="HEADER.MENU.CONTACT"/>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<div class="contact-area pb-34 pb-md-18 pb-sm-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <c:if test="${empty GOOGLE}">
                    <div class="text-center">
                        <button class="btn btn-outline-primary">
                            <a href="<c:url value="/login-google"/>">
                                Login With Google
                            </a>
                        </button>
                    </div>
                </c:if>
                <c:if test="${not empty GOOGLE}">
                    <div class="contact-message">
                        <h2>tell us your project</h2>
                        <form id="idformcontat" method="post">
                            <div class="row">
                                <div class="col-12">
                                    <input name="subject" id="subject" placeholder="Subject *" type="text"/>
                                </div>
                                <div class="col-12">
                                    <div class="contact2-textarea text-center">
                                        <textarea placeholder="Message *" id="body" name="body"
                                                  class="form-control2"></textarea>
                                    </div>
                                    <div class="contact-btn">
                                        <button class="sqr-btn" type="submit">Send Message</button>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-center">
                                    <p class="form-messege"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </div>
            <div class="col-lg-6">
                <div class="contact-info mt-md-28 mt-sm-28">
                    <h2><fmt:message key="HEADER.MENU.CONTACT"/></h2>
                    <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est
                        notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum formas
                        human.</p>
                    <ul>
                        <li><i class="fa fa-fax"></i> <fmt:message key="DIACHI"/> : No 40 Baria Sreet 133/2 NewYork City
                        </li>
                        <li><i class="fa fa-phone"></i> info@yourdomain.com</li>
                        <li><i class="fa fa-envelope-o"></i> +88013245657</li>
                    </ul>
                    <div class="working-time">
                        <h3><fmt:message key="HEADER.MIDDLE.THOIDIANLAMVIEC"/></h3>
                        <p><fmt:message key="HEADER.MIDDLE.CATUAN"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- contact area end -->

<!-- map area start -->
<div class="map-area-wrapper">
    <div class="container">
        <div id="map_content" data-lat="23.763491" data-lng="90.431167" data-zoom="8" data-maptitle="HasTech"
             data-mapaddress="Floor# 4, House# 5, Block# C     </br> Banasree Main Rd, Dhaka">
        </div>
    </div>
</div>
<!-- map area end -->

<script>

    $('#idformcontat').submit(function (e) {
        e.preventDefault();
        let subject = document.getElementById('subject').value;
        let body = document.getElementById('body').value;
        console.log(subject)
        if (subject == null || subject.trim() === '') {
            toastDanger('Lỗi tiêu đề', 'Tiêu đề không được để trống');
            return;
        }
        if (body == null || body.trim() === '') {
            toastDanger('Lỗi nội dung', 'Nội dung liên hệ không được để trống');
            return;
        }
        // document.getElementById('idformcontat').submit();
        $.ajax({
            url: '<c:url value="/contact"/>',
            type: "post", //send it through get method
            data: {
                subject: subject,
                body: body
            },
            success: function (data) {
                sweetSuccess(data, '');
                document.getElementById('subject').value = '';
                document.getElementById('body').value = '';
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    })


</script>
