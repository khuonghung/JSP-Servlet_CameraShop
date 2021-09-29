<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/22/2021
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>${USER.lastName} ${USER.firstName}</title>
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Profile</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-3">
                <div class="card">
                    <div class="card-body">
                        <div class="media align-items-center mb-4">
                            <img class="mr-3" src="<c:url value="${USER.avatar}"/>" width="80"
                                 height="80" alt="">
                            <div class="media-body">
                                <h3 class="mb-0">${USER.lastName} ${USER.firstName}</h3>
                                <p class="text-muted mb-0">${USER.role == 0 ? 'Nhân viên bán hàng'
                                        : USER.role == 1 ? 'Nhân viên thu ngân' : 'Quản lý cửa hàng'}</p>
                            </div>
                        </div>

                        <div class="row mb-5">
                            <div class="col">
                                <div class="card card-profile text-center">
                                    <span class="mb-1 text-primary"><i class="icon-like"></i></span>
                                    <h3 class="mb-0">263</h3>
                                    <p class="text-muted px-4">Likes</p>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card card-profile text-center">
                                    <span class="mb-1 text-warning"><i class="icon-eye"></i></span>
                                    <h3 class="mb-0">263</h3>
                                    <p class="text-muted">Vews</p>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <button class="btn btn-danger px-5 editProfile">Chỉnh sửa hồ sơ</button>
                            </div>
                        </div>

                        <h4>Giới thiệu</h4>
                        <p class="text-muted">
                            ${USER.note}
                        </p>
                        <ul class="card-profile__info">
                            <li class="mb-1"><strong class="text-dark mr-4">Giới tính</strong>
                                <span>${USER.sex?'Nam':'Nữ'}</span>
                            <li class="mb-1"><strong class="text-dark mr-4">Điện thoại</strong>
                                <span>${USER.phoneNumber}</span>
                            </li>
                            <li class="mb-1"><strong class="text-dark mr-4">Email</strong> <span>${USER.email}</span>
                            </li>
                            <li><strong class="text-dark mr-4">Địa chỉ</strong> <span>${USER.address}</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-xl-9">
                <div class="card">
                    <div class="card-body">
                        <form action="#" class="form-profile">
                            <div class="form-group">
                                <textarea class="form-control" name="textarea" id="textarea" cols="30" rows="2"
                                          placeholder="Post a new message"></textarea>
                            </div>
                            <div class="d-flex align-items-center">
                                <ul class="mb-0 form-profile__icons">
                                    <li class="d-inline-block">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-user"></i></button>
                                    </li>
                                    <li class="d-inline-block">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-paper-plane"></i>
                                        </button>
                                    </li>
                                    <li class="d-inline-block">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-camera"></i>
                                        </button>
                                    </li>
                                    <li class="d-inline-block">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-smile"></i>
                                        </button>
                                    </li>
                                </ul>
                                <button class="btn btn-primary px-3 ml-4">Send</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="media media-reply">
                            <img class="mr-3 circle-rounded" src="<c:url value="/assets/admin/images/avatar/2.jpg"/>"
                                 width="50" height="50" alt="Generic placeholder image">
                            <div class="media-body">
                                <div class="d-sm-flex justify-content-between mb-2">
                                    <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days
                                        ago</small></h5>
                                    <div class="media-reply__link">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up"></i>
                                        </button>
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-down"></i>
                                        </button>
                                        <button class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">Reply
                                        </button>
                                    </div>
                                </div>

                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                    sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                                    Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in
                                    faucibus.</p>


                                <div class="media mt-3">
                                    <img class="mr-3 circle-rounded circle-rounded"
                                         src="<c:url value="/assets/admin/images/avatar/4.jpg"/>" width="50" height="50"
                                         alt="Generic placeholder image">
                                    <div class="media-body">
                                        <div class="d-sm-flex justify-content-between mb-2">
                                            <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days
                                                ago</small></h5>
                                            <div class="media-reply__link">
                                                <button class="btn btn-transparent p-0 mr-3"><i
                                                        class="fa fa-thumbs-up"></i></button>
                                                <button class="btn btn-transparent p-0 mr-3"><i
                                                        class="fa fa-thumbs-down"></i></button>
                                                <button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply
                                                </button>
                                            </div>
                                        </div>
                                        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                            sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra
                                            turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia
                                            congue felis in faucibus.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="media media-reply">
                            <img class="mr-3 circle-rounded" src="<c:url value="/assets/admin/images/avatar/2.jpg"/>"
                                 width="50" height="50" alt="Generic placeholder image">
                            <div class="media-body">
                                <div class="d-sm-flex justify-content-between mb-2">
                                    <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days
                                        ago</small></h5>
                                    <div class="media-reply__link">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up"></i>
                                        </button>
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-down"></i>
                                        </button>
                                        <button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
                                    </div>
                                </div>

                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                    sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                                    Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in
                                    faucibus.</p>
                            </div>
                        </div>

                        <div class="media media-reply">
                            <img class="mr-3 circle-rounded" src="<c:url value="/assets/admin/images/avatar/2.jpg"/>"
                                 width="50" height="50" alt="Generic placeholder image">
                            <div class="media-body">
                                <div class="d-sm-flex justify-content-between mb-2">
                                    <h5 class="mb-sm-0">Milan Gbah <small class="text-muted ml-3">about 3 days
                                        ago</small></h5>
                                    <div class="media-reply__link">
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-up"></i>
                                        </button>
                                        <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-thumbs-down"></i>
                                        </button>
                                        <button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
                                    </div>
                                </div>

                                <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                    sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
                                    Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in
                                    faucibus.</p>
                            </div>
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
    $('.editProfile').click(function (e) {
        window.location = '<c:url value="/admin/profile?id=${USER.id}"/>'
    })
</script>