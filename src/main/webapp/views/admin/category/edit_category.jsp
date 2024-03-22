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
    <%--    <div class="header fixed-top ">--%>
    <%--        <div class="header-menu row m-0">--%>
    <%--            <div class="col-11 d-flex align-items-center">--%>
    <%--                <div class="sidebar-btn mr-3">--%>
    <%--                    <i class="fas fa-bars"></i>--%>
    <%--                </div>--%>
    <%--                <div class="title text-uppercase">--%>
    <%--                    Xây dựng <span>Nhà Đẹp</span></div>--%>
    <%--            </div>--%>
    <%--            <ul class="col-1 d-flex align-items-center m-0">--%>
    <%--                <li><a href="#"><i class="fas fa-sign-out-alt"></i></a></li>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--    <div class="sidebar">--%>
    <%--        <div class="sidebar-menu">--%>
    <%--            <center class="logo">--%>
    <%--                <img src="/template/img/logo/logo.png" alt="logo" style="">--%>
    <%--            </center>--%>
    <%--            <li class="sidebar-item">--%>
    <%--                <a href="../dashboard.jsp" class="menu-btn">--%>
    <%--                    <i class="fas fa-desktop"></i><span>Thống kê</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="user">--%>
    <%--                <a href="../user/user_manage.jsp" class="menu-btn">--%>
    <%--                    <i class="fas fa-user-circle"></i><span>QL Người dùng</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="project">--%>
    <%--                <div class="menu-btn">--%>
    <%--                    <i class="fa-solid fa-building"> </i>--%>
    <%--                    <a href="../project/project_manage.jsp">--%>
    <%--                        <span>QL Dự án</span>--%>
    <%--                    </a> <i--%>
    <%--                        class="m-0 fas fa-chevron-circle-down drop-down"></i></div>--%>
    <%--                <div class="sub-menu d-none">--%>
    <%--                    <a href="category_management.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-building m-0"> </i> <i class="fa-solid fa-folder-tree"></i><span>QL loại dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="../project/post_project.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="../project/project_schedule.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-bars-progress"></i><span>QL Dự án thi công</span>--%>
    <%--                    </a>--%>
    <%--                </div>--%>
    <%--            </li>--%>

    <%--            <li class="sidebar-item" id="type-project">--%>
    <%--                <div class="menu-btn">--%>
    <%--                    <a href="../project/project_manage.jsp">--%>
    <%--                        <i class="fa-solid fa-toolbox"></i><span>QL Dịch vụ</span>--%>
    <%--                    </a><i--%>
    <%--                        class="m-0 fas fa-chevron-circle-down drop-down"></i></div>--%>
    <%--                <div class="sub-menu d-none">--%>
    <%--                    <a href="../service/post_service.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dịch vụ</span>--%>
    <%--                    </a>--%>
    <%--                </div>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="contact">--%>
    <%--                <a href="../contact/contact_manage.jsp" class="menu-btn">--%>
    <%--                    <i class="fa-solid fa-file-contract"></i></i><span>QL tương tác</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="slide">--%>
    <%--                <a href="../slide/slide_manage.jsp" class="menu-btn">--%>
    <%--                    <i class="fa-regular fa-clone"></i><span>QL slide</span></span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--        </div>--%>
    <%--    </div>--%>

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
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">Chỉnh sửa Loại dự án</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <button class="btn btn-warning p-2 waves-effect waves-light" id="save" type="button">LƯU
                        </button>
                    </div>
                </div>
                <div>
                    <div class="row flex-center h-auto">
                        <div class="card col-lg-10 mb-4">
                            <div class="card-body">
                                <div class="mb-4">
                                    <label for="name" class="labels">Tên dự án</label>
                                    <input id="name" type="text" class="form-control"
                                           placeholder="Tên dự án" value="${category.name}">
                                </div>
                                <div class="mb-4">
                                    <label for="status" class="labels">Trạng thái</label>
                                    <select id="status" class="browser-default custom-select">

                                        <option value="1" <c:if test="${category.status == 1}">
                                            selected</c:if>>Kích hoạt
                                        </option>
                                        <option value="0" <c:if test="${category.status == 0}">
                                            selected</c:if>>Ẩn
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>


</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="/template/js/inputFile.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
    $(document).ready(function () {
        $('#save').click(function () {
            let name = $('#name').val();
            console.log(name)
            let status = $('#status').val();
            let id = ${category.id};
            $.ajax({
                url: '/api/admin/category?action=edit',
                type: 'Post',
                data: {
                    name: name,
                    status: status,
                    id: id
                },
                // contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    console.log(data)
                    // alert('Cập nhật thành công');
                    // must include: /template/js/admin-modal-notify.js
                    obj = JSON.parse(data);
                    delayNotify(2000, obj.message);
                    if (obj.name == 'success') {
                        setTimeout(() => {
                            window.location.href = obj.data;
                        }, 3000);
                    }
                    // window.location.href = 'http://localhost:8080/admin/category-management.jsp';
                },
                // error: function (data) {
                //     obj = JSON.parse(data);
                //     console.log(data)
                //     delayNotify(2000, obj.message);
                // }
                error: function (data) {
                    console.log(data.responseText)
                    var err = JSON.parse(data.responseText);
                        // console.log(e.name, e.message)
                        fetchErr(err.name, err.message);
                }
            })
        })
    })
</script>
<script>
    CKEDITOR.replace('service-des');
    CKEDITOR.config.width = "100%";
    CKEDITOR.config.height = "400px";
</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
<script>
    function fetchErr(name, mess) {
        // console.log(name, mess)
        switch (name) {
            case 'name':
                let name = document.getElementById('name');
                name.classList.add('border-danger');
                name.classList.add('text-danger');
                name.value = "";
                name.setAttribute('value', " ");
                name.setAttribute('placeholder', mess);
                break;
            // case 'status':
            // let status = document.getElementById('status');
            // status.classList.add('border-danger');
            // status.classList.add('text-danger');
            // status.value = "";
            // status.setAttribute('value', " ");
            // status.setAttribute('placeholder', mess);
            //     break;
        }
    }
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
