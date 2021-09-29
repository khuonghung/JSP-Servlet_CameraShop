<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="bootstrap-modal input-group-append">
    <!-- Large modal -->
    <button type="button" class="btn btn-outline-dark" data-toggle="modal"
            data-target=".bd-example-modal-lg">Thêm loại
    </button>
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Loại sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered table-striped verticle-middle">
                        <thead>
                        <jsp:include page="modal-table-title.jsp"/>
                        </thead>
                        <tbody id="idtbodycategory">

                        </tbody>
                    </table>
                    <hr/>
                    <div class="card-body">
                        <h4 class="card-title">Thêm loại sản phẩm</h4>
                        <div class="form-group row">
                            <input type="text" class="form-control" id="namecategory"
                                   placeholder="Nhập tên loại..">
                        </div>
                        <div class="form-group row">
                                <textarea class="form-control" id="descriptioncategory"
                                          placeholder="Mô tả..."></textarea>
                        </div>
                        <button id="idaddcategory" class="btn btn-primary float-right">Thêm</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Xong
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg1" tabindex="-1" role="dialog"
         aria-hidden="true">
        <div class="modal-dialog modal-lg1">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Sửa</h5>
                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card-body">
                        <div class="form-group row">
                            <input type="text" class="form-control" id="editnamecategory"
                                   placeholder="Nhập tên loại..">
                        </div>
                        <div class="form-group row">
                                <textarea class="form-control" id="editdescriptioncategory"
                                          placeholder="Mô tả..."></textarea>
                        </div>
                        <button id="ideditcategory" class="btn btn-primary float-right">Chỉnh sửa</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Xong
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

</script>

