<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<!doctype html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <meta content="application/x-www-form-urlencoded;charset=utf-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/addProjectPage.css"/>" rel="stylesheet">

    <style>
        .select-wrapper input.select-dropdown, .custom-file-label {
            z-index: 0;
        }

        div.picker.datepicker .picker__box {
            border: 1px solid;
            box-shadow: none;
        }
        .filepond--item {
            width: calc(50% - 0.5em);
        }

        @media (min-width: 30em) {
            .filepond--item {
                width: calc(50% - 0.5em);
            }
        }

        @media (min-width: 50em) {
            .filepond--item {
                width: calc(33.33% - 0.5em);
            }
        }
    </style>
    <title>Thêm dự án</title>
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
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/project_management">QL Dự án</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Thêm dự án</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <form action="#" method="post" id="form-add-project">
                    <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Thêm dự án</h3>
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
                            <button form="form-add-project" class="btn btn-warning p-2 waves-effect waves-light"
                                    id="save" type="submit"> LƯU
                            </button>
                        </div>
                    </div>
                    <div class="tab-content pt-2 pl-1" id="pills-tabContent" style="height: fit-content">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab">
                            <div class="edit-profile flex-center">
                                <div class="col-md-8 mb-4">
                                    <!-- Card -->
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <!-- Card content -->
                                        <div class="card-body card-body-cascade">
                                            <div class="row flex-center">
                                                <div class="col-lg-11 mb-4">
                                                    <div class="card-body">
                                                        <div class="mb-4 param-content">
                                                            <label for="email" class="labels">Chủ đầu tư</label>
                                                            <input id="email" type="email" class="form-control"
                                                                   name="email" placeholder="Email chủ đầu tư"
                                                                   value="">
                                                            <input id="id" name="id" type="hidden">
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label for="title" class="labels">Tiêu đề</label>
                                                            <input id="title" type="text" class="form-control"
                                                                   name="title" placeholder="Tiêu đề"
                                                                   value="">
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label for="category" class="labels">Loại dự án</label>
                                                            <select name="category" id="category" name="category"
                                                                    class="form-control">
                                                                <option value="" selected>Loại dự án</option>
                                                            </select>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6 mb-4 param-content">
                                                                <label for="price" class="labels">Kinh phí</label>
                                                                <input id="price" type="number" name="price"
                                                                       class="form-control"
                                                                       placeholder="Kinh phí" value="">
                                                            </div>
                                                            <div class="col-6 mb-4 param-content">
                                                                <label for="acreage" class="labels">Diện tích</label>
                                                                <input id="acreage" type="number" class="form-control"
                                                                       placeholder="Diện tích" name="acreage"
                                                                       value="">

                                                            </div>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label for="province" class="labels">Tỉnh thành</label>
                                                            <select name="province" id="province"
                                                                    class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label for="province" class="labels">Quận huyện</label>
                                                            <select name="district" id="district"
                                                                    class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label for="province" class="labels">Phường xã</label>
                                                            <select name="ward" id="ward"
                                                                    class="form-control">
                                                            </select>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <div class="form-group green-border-focus">
                                                                <label for="description">Mô tả</label>
                                                                <textarea class="form-control"
                                                                          id="description"
                                                                          name="description"
                                                                          rows="3" placeholder="Mô tả dự án"
                                                                          value="">${project.description}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <label class="mdb-main-label">Dịch vụ</label>
                                                            <select class="mdb-select md-form" id="service"
                                                                    name="service[]"
                                                                    multiple>
                                                            </select>
                                                        </div>
                                                        <div class="mb-4  param-content">
                                                            <div class="d-flex">
                                                                <label>Tiến độ dự án:</label>
                                                                <div class="form-check">
                                                                    <input type="checkbox"
                                                                           name="isComplete"
                                                                           class="form-check-input"
                                                                           id="isComplete"
                                                                    >
                                                                    <label class="form-check-label"
                                                                           for="isComplete">Hoàn thành</label>
                                                                </div>
                                                            </div>
                                                            <div id="projectProgressText">
                                                                <input type="text" class="form-control  mb-3"
                                                                       placeholder="Tiến độ dự án" id="schedule"
                                                                       name="schedule"
                                                                       value="">
                                                                <div id="date-picker-example"
                                                                     class="md-form md-outline
                                                                     input-with-post-icon datepicker"
                                                                     style="outline: none " inline="true">
                                                                    <input placeholder="Dự kiến ngày hoàng thành"
                                                                           type="text" id="estimated_complete"
                                                                           name="estimated_complete"
                                                                           class="form-control">
                                                                    <i class="fas fa-calendar input-prefix"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-4 param-content">
                                                            <div class="d-flex">
                                                                <label for="status" class="labels">Trạng thái: </label>
                                                                <div class="form-check param-content">
                                                                    <input type="checkbox"
                                                                           name="isAccepted"

                                                                           onclick=""
                                                                           class="form-check-input" id="isAccepted"
                                                                    >
                                                                    <label class="form-check-label"
                                                                           for="isAccepted">Người dùng chấp nhận đăng
                                                                        bài</label>
                                                                </div>
                                                            </div>
                                                            <select id="status" name="status" class="custom-select d-none">
                                                                <option value="1">
                                                                    Đăng bài
                                                                </option>
                                                                <option value="0">
                                                                    Ẩn
                                                                </option>
                                                            </select>
                                                        </div>

                                                        <div class="mb-4">
                                                            <p class="m-0">Hình ảnh đại diện: </p>
                                                            <input type="file" id="file_input_avatar"
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
                                        <!-- Card content -->
                                    </div>

                                    <!-- Card -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                             aria-labelledby="pills-profile-tab">
                            <div class="edit-profile flex-center">
                                <div class="col-md-12 mb-12">
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <div class="card-body card-body-cascade">
                                            <div class=" col-12 mb-4">
                                                <p class="m-0">Hình ảnh mô tả dự án: </p>
                                                <input type="file" id="file_input_gallery" class="filepond"
                                                       name="filepond">
                                                <input type="hidden" name="defaultAvatar" id="defaultGallery">
                                                <input type="file" class="d-none" name="uploadAvatar"
                                                       id="uploadGallery">
                                            </div>
                                        </div>
                                        <div class="col-12 p-0">
                                            <div class="form-group param-content">
                                                    <textarea class="form-control rounded-0" name="post" id="post"
                                                              rows="10"></textarea>
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
<script src="<c:url value="/template/js/dataAddress.js"/>"></script>
<script type="module" src="<c:url value="/template/js/admin/project-add.js"/>"></script>

</body>
</html>