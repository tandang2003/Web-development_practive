<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 04/12/2023
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <%@include file="/layout/public/link.jsp" %>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <title>Thêm dịch vụ</title>
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
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/service">QL Dịch vụ</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Thêm dịch vụ</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <form action="#" method="post" id="form-add-service">
                    <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Thêm dịch vụ</h3>
                        </div>
                        <div class="d-flex">
                            <ul class="nav nav-pills  d-flex font-weight-bold align-items-center" id="pills-tab"
                                role="tablist">
                                <li class="">
                                    <a class="nav-link active " id="pills-home-tab" data-toggle="pill"
                                       href="#pills-home"
                                       role="tab"
                                       aria-controls="pills-home" aria-selected="true">Thông tin</a>
                                </li>
                                <li class="">
                                    <a class="nav-link " id="pills-profile-tab" data-toggle="pill"
                                       href="#pills-profile"
                                       role="tab"
                                       aria-controls="pills-profile" aria-selected="false">Bài viết</a>
                                </li>
                            </ul>
                        </div>
                        <div class="btn-save flex-center">
                            <button form="form-add-service" id="save"
                                    class="btn btn-warning p-2 waves-effect waves-light"
                                    type="submit"> LƯU
                            </button>
                        </div>
                    </div>

                    <div class="tab-content pt-2 pl-1" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab">
                            <div class="edit-profile d-flex justify-content-center">
                                <div class="col-md-8 mb-4">
                                    <!-- Card -->
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <!-- Card content -->
                                        <div class="card-body card-body-cascade">
                                            <div class="row flex-center">
                                                <div class="col-lg-11 mb-4">
                                                    <div class="card-body">
                                                        <div class="mb-4">
                                                            <label for="name" class="labels">Tiêu đề</label>
                                                            <input id="name" name="name" type="text"
                                                                   class="form-control"
                                                                   placeholder="Tiêu đề" value="">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="status" class="labels">Trạng thái</label>
                                                            <select id="status" name="status"
                                                                    class="browser-default custom-select">
                                                                <option value=1>Hiện dịch vụ</option>
                                                                <option value=0>Ẩn dịch vụ</option>
                                                            </select>
                                                        </div>
                                                        <div class="mb-4">
                                                            <div class="form-group green-border-focus">
                                                                <label for="description">Mô tả</label>
                                                                <textarea class="form-control"
                                                                          id="description" name="description"
                                                                          rows="3"></textarea>
                                                            </div>
                                                            <div class="mb-4">
                                                                <p class="m-0">Hình ảnh đại diện: </p>
                                                                <input type="file" id="file_input_avatar"
                                                                       name="file_input_avatar"
                                                                       class="filepond" name="filepond">
                                                                <input type="hidden" name="defaultAvatar"
                                                                       id="defaultAvatar">
                                                                <input type="hidden" name="uploadAvatar"
                                                                       id="uploadAvatar">
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Card content -->
                                    </div>
                                    <!-- Card -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                             aria-labelledby="pills-profile-tab">
                            <div class="edit-profile d-flex justify-content-center">
                                <div class="col-md-12 mb-12">
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <div class="card-body card-body-cascade">
                                            <div class="col-lg-12 col-md-12 p-0">
                                                <div class="form-group">
                                                 <textarea
                                                         class="form-control rounded-0"
                                                         id="post"
                                                         name="post"
                                                         rows="10">
                                                </textarea>
                                                    <!--                                                    <textarea id="sample">Hi</textarea>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard_easyimage/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script type="module" src="<c:url value="/template/js/admin/service-add.js"/>"></script>

</body>
</html>
