<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quang
  Date: 7/21/2021
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Thên sản phẩm</title>

<!--**********************************
Content body start
***********************************-->
<div class="content-body">

    <div class="row page-titles mx-0">
        <div class="col p-md-0">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Quản lý sản phẩm</a></li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Thêm sản phẩm</a></li>
            </ol>
        </div>
    </div>
    <!-- row -->

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Thêm sản phẩm</h2>
                        <h4 class="text-danger mb-4">${addProductError}</h4>
                        <div class="form-validation">
                            <form id="idformaddproduct" class="form-valide" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="nameproduct">Tên sản phẩm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" id="nameproduct" name="name"
                                               placeholder="Enter a name.." value="${product.name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="categoryproduct">Loại sản phẩm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8 input-group">
                                        <select class="custom-select" id="categoryproduct" name="category">
                                            <option value="0" selected>Vui lòng chọn...</option>
                                            <c:forEach items="${lstCategory}" var="category">
                                                <c:if test="${!category.removed}">
                                                    <c:if test="${product.entityCategory.id == category.id}">
                                                        <option value="${category.id}"
                                                                selected>${category.name}</option>
                                                    </c:if>
                                                    <c:if test="${product.entityCategory.id != category.id}">
                                                        <option value="${category.id}">${category.name}</option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <jsp:include page="layout/modalAddCategory.jsp"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="brandproduct">Thương hiệu <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8 input-group">
                                        <select class="custom-select" id="brandproduct" name="brand">
                                            <option value="0" selected>Vui lòng chọn...</option>
                                            <c:forEach items="${lstBrand}" var="brand">
                                                <c:if test="${!brand.removed}">
                                                    <c:if test="${product.entityBrand.id == brand.id}">
                                                        <option value="${brand.id}" selected>${brand.name}</option>
                                                    </c:if>
                                                    <c:if test="${product.entityBrand.id != brand.id}">
                                                        <option value="${brand.id}">${brand.name}</option>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-dark" type="button">
                                                <a href="<c:url value="/admin/brand/add"/>"
                                                   target="_blank">Thêm thương hiệu</a>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="nameproduct">Ảnh sản phẩm <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div id="chooseImage" class="col-lg-8">

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-4 col-form-label" for="nameproduct">Mổ tả: <span
                                            class="text-danger">*</span>
                                    </label>
                                    <div class="col-lg-8">
                                        <textarea class="form-control" id="descriptionproduct"
                                                  name="description">${product.description}</textarea>
                                    </div>
                                </div>
                                <div id="loadAttribute">

                                </div>
                                <div class="form-group row">
                                    <div class="col-lg-8 ml-auto">
                                        <button id="removeAttribute" class="btn btn-prev" type="button">
                                            Bớt thuộc tính
                                        </button>
                                        <button id="addAttribute" class="btn btn-next" type="button">
                                            Thêm thuộc tính
                                        </button>
                                        <button id="reloadproduct" class="btn btn-info mx-2">Reload</button>
                                        <button id="addproduct" class="btn btn-primary">Thêm</button>
                                    </div>
                                </div>
                            </form>
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

    // TODO thêm chi tiết sản phẩm
    document.getElementById('addAttribute').onclick = addAttribute
    let j = 0;

    document.getElementById('removeAttribute').onclick = removeAttribute

    function removeAttribute() {
        if (j > 1) {
            let addAttribute = document.getElementsByClassName('addAttribute');
            let inputAttribute = document.getElementsByClassName('inputAttribute');
            // let inputQuantity = document.getElementsByClassName("inputQuantity");
            let inputPrice = document.getElementsByClassName('inputPrice');
            let inputLocaltion = document.getElementsByClassName('inputLocaltion');
            swal({
                    title: "Cảnh báo?",
                    text: "Thực hiện xoá một hàng thuộc tính sẽ biến mất!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#DD6B55',
                    confirmButtonText: 'Xoá!',
                    cancelButtonText: "Huỷ!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {

                    if (isConfirm) {
                        for (let i = addAttribute.length - 1; i > 0; i--) {
                            if (addAttribute[i].hidden === false) {
                                addAttribute[i].hidden = true;
                                inputAttribute[i].value = '';
                                // inputQuantity[i].value = '';
                                inputPrice[i].value = '';
                                inputLocaltion[i].value = '';
                                j--;
                                break;
                            }
                        }
                        swal("Thành công!", "Một hàng thuộc tính đã biến mất!", "success");
                    } else {
                        swal("Thất bại", "Xoá hàng thuộc tính thất bại :)", "error");
                    }
                });
        } else {
            sweetWrong('Cảnh báo', 'Chỉ còn ' + j + ' thuộc tính sản phẩm')
        }
    }

    function addAttribute() {
        if (j < 15) {
            let addAttribute = document.getElementsByClassName('addAttribute');
            setTimeout(function () {
                for (let i = 0; i < addAttribute.length; i++) {
                    if (addAttribute[i].hidden === true) {
                        addAttribute[i].hidden = false;
                        j++;
                        break;
                    }
                }
            }, 100)
        } else {
            sweetWrong('Cảnh báo', 'Chỉ được thêm tối đa ' + j + ' thuộc tính sản phẩm')
        }
    }

    function loadAttribute() {
        for (let i = 0; i < 15; i++) {
            document.getElementById("loadAttribute").innerHTML += '<div class="addAttribute form-group row" hidden="true">'
                + '    <label class="col-lg-4 col-form-label">Thuộc tính ' + (i + 1) + '<span'
                + '   class="text-danger">*</span>'
                + ' </label>'
                + ' <div class="col-lg-8 input-group">'
                + ' <div class="row">'
                + '  <div class="col-lg-4">'
                + '  <select class="inputAttribute custom-select" name="idAttributes">'
                + '  <option value="" selected>Chọn thuộc tính ' + (i + 1) + '...</option>'
                + '      <c:forEach items="${lstAttribute}" var="attribute">'
                + '      <c:if test="${!attribute.removed}">'
                + '   <option value="${attribute.id}">'
                + '       ${attribute.name} - ${attribute.value}'
                + '    </option>'
                + '    </c:if>'
                + '     </c:forEach>'
                + '   </select>'
                + '   </div>'
                // + '  <div class="col-lg-3">'
                // + '   <input type="text" class="inputQuantity form-control"'
                // + '  name="quantitys"'
                // + '   placeholder="Số lượng ' + (i + 1) + '"/>'
                // + '   </div>'
                + '  <div class="col-lg-4">'
                + '   <input type="number" min="1" class="inputPrice form-control" name="prices"'
                + '   placeholder="Giá bán ' + (i + 1) + '"/>'
                + '   </div>'
                + '  <div class="col-lg-4">'
                + '   <input type="text" class="inputLocaltion form-control" name="locations"'
                + '   placeholder="Vị trí ' + (i + 1) + '"/>'
                + '   </div>'
                + '  </div>'
                + '  </div>'
                + '</div>'
        }
        if (j < 1) {
            let addAttribute = document.querySelector('.addAttribute');
            addAttribute.hidden = false
            j++;
        }
    }


    // TODO validate sản phẩm
    // thêm hình ảnh
    function addimage() {
        for (let i = 0; i < 12; i++) {
            let divImage = document.getElementById('chooseImage');
            divImage.innerHTML += '<input type="file" name="image' + i + '" class="upload2" style="display: none;">'
                + '<img class="imgChon2 mx-2 py-2" src="<c:url value="/assets/chonfile.png" />"'
                + 'width="150px" style="display: none;"/>'
        }
        let file2 = document.getElementsByClassName("upload2");
        let img2 = document.getElementsByClassName('imgChon2');
        setTimeout(function () {
            img2[0].style.display = 'inline-block'
            for (let i = 0; i < file2.length; i++) {
                img2[i].onclick = function () {
                    file2[i].click()
                }
                file2[i].addEventListener('change', function () {
                    let url = URL.createObjectURL(file2[i].files[0]);
                    img2[i].src = url
                    if (i < 11) {
                        img2[i + 1].style.display = 'inline-block';
                    }
                }, false);
            }
        }, 100);
    }

    //

    // TODO tạo ckeditor
    $(document).ready(function () {
        editor = CKEDITOR.replace('descriptionproduct');
        blockForm();
        addimage();
        loadAttribute();
    })

    document.getElementById('idaddcategory').onclick = addCategory

    function addCategory() {
        let name = document.getElementById('namecategory').value;
        let description = document.getElementById('descriptioncategory').value;
        updateCategory(null, name, description, 'add');
    }

    function updateCategory(id, name, description, evt) {
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/category/" + evt,
            type: "get", //send it through get method
            data: {
                id: id,
                name: name,
                description: description
            },
            success: function (response) {
                document.getElementById("idtbodycategory").innerHTML = response;
                document.getElementById('namecategory').value = '';
                document.getElementById('descriptioncategory').value = '';
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
        loadClassBtnEditCategory();
    }

    function loadCategory() {
        $.ajax({
            url: "/ASS_JV4_war_exploded/load/category",
            type: "get", //send it through get method
            success: function (response) {
                document.getElementById("idtbodycategory").innerHTML = response
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
        loadClassBtnEditCategory();
    }

    function blockForm() {
        $("#idformaddproduct").submit(function (event) {
            event.preventDefault();
        });
        loadCategory();
    }

    document.getElementById("reloadproduct").onclick = onClickReload

    function onClickReload() {
        swal({
                title: "Cảnh báo?",
                text: "Do trang web chưa được nâng cấp version 1.2 nên khi reload thuộc tính và ảnh sản phẩm sẽ bị xoá bỏ!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#DD6B55',
                confirmButtonText: 'Tiếp tục!',
                cancelButtonText: "Huỷ!",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function () {
                document.getElementById("idformaddproduct").action = '${pageContext.request.contextPath}/admin/product/add-reload';
                document.getElementById("idformaddproduct").submit();
            });
    }

    document.getElementById("addproduct").onclick = onClickAddProduct

    function onClickAddProduct() {
        let nameproduct = document.getElementById('nameproduct').value;
        let categoryproduct = document.getElementById('categoryproduct').value;
        let brandproduct = document.getElementById('brandproduct').value;
        let inputAttribute = document.querySelector('.inputAttribute').value;
        // let inputQuantity = document.querySelector(".inputQuantity");
        let inputPrice = document.querySelector('.inputPrice').value;
        let inputLocaltion = document.querySelector('.inputLocaltion').value;
        let upload2 = document.querySelector('.upload2').value;
        if (nameproduct === null || nameproduct === '') {
            toastDanger('Error', 'Tên sản phẩm không được để trống');
            return;
        }
        if (nameproduct.trim().length < 15) {
            toastWarning('Warning', 'Tên sản phầm phải từ 15 ký tự');
            return;
        }
        if (categoryproduct === null || categoryproduct.trim() === '') {
            toastDanger('Error', 'Chưa chọn loại sản phẩm');
            return;
        }
        if (brandproduct === null || brandproduct.trim() === '') {
            toastDanger('Error', 'Chưa chọn thương hiệu sản phẩm');
            return;
        }
        if (!checkImage('Ảnh sản phẩm', upload2)) {
            return;
        }
        if (inputAttribute === null || inputAttribute.trim() === '') {
            toastDanger('Error', 'Chưa chọn thuộc tính sản phẩm');
            return;
        }
        if (inputPrice === null || inputPrice.trim() === '') {
            toastDanger('Error', 'Chưa nhập giá bán của sản phẩm');
            return;
        }
        if (Number(inputPrice) <= 0) {
            toastWarning('Warning', 'Giá tiền phải lớn hơn 0');
            return;
        }
        // if(!/\\d+/.test(inputPrice)){
        //     toastWarning('Warning', 'Giá tiền phải là số nguyên dương');
        //     return;
        // }
        if (inputLocaltion === null || inputLocaltion.trim() === '') {
            toastDanger('Error', 'Chưa nhập vị trí đặt sản phẩm');
            return;
        }
        if (inputLocaltion.trim().length < 4) {
            toastWarning('Warning', 'Vị trí đặt phải từ 4 ký tự');
            return;
        } else {
            swal({
                title: 'Thông báo!',
                text: 'Thêm thông tin sản phẩm mới',
                type: "warning",
                showCancelButton: !0,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: 'Thêm',
                closeOnConfirm: !1
            }, function () {
                document.getElementById("idformaddproduct").action = '${pageContext.request.contextPath}/admin/product/add';
                document.getElementById("idformaddproduct").submit();
            })
        }
    }

    let idCategory = -1;

    function loadClassBtnEditCategory() {
        let arrBtn = document.getElementsByClassName('btneditcategory');
        let arrId = document.getElementsByClassName('showId');
        let arrName = document.getElementsByClassName('showName');
        let arrDescription = document.getElementsByClassName('showDescription');
        setTimeout(function () {
            for (let i = 0; i < arrBtn.length; i++) {
                arrBtn[i].onclick = onClickBtnEditCategory

                function onClickBtnEditCategory() {
                    idCategory = arrId[i].innerHTML;
                    document.getElementById('editnamecategory').value = arrName[i].innerHTML
                    document.getElementById('editdescriptioncategory').value = arrDescription[i].innerHTML
                }
            }
        }, 1000);
    }

    document.getElementById('ideditcategory').onclick = onClickBtnEditCategory

    function onClickBtnEditCategory() {
        let name = document.getElementById('editnamecategory').value;
        let description = document.getElementById('editdescriptioncategory').value;
        console.log(idCategory)
        if (idCategory >= 0) {
            updateCategory(idCategory, name, description, 'edit');
        }
    }

</script>