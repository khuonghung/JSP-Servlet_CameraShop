<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 8/8/2021
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="compose-content mt-5">
    <form method="post">
        <div class="form-group">
            <input type="text" id="to_compose" class="form-control bg-transparent" placeholder="Gửi tới">
        </div>
        <div class="form-group">
            <input type="text" id="subject_compose" class="form-control bg-transparent" placeholder="Tiêu đề">
        </div>
        <div class="form-group">
            <textarea id="body_compose" class="textarea_editor form-control bg-light" rows="15" placeholder="Nhập nội dung ..."></textarea>
        </div>
    </form>
</div>
<div class="text-left m-t-15">
    <button onclick="sendCompose()" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button">
        <i class="fa fa-paper-plane m-r-5"></i> Gửi
    </button>
</div>

