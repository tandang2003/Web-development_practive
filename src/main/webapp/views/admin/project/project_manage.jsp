<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <title>Quản lí dự án</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container" style="height: fit-content">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL dự án</a>
                    </li>
                </ol>
            </nav>
            <main class="shadow border p-3 h-100">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL DỰ ÁN</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <a href="/admin/project/add">
                            <button class="btn btn-blue p-2" type="button"><i class="fa-solid fa-plus"></i> Thêm dự án
                            </button>
                        </a>
                    </div>
                </div>
                <table id="project-table" class="table table-hover table-striped table-bordered m-0 w-100" style="">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Tên dự án</th>
                        <th class="font-weight-bold" scope="col">Avatar</th>
                        <th class="font-weight-bold" scope="col">Định mức</th>
                        <th class="font-weight-bold" scope="col">Địa chỉ</th>
                        <th class="font-weight-bold" scope="col">Loại dự án</th>
                        <th class="font-weight-bold" scope="col">Đồng ý đăng</th>
                        <th class="font-weight-bold" scope="col">Trạng thái</th>
                        <th class="font-weight-bold" scope="col">Ngày cập nhập</th>
                        <th class="font-weight-bold" scope="col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<%--<script src="<c:url value="/template/js/firebase/uploadImage.js"/>"></script>--%>
<script type="module" src="<c:url value="/template/js/admin/project-manage.js"/>"></script>

</body>
</html>
