<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Đổi mật khẩu</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="idformchanpassword" action="<c:url value="/admin/profile/doi-mat-khau"/>" class="form-valide"
                      method="post">
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="oldpassword">Mật khẩu cũ: <span class="text-danger">*</span>
                        </label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" id="oldpassword" name="oldpassword"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="newpassword">Mật khẩu mới: <span
                                class="text-danger">*</span>
                        </label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" id="newpassword" name="newpassword"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-4 col-form-label" for="repassword">Nhập lại mật khẩu: <span
                                class="text-danger">*</span>
                        </label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" id="repassword" name="repassword"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" id="idbtnchangepassword" class="btn btn-primary">Đổi mật khẩu</button>
            </div>
        </div>
    </div>
</div>

<script>

    document.getElementById("idbtnchangepassword").onclick = onClickBtnChagePassword

    function onClickBtnChagePassword() {
        let oldpassword = document.getElementById('oldpassword').value;
        let newpassword = document.getElementById('newpassword').value;
        let repassword = document.getElementById('repassword').value;
        if (!checkPassword(oldpassword) || !checkPassword(newpassword) || !checkPassword(repassword)
            || !checkConfilm(newpassword, repassword, 'Mật khẩu', 'Nhập lại mật khẩu mới không khớp')) {
        } else {
            swal({
                    title: "Thông báo!",
                    text: "Bạn có chắc muốn thay đổi mật khẩu tài khoản?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Tiếp tục!',
                    cancelButtonText: "Huỷ!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                        $('#idformchanpassword').submit()
                    } else {
                        swal("Huỷ", "Huỷ thay đổi mật khẩu", "error");
                        e.preventDefault();
                    }
                });
        }
    }

    $("#idformchanpassword").submit(function (event) {
        event.preventDefault();
    })

</script>
<!--**********************************
Scripts
***********************************-->
<!-- toast and sweet -->
<script src="<c:url value="/assets/admin/js/query-NQN.js"/>"></script>

<script src="<c:url value="/assets/admin/plugins/common/common.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/custom.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/settings.js"/>"></script>
<script src="<c:url value="/assets/admin/js/gleek.js"/>"></script>
<script src="<c:url value="/assets/admin/js/styleSwitcher.js"/>"></script>

<!-- Chartjs -->
<script src="<c:url value="/assets/admin/plugins/chart.js/Chart.bundle.min.js"/>"></script>
<!-- Circle progress -->
<script src="<c:url value="/assets/admin/plugins/circle-progress/circle-progress.min.js"/>"></script>

<!-- Datamap -->
<script src="<c:url value="/assets/admin/plugins/d3v3/index.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/topojson/topojson.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/datamaps/datamaps.world.min.js"/>"></script>

<!-- Morrisjs -->
<script src="<c:url value="/assets/admin/plugins/raphael/raphael.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/morris/morris.min.js"/>"></script>

<!-- Pignose Calender -->
<script src="<c:url value="/assets/admin/plugins/moment/moment.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>

<!-- ChartistJS -->
<script src="<c:url value="/assets/admin/plugins/chartist/js/chartist.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

<!-- dashboard -->
<script src="<c:url value="/assets/admin/js/dashboard/dashboard-1.js"/>"></script>

<!-- talbe database -->
<script src="<c:url value="/assets/admin/plugins/tables/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/tables/js/datatable-init/datatable-basic.min.js"/>"></script>

<!-- ck editer -->
<script src="<c:url value="/assets/ckeditor/ckeditor.js"/>"></script>

<!-- Date Picker Plugin JavaScript -->
<script src="<c:url value="/assets/admin/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"/>"></script>
<!-- Date range Plugin JavaScript -->
<script src="<c:url value="/assets/admin/plugins/timepicker/bootstrap-timepicker.min.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"></script>

<script src="<c:url value="/assets/admin/js/plugins-init/form-pickers-init.js"/>"></script>

<script src="<c:url value="/assets/admin/plugins/moment/moment.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
<!-- Clock Plugin JavaScript -->
<script src="<c:url value="/assets/admin/plugins/clockpicker/dist/jquery-clockpicker.min.js"/>"></script>
<!-- Color Picker Plugin JavaScript -->
<script src="<c:url value="/assets/admin/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"/>"></script>
<script src="<c:url value="/assets/admin/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"/>"></script>
