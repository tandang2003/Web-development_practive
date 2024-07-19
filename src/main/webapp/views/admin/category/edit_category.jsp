<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>

    <%@include file="/layout/public/link.jsp" %>
    <meta charset="UTF-8">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/addProjectPage.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.css"/>"
          rel="stylesheet">

    <title>Chỉnh sửa loại dự án</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/project_management">QL Dự án</a>
                    </li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/category_management">QL loại dự
                        án</a>
                    </li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa loại dự
                        án</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <form id="form-category">
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Thêm Loại dự án</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center p-0">
                            <button class="btn btn-warning p-2 waves-effect waves-light" id="save" type="submit">LƯU
                            </button>
                        </div>
                    </div>
                    <div>
                        <div class="row flex-center h-auto">
                            <div class="card col-lg-10 mb-4">
                                <div class="card-body">
                                    <div class="mb-4 param-content">
                                        <label for="name" class="labels">Tên dự án</label>
                                        <input id="name" name="name" type="text" class="form-control"
                                               placeholder="Tên dự án" value="">
                                    </div>
                                    <div class="mb-4 param-content">
                                        <label for="status" class="labels">Trạng thái</label>
                                        <select id="status" name="status" class="browser-default custom-select">
                                            <option value="1" selected>Kích hoạt</option>
                                            <option value="0">Ẩn</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="id" id="id" value=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<%--<script src="<c:url value="/template/js/inputFile.js"/>"></script>--%>
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script>
    $(document).ready(function () {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/category/edit/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log(data)
                // let obj = JSON.parse(data);
                $('#name').val(data.name);
                $('#status').val(data.status);
                $('#id').val(data.id);
            },
            error: function (data) {
                errorAlert()
            }
        })
        validate('#form-category', adminUpdateCategoryValidator, function (form) {
            const id = window.location.href.split('/').pop();
            $.ajax({
                url: '/api/admin/category/edit/'+id,
                type: 'Post',
                data: $(form).serializeArray(),
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    if (data.status == 200) {
                        autoCloseAlertIcon(data.message, 1500, swal2Icon.SUCCESS, data.data)
                    } else {
                        autoCloseAlertIcon(data.message, 1500, swal2Icon.ERROR, null)
                    }
                },
                error: function (data) {
                    errorAlert()
                }
            })
        })
        <%--$('#save').click(function () {--%>
        <%--    let name = $('#name').val();--%>
        <%--    console.log(name)--%>
        <%--    let status = $('#status').val();--%>
        <%--    let id = ${category.id};--%>
        <%--    $.ajax({--%>
        <%--        url: '/api/admin/category?action=edit',--%>
        <%--        type: 'Post',--%>
        <%--        data: {--%>
        <%--            name: name,--%>
        <%--            status: status,--%>
        <%--            id: id--%>
        <%--        },--%>
        <%--        // contentType: 'application/json; charset=utf-8',--%>
        <%--        success: function (data) {--%>
        <%--            console.log(data)--%>
        <%--            // alert('Cập nhật thành công');--%>
        <%--            // must include: /template/js/admin-modal-notify.js--%>
        <%--            obj = JSON.parse(data);--%>
        <%--            delayNotify(2000, obj.message);--%>
        <%--            if (obj.name == 'success') {--%>
        <%--                setTimeout(() => {--%>
        <%--                    window.location.href = obj.data;--%>
        <%--                }, 3000);--%>
        <%--            }--%>
        <%--            // window.location.href = 'http://localhost:8080/admin/category-management.jsp';--%>
        <%--        },--%>
        <%--        // error: function (data) {--%>
        <%--        //     obj = JSON.parse(data);--%>
        <%--        //     console.log(data)--%>
        <%--        //     delayNotify(2000, obj.message);--%>
        <%--        // }--%>
        <%--        error: function (data) {--%>
        <%--            console.log(data.responseText)--%>
        <%--            var err = JSON.parse(data.responseText);--%>
        <%--                // console.log(e.name, e.message)--%>
        <%--                fetchErr(err.name, err.message);--%>
        <%--        }--%>
        <%--    })--%>
        <%--})--%>
    })
</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
<script>
    let cur;
    for (let item of $('.sidebar-item')) {
        item.addEventListener('click', function () {
            if (cur != null) {
                cur.classList.remove('d-block');
                cur.classList.add('d-none');
            }
            if (this.children.length === 2) {
                this.children[1].classList.remove('d-none')
                this.children[1].classList.add('d-block')
                cur = this.children[1];
            }
        })
    }

</script>
</body>
</html>
