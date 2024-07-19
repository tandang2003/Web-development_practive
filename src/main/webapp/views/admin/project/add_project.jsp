<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
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

<%--<script>--%>
<%--    function saveproject(idPost) {--%>
<%--        let form = new FormData();--%>
<%--        form.append('email', $("#email").val())--%>
<%--        form.append('title', $("#title").val());--%>
<%--        form.append('categoryId', $("#category").val());--%>
<%--        form.append('price', $("#price").val());--%>
<%--        form.append('acreage', $("#acreage").val());--%>
<%--        form.append('provinceId', $("#province").val());--%>
<%--        form.append('description', $("#description").val());--%>
<%--        form.append('postId', idPost);--%>
<%--        form.append('service', $("#service").val());--%>
<%--        form.append('schedule', $("#schedule").val());--%>
<%--        form.append('estimated_complete', $("#estimated_complete").val());--%>
<%--        form.append('status', $("#status").val());--%>
<%--        form.append('avatar', $("#avatar").prop('files')[0]);--%>
<%--        form.append('action', 'add');--%>
<%--        for (const x of $("#file_input1").prop('files')) {--%>
<%--            form.append('groupImage', x);--%>
<%--        }--%>
<%--        form.append('isAccepted', $("#isAccepted").is(":checked") ? 1 : 0);--%>
<%--        form.append('isComplete', $("#isComplete").is(":checked") ? 1 : 0);--%>
<%--        $.ajax({--%>
<%--            url: "/api/admin/project",--%>
<%--            type: "POST",--%>
<%--            dataType: "json", //if exist this line, do not need to parse under--%>
<%--            processData: false,--%>
<%--            contentType: false,--%>
<%--            data: form,--%>
<%--            success: function (data) {--%>
<%--                console.log(data);--%>
<%--                delayNotify(2000, data.message);--%>
<%--                if (data.name == "success") {--%>
<%--                    setTimeout(() => {--%>
<%--                        window.location.href = data.data;--%>
<%--                    }, 3000);--%>
<%--                }--%>
<%--                // if (data.name === "sys") {--%>
<%--                //     alert(data.message);--%>
<%--                // }else {--%>
<%--                //     window.location.href = "/admin/user_management?action=manage";--%>
<%--                // }--%>
<%--            },--%>
<%--            error: function (data) {--%>
<%--                console.log(data.responseText)--%>

<%--                var err = JSON.parse(data.responseText);--%>
<%--                console.log(err)--%>
<%--                for (let e of err) {--%>

<%--                    console.log(e.name, e.message)--%>
<%--                    //     console.log email--%>
<%--                    fetchErr(e.name, e.message);--%>

<%--                }--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>


<%--</script>--%>
<%--<script>--%>
<%--    CKEDITOR.replace('post', {--%>
<%--        width: "100%",--%>
<%--        height: "400px",--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    $('#save').click(function () {--%>
<%--        let content = CKEDITOR.instances.post.getData();--%>
<%--        $.ajax({--%>
<%--            url: "/api/admin/post",--%>
<%--            type: "POST",--%>
<%--            dataType: "json",--%>
<%--            data: {content: content, action: "add"},--%>
<%--            success: function (data) {--%>

<%--                saveproject(data?.data?.id)--%>
<%--            },--%>
<%--            error: function (data) {--%>
<%--                //thông báo lỗi sys--%>
<%--                // console.log(data)--%>
<%--                // delayNotify(2000,obj.name);--%>
<%--                console.log(data)--%>
<%--                var err = JSON.parse(data.responseText);--%>
<%--                //     console.log email--%>
<%--                for (let e of err) {--%>
<%--                    console.log(e.name, e.message)--%>
<%--                    fetchErr(e.name, e.message);--%>
<%--                }--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>
<%--<script>--%>
<%--    function fetchErr(name, mess) {--%>
<%--        console.log(name, mess)--%>
<%--        switch (name) {--%>
<%--            case "email":--%>
<%--                let email = document.getElementById('email');--%>
<%--                email.classList.add('border-danger');--%>
<%--                email.classList.add('text-danger');--%>
<%--                email.value = "";--%>
<%--                email.setAttribute('value', " ");--%>
<%--                email.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "title":--%>
<%--                let title = document.getElementById('title');--%>
<%--                title.classList.add('border-danger');--%>
<%--                title.classList.add('text-danger');--%>
<%--                title.value = "";--%>
<%--                title.setAttribute('value', " ");--%>
<%--                title.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "category":--%>
<%--                let category = document.getElementById('category');--%>
<%--                category.classList.add('border-danger');--%>
<%--                category.classList.add('text-danger');--%>
<%--                category.value = "";--%>
<%--                category.setAttribute('value', " ");--%>
<%--                category.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "price":--%>
<%--                let price = document.getElementById('price');--%>
<%--                price.classList.add('border-danger');--%>
<%--                price.classList.add('text-danger');--%>
<%--                price.value = "";--%>
<%--                // price.setAttribute('value', " ");--%>
<%--                price.setAttribute('placeholder', mess);--%>
<%--                // price.value("");--%>
<%--                // price.placeholder(mess);--%>
<%--                break;--%>
<%--            case "acreage":--%>
<%--                let acreage = document.getElementById('acreage');--%>
<%--                acreage.classList.add('border-danger');--%>
<%--                acreage.classList.add('text-danger');--%>
<%--                acreage.value = "";--%>
<%--                // acreage.setAttribute('value', " ");--%>
<%--                acreage.value = "";--%>
<%--                acreage.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "province":--%>
<%--                let province = document.getElementById('province');--%>
<%--                province.classList.add('border-danger');--%>
<%--                province.classList.add('text-danger');--%>
<%--                province.value = "";--%>
<%--                province.setAttribute('value', " ");--%>
<%--                province.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "description":--%>
<%--                let description = document.getElementById('description');--%>
<%--                description.classList.add('border-danger');--%>
<%--                description.classList.add('text-danger');--%>
<%--                description.value = "";--%>
<%--                description.setAttribute('value', " ");--%>
<%--                description.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "service":--%>
<%--                let service = document.getElementById('service');--%>
<%--                service.classList.add('border-danger');--%>
<%--                service.classList.add('text-danger');--%>
<%--                service.value = "";--%>
<%--                service.setAttribute('value', " ");--%>
<%--                service.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "schedule":--%>
<%--                let schedule = document.getElementById('schedule');--%>
<%--                schedule.classList.add('border-danger');--%>
<%--                schedule.classList.add('text-danger');--%>
<%--                schedule.value = "";--%>
<%--                schedule.setAttribute('value', " ");--%>
<%--                schedule.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            case "estimated_complete":--%>
<%--                let estimated_complete = document.getElementById('estimated_complete');--%>
<%--                estimated_complete.classList.add('border-danger');--%>
<%--                estimated_complete.classList.add('text-danger');--%>
<%--                estimated_complete.value = "";--%>
<%--                estimated_complete.setAttribute('value', " ");--%>
<%--                estimated_complete.setAttribute('placeholder', mess);--%>
<%--                break;--%>
<%--            // case "status":--%>
<%--            //     let status = document.getElementById('status');--%>
<%--            //     status.classList.add('border-danger');--%>
<%--            //     status.classList.add('text-danger');--%>
<%--            //     status.value = "";--%>
<%--            //     status.setAttribute('value', " ");--%>
<%--            //     status.setAttribute('placeholder', mess);--%>
<%--            //     break;--%>
<%--            <!-- Updated "avatar" case -->--%>
<%--            case "avatar":--%>
<%--                // let avatarInput = document.getElementById('avatar');--%>
<%--                // let avatarUploadWrapper = document.getElementById('upload-avatar');--%>
<%--                //--%>
<%--                // avatarInput.classList.add('border-danger');--%>
<%--                // avatarInput.classList.add('text-danger');--%>
<%--                // avatarInput.value = "";--%>
<%--                //--%>
<%--                // avatarInput.setAttribute('placeholder', mess);--%>
<%--                //--%>
<%--                // avatarUploadWrapper.classList.remove('d-none');--%>
<%--                //--%>
<%--                // avatarUploadWrapper.innerHTML = "";--%>
<%--                //--%>
<%--                // avatarUploadWrapper.innerHTML = '<p class="text-danger">Upload failed. Please try again.</p>';--%>
<%--                break;--%>

<%--            case "groupImage":--%>

<%--                break;--%>


<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    &lt;%&ndash; email&ndash;%&gt;--%>
<%--    let email = document.getElementById('email');--%>
<%--    email.addEventListener('click', function () {--%>
<%--            email.classList.remove('border-danger');--%>
<%--            email.classList.remove('text-danger');--%>
<%--            email.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; title&ndash;%&gt;--%>
<%--    let title = document.getElementById('title');--%>
<%--    title.addEventListener('click', function () {--%>
<%--            title.classList.remove('border-danger');--%>
<%--            title.classList.remove('text-danger');--%>
<%--            title.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; category&ndash;%&gt;--%>
<%--    let category = document.getElementById('category');--%>
<%--    category.addEventListener('click', function () {--%>
<%--            category.classList.remove('border-danger');--%>
<%--            category.classList.remove('text-danger');--%>
<%--            category.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; price&ndash;%&gt;--%>
<%--    let price = document.getElementById('price');--%>
<%--    price.addEventListener('click', function () {--%>
<%--            price.classList.remove('border-danger');--%>
<%--            price.classList.remove('text-danger');--%>
<%--            price.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; acreage&ndash;%&gt;--%>
<%--    let acreage = document.getElementById('acreage');--%>
<%--    acreage.addEventListener('click', function () {--%>
<%--            acreage.classList.remove('border-danger');--%>
<%--            acreage.classList.remove('text-danger');--%>
<%--            acreage.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; province&ndash;%&gt;--%>
<%--    let province = document.getElementById('province');--%>
<%--    province.addEventListener('click', function () {--%>
<%--            province.classList.remove('border-danger');--%>
<%--            province.classList.remove('text-danger');--%>
<%--            province.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; description&ndash;%&gt;--%>
<%--    let description = document.getElementById('description');--%>
<%--    description.addEventListener('click', function () {--%>
<%--            description.classList.remove('border-danger');--%>
<%--            description.classList.remove('text-danger');--%>
<%--            description.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; service&ndash;%&gt;--%>
<%--    let service = document.getElementById('service');--%>
<%--    service.addEventListener('click', function () {--%>
<%--            service.classList.remove('border-danger');--%>
<%--            service.classList.remove('text-danger');--%>
<%--            service.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; schedule&ndash;%&gt;--%>
<%--    let schedule = document.getElementById('schedule');--%>
<%--    schedule.addEventListener('click', function () {--%>
<%--            schedule.classList.remove('border-danger');--%>
<%--            schedule.classList.remove('text-danger');--%>
<%--            schedule.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; estimated_complete&ndash;%&gt;--%>
<%--    let estimated_complete = document.getElementById('estimated_complete');--%>
<%--    estimated_complete.addEventListener('click', function () {--%>
<%--            estimated_complete.classList.remove('border-danger');--%>
<%--            estimated_complete.classList.remove('text-danger');--%>
<%--            estimated_complete.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; status&ndash;%&gt;--%>
<%--    let status = document.getElementById('status');--%>
<%--    status.addEventListener('click', function () {--%>
<%--            status.classList.remove('border-danger');--%>
<%--            status.classList.remove('text-danger');--%>
<%--            status.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; avatar&ndash;%&gt;--%>
<%--    let avatar = document.getElementById('avatar');--%>
<%--    avatar.addEventListener('click', function () {--%>
<%--            avatar.classList.remove('border-danger');--%>
<%--            avatar.classList.remove('text-danger');--%>
<%--            avatar.placeholder = "";--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; groupImage&ndash;%&gt;--%>
<%--    // let groupImage = document.getElementById('file_input1');--%>
<%--    // groupImage.addEventListener('click', function () {--%>
<%--    //         groupImage.classList.remove('border-danger');--%>
<%--    //         groupImage.classList.remove('text-danger');--%>
<%--    //         groupImage.placeholder = "";--%>
<%--    //     }--%>
<%--    // )--%>
<%--</script>--%>
<%--<script>--%>
<%--    let allFiles1 = [];--%>
<%--    let input1 = document.getElementById("file_input1");--%>
<%--    let container1 = document.getElementsByClassName("img-container1");--%>
<%--    // console.log(input.files)--%>
<%--    if (input1.files.length !== 0 || allFiles1.length !== 0) {--%>
<%--        container1[0].parentElement.classList.add('d-block')--%>
<%--        container1[0].parentElement.classList.remove('d-none')--%>
<%--    } else {--%>
<%--        container1[0].parentElement.classList.add('d-none')--%>
<%--        container1[0].parentElement.classList.remove('d-block')--%>
<%--    }--%>
<%--    input1.addEventListener('change', function () {--%>
<%--        let files1 = this.files;--%>
<%--        for (let i = 0; i < files1.length; i++) {--%>
<%--            allFiles1.push(files1[i])--%>
<%--        }--%>
<%--        showImage1();--%>
<%--    })--%>
<%--    const showImage1 = () => {--%>
<%--        if (input1.files.length !== 0) {--%>
<%--            container1[0].parentElement.classList.add('d-block')--%>
<%--            container1[0].parentElement.classList.remove('d-none')--%>
<%--        } else {--%>
<%--            container1[0].parentElement.classList.add('d-none')--%>
<%--            container1[0].parentElement.classList.remove('d-block')--%>
<%--        }--%>
<%--        let images1 = ' ';--%>
<%--        allFiles1.forEach((e, i) => {--%>
<%--            images1 += '<div class="image1 position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +--%>
<%--                '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage1(' + i + ')" style=""></i></div></div>'--%>
<%--        })--%>
<%--        container1[0].innerHTML = images1--%>
<%--    }--%>
<%--    let dt1 = new DataTransfer();--%>

<%--    // const delImage1 = index => {--%>
<%--    //     let dt1 = new DataTransfer();--%>
<%--    //     for (let i = 0; i < input1.files.length; i++) {--%>
<%--    //         if (index !== i)--%>
<%--    //             dt1.items.add(input1.files[i]) // here you exclude the file. thus removing it.--%>
<%--    //     }--%>
<%--    //     // dt1.setData("image",)--%>
<%--    //     input1.files = dt1.files--%>
<%--    //     allFiles1 = Array.from(input1.files)--%>
<%--    //     showImage1()--%>
<%--    // }--%>
<%--    const delImage1 = index => {--%>
<%--        dt1.items.clear();--%>
<%--        allFiles1.splice(index, 1);--%>

<%--        allFiles1.forEach(file => {--%>
<%--            dt1.items.add(file);--%>
<%--        });--%>

<%--        input1.files = dt1.files;--%>
<%--        showImage1();--%>
<%--    };--%>

<%--</script>--%>
<%--<script>--%>
<%--    $('.datepicker').datepicker({--%>
<%--        inline: true,--%>
<%--        monthsFull: ['Tháng 01', 'Tháng 02', 'Tháng 03', 'Tháng 04', 'Tháng 05', 'Tháng 06', 'Tháng 07', 'Tháng 08', 'Tháng 09', 'Tháng 10',--%>
<%--            'Tháng 11', 'Tháng 12'],--%>

<%--        weekdaysFull: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],--%>
<%--        showWeekdaysFull: true,--%>
<%--        today: 'Hôm nay',--%>
<%--        clear: 'Xóa',--%>
<%--        close: 'Đóng',--%>
<%--        regional: 'vi-VN',--%>
<%--        labelMonthNext: 'Tháng kế tiêp',--%>
<%--        labelMonthPrev: 'Tháng trước',--%>
<%--        labelMonthSelect: 'Chọn tháng',--%>
<%--        labelYearSelect: 'Chọn năm',--%>
<%--        format: 'yyyy-mm-dd',--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $(".sidebar-btn").click(function () {--%>
<%--            $(".wrapper").toggleClass("mycollapse");--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    for (let item of $('.sidebar-item')) {--%>
<%--        item.addEventListener('click', function () {--%>
<%--            if (cur != null) {--%>
<%--                cur.classList.remove('d-block');--%>
<%--                cur.classList.add('d-none');--%>
<%--            }--%>
<%--            if (this.children.length === 2) {--%>
<%--                this.children[1].classList.remove('d-none')--%>
<%--                this.children[1].classList.add('d-block')--%>
<%--                cur = this.children[1];--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>
<%--</script>--%>

<%--<script>--%>
<%--    userAccepted()--%>

<%--    function userAccepted() {--%>
<%--        var status = document.getElementById('status');--%>
<%--        if (!document.getElementById('isAccepted').checked) {--%>
<%--            status.classList.add('d-none');--%>
<%--            status.classList.remove('d-block');--%>
<%--        } else {--%>
<%--            status.classList.add('d-block');--%>
<%--            status.classList.remove('d-none');--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    conpleteProject()--%>

<%--    function conpleteProject() {--%>
<%--        var projectProgressText = document.getElementById('projectProgressText');--%>
<%--        if (document.getElementById('isComplete').checked) {--%>
<%--            projectProgressText.classList.add('d-none');--%>
<%--            projectProgressText.classList.remove('d-block');--%>
<%--        } else {--%>
<%--            projectProgressText.classList.add('d-block');--%>
<%--            projectProgressText.classList.remove('d-none');--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>

<%--<script>--%>
<%--    let cur;--%>
<%--    for (let item of $('.sidebar-item')) {--%>
<%--        item.addEventListener('click', function () {--%>
<%--            if (cur != null) {--%>
<%--                cur.classList.remove('d-block');--%>
<%--                cur.classList.add('d-none');--%>
<%--            }--%>
<%--            if (this.children.length === 2) {--%>
<%--                this.children[1].classList.remove('d-none')--%>
<%--                this.children[1].classList.add('d-block')--%>
<%--                cur = this.children[1];--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>

<%--</script>--%>

<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $('.mdb-select').materialSelect();--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>