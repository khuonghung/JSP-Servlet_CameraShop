<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/8/2021
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Quản lý phản hồi</title>

<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Apps</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Email</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="email-left-box"><a href="#compose" class="btn btn-primary btn-block">Compose</a>
                            <div class="mail-list mt-4">
                                <a href="#inbox" class="list-group-item border-0 text-primary p-r-0">
                                    <i class="fa fa-inbox font-18 align-middle mr-2"></i>
                                    <b>Inbox </b>
                                    <span class="badge badge-primary badge-sm float-right m-t-5">198</span>
                                </a>
                                <a href="#send" class="list-group-item border-0 p-r-0">
                                    <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>
                                    Sent
                                </a>
                            </div>
                        </div>
                        <div class="email-right-box" id="show-content-contact">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #/ container -->
</div>
<!--**********************************
Content body end
***********************************-->

<script>

    $('a').click(function (e) {
        if (e.currentTarget.href.includes('#inbox')) {
            loadInbox();
        } else if (e.currentTarget.href.includes('#send')) {
            loadSend();
        } else if (e.currentTarget.href.includes('#compose')) {
            loadCompose();
        }
    })

    setTimeout(loadInbox(), 1)

    function loadInbox() {
        $.ajax({
            url: '<c:url value="/load/inbox"/>',
            type: "get", //send it through get method
            success: function (data) {
                document.getElementById('show-content-contact').innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function loadCompose() {
        $.ajax({
            url: '<c:url value="/load/compose"/>',
            type: "get",
            success: function (data) {
                document.getElementById('show-content-contact').innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function loadSend() {
        $.ajax({
            url: '<c:url value="/load/send"/>',
            type: "get",
            success: function (data) {
                document.getElementById('show-content-contact').innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function loadRead(id) {
        $.ajax({
            url: '<c:url value="/load/read"/>',
            type: "get",
            data: {
                id: id
            },
            success: function (data) {
                document.getElementById('show-content-contact').innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function loadReadSend(id) {
        $.ajax({
            url: '<c:url value="/load/read-send"/>',
            type: "get",
            data: {
                id: id
            },
            success: function (data) {
                document.getElementById('show-content-contact').innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function sendRepContact(id) {
        let message = document.getElementById('body-repcontact').value
        $.ajax({
            url: '<c:url value="/admin/rep-contact"/>',
            type: "post",
            data: {
                idContact: id,
                message: message
            },
            success: function (data) {
                sweetSuccess(data, '');
                if (data === 'Đã gửi trả lời phản hồi.') {
                    document.getElementById('body-repcontact').value = '';
                } else if (data === 'Phản hồi không tồn tại.') {
                    window.location = '<c:url value="/admin/contact"/>'
                }
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function sendCompose() {
        let email = document.getElementById('to_compose').value
        let subject = document.getElementById('subject_compose').value
        let body = document.getElementById('body_compose').value
        $.ajax({
            url: '<c:url value="/admin/send-mail"/>',
            type: "post",
            data: {
                email: email,
                subject: subject,
                body: body
            },
            success: function (data) {
                sweetSuccess(data, '');
                if (data.includes('Đã gửi.')) {
                    setTimeout(function () {
                        window.location = '<c:url value="/admin/contact"/>'
                    }, 2000);
                }
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

</script>

