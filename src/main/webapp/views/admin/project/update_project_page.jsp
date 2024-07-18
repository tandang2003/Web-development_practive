<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:52 PM
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
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/addProjectPage.css"/>" rel="stylesheet">
    <title>Cập nhật dự án</title>
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
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa dự án</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">

                <form action="#" method="post" id="addproject">
                    <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Chỉnh sửa dự án</h3>
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
                            <button form="addproject" class="btn btn-warning p-2 waves-effect waves-light"
                                    id="save" type="button"> LƯU
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
                                                        <div class="mb-4">
                                                            <label for="email" class="labels">Chủ đầu tư</label>
                                                            <input id="email" type="email" class="form-control"
                                                                   name="email" placeholder="Email chủ đầu tư"
                                                                   value="">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="title" class="labels">Tiêu đề</label>
                                                            <input id="title" type="text" class="form-control"
                                                                   name="title" placeholder="Tiêu đề"
                                                                   value="">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="category" class="labels">Loại dự án</label>
                                                            <select name="category" id="category" name="category"
                                                                    class="form-control">
                                                                <option value="" selected>Loại dự án</option>
<%--                                                                <c:forEach var="item" items="${categories}">--%>
<%--                                                                    <option value="${item.id}"--%>
<%--                                                                            <c:if test="${project.categoryId==item.id}">selected</c:if>><span--%>
<%--                                                                            class="text-uppercase">${item.name}</span>--%>
<%--                                                                    </option>--%>
<%--                                                                </c:forEach>--%>

                                                            </select>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6 mb-4">
                                                                <label for="price" class="labels">Kinh phí</label>
                                                                <input id="price" type="number" name="price"
                                                                       class="form-control"
                                                                       placeholder="Kinh phí" value="">
                                                            </div>
                                                            <div class="col-6 mb-4">
                                                                <label for="acreage" class="labels">Diện tích</label>
                                                                <input id="acreage" type="number" class="form-control"
                                                                       placeholder="Diện tích" name="acreage"
                                                                       value="">

                                                            </div>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="province" class="labels">Tỉnh thành</label>
                                                            <select name="province" id="province"
                                                                    class="form-control">
<%--                                                                <option value="" selected>Chọn tỉnh thành</option>--%>
<%--                                                                <c:forEach var="item" items="${provinces}">--%>
<%--                                                                    <option value="${item.id}" <c:if--%>
<%--                                                                            test="${project.provinceId==item.id}"> selected</c:if>><span--%>
<%--                                                                            class="text-uppercase">${item.name}</span>--%>
<%--                                                                    </option>--%>
<%--                                                                </c:forEach>--%>

                                                            </select>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="province" class="labels">Quận huyện</label>
                                                            <select name="district" id="district"
                                                                    class="form-control">
<%--                                                                <option value="" selected>Chọn tỉnh thành</option>--%>
<%--                                                                <c:forEach var="item" items="${provinces}">--%>
<%--                                                                    <option value="${item.id}" <c:if--%>
<%--                                                                            test="${project.provinceId==item.id}"> selected</c:if>><span--%>
<%--                                                                            class="text-uppercase">${item.name}</span>--%>
<%--                                                                    </option>--%>
<%--                                                                </c:forEach>--%>

                                                            </select>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="province" class="labels">Phường xã</label>
                                                            <select name="ward" id="ward"
                                                                    class="form-control">
<%--                                                                <option value="" selected>Chọn tỉnh thành</option>--%>
<%--                                                                <c:forEach var="item" items="${provinces}">--%>
<%--                                                                    <option value="${item.id}" <c:if--%>
<%--                                                                            test="${project.provinceId==item.id}"> selected</c:if>><span--%>
<%--                                                                            class="text-uppercase">${item.name}</span>--%>
<%--                                                                    </option>--%>
<%--                                                                </c:forEach>--%>

                                                            </select>
                                                        </div>
                                                        <div class="mb-4">
                                                            <div class="form-group green-border-focus">
                                                                <label for="description">Mô tả</label>
                                                                <textarea class="form-control"
                                                                          id="description"
                                                                          name="description"
                                                                          rows="3" placeholder="Mô tả dự án"
                                                                          value="">${project.description}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label class="mdb-main-label">Dịch vụ</label>
                                                            <select class="mdb-select md-form" id="service"
                                                                    name="service[]"
                                                                    multiple>
<%--                                                                <c:forEach var="item" items="${services}">--%>
<%--                                                                    <option value="${item.id}"--%>
<%--                                                                            <c:forEach var="item1"--%>
<%--                                                                                       items="${servicesOfproject}">--%>
<%--                                                                                <c:if test="${item.id==item1.id}">--%>
<%--                                                                                    selected--%>
<%--                                                                                </c:if></c:forEach>>--%>

<%--                                                                   <span--%>
<%--                                                                           class="text-uppercase">${item.name}</span>--%>
<%--                                                                    </option>--%>
<%--                                                                </c:forEach>--%>
                                                            </select>
                                                        </div>
                                                        <div class="mb-4 ">
                                                            <div class="d-flex">
                                                                <label>Tiến độ dự án:</label>
                                                                <div class="form-check">
                                                                    <input type="checkbox"
                                                                           name="isComplete"
                                                                           class="form-check-input"
                                                                           id="isComplete"
                                                                           <c:if test="${isExcuting==false}">checked</c:if>
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
                                                                           class="form-control"
                                                                           value="<c:if test="${isExcuting}">${project.estimated_complete}</c:if>">
                                                                    <i class="fas fa-calendar input-prefix"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-4">
                                                            <div class="d-flex">
                                                                <label for="status" class="labels">Trạng thái: </label>
                                                                <div class="form-check">
                                                                    <input type="checkbox"
                                                                           name="isAccepted"
                                                                           onclick="userAccepted()"
                                                                           class="form-check-input" id="isAccepted"
                                                                           <c:if test="${project.isAccepted==1}">checked</c:if>
                                                                    >
                                                                    <label class="form-check-label"
                                                                           for="isAccepted">Người dùng chấp nhận đăng
                                                                        bài</label>
                                                                </div>
                                                            </div>
                                                            <select id="status" name="status" class="custom-select">
                                                                <option value="1"
                                                                        <c:if test="${project.status==1}">selected</c:if>>
                                                                    Đăng bài
                                                                </option>
                                                                <option value="0"
                                                                        <c:if test="${project.status==0}">selected</c:if>>
                                                                    Ẩn
                                                                </option>
                                                            </select>
                                                        </div>

                                                        <div class="mb-4">
                                                            <div class="input-group mt-2 param-content d-block">
                                                                <div class="file-field d-flex align-items-center">
                                                                    <p class="m-0">Hình ảnh đại diện: </p>
                                                                    <div class="float-left">
                                                                        <button type="button" class="btn btn-primary btn-sm" id="btn-av-upload">chọn
                                                                            ảnh
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <input type="hidden" name="defaultAvatar" id="defaultGallery">
                                                                <input type="hidden" name="uploadAvatar" id="uploadGallery">
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
                            <div class="edit-profile flex-center">
                                <div class="col-md-12 mb-12">
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <div class="card-body card-body-cascade">
                                            <div class=" col-12 mb-4">
                                                <div class="input-group mt-2 param-content d-block">
                                                    <div class="file-field d-flex align-items-center">
                                                        <p class="m-0">Hình ảnh mô tả dự án: </p>
                                                        <div class="float-left">
                                                            <button type="button" class="btn btn-primary btn-sm" id="btn-ga-upload">chọn
                                                                ảnh
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="defaultAvatar" id="defaultAvatar">
                                                    <input type="hidden" name="uploadAvatar" id="uploadAvatar">
                                                </div>

                                                <div class="upload-wrapper d-none avatar">
                                                    <div class="border d-flex img-container1">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="col-12 p-0">
                                            <div class="form-group">
                                                    <textarea class="form-control rounded-0" name="post" id="post"
                                                              rows="10">${post.content}</textarea>
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
<%--<script src="//cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>--%>
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard_easyimage/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script src="<c:url value="/template/js/dataAddress.js"/>"></script>
<script type="module" src="<c:url value="/template/js/admin/project-update-page.js"/>"></script>
<%--<script>--%>
<%--    console.log("${groupImages}")--%>
<%--    let allFiles = [];--%>
<%--    let input = document.getElementById("avatar");--%>
<%--    let container = document.getElementsByClassName("img-container");--%>
<%--    // console.log(input.files)--%>
<%--    if (input.files.length == 0 && allFiles.length == 0) {--%>
<%--        let images = ' ';--%>
<%--        container[0].parentElement.classList.add('d-block')--%>
<%--        container[0].parentElement.classList.remove('d-none')--%>
<%--        images += '<div class="image position-relative border-radius"><img src="${project.avatar}" alt="" class="border"> ' +--%>
<%--            '<div class="position-absolute " ></div></div>'--%>
<%--        container[0].innerHTML = images;--%>
<%--    }--%>

<%--    input.addEventListener('change', function () {--%>
<%--        let files = this.files;--%>
<%--        allFiles = [];--%>
<%--        for (let i = 0; i < files.length; i++) {--%>
<%--            allFiles.push(files[i])--%>
<%--        }--%>
<%--        showImage();--%>
<%--    })--%>

<%--    const showImage = () => {--%>
<%--        container[0].parentElement.classList.add('d-block')--%>
<%--        container[0].parentElement.classList.remove('d-none')--%>
<%--        if (input.files.length == 0) {--%>
<%--            let images = ' ';--%>
<%--            images += '<div class="image position-relative border-radius"><img src="${project.avatar}" alt="" class="border"> ' +--%>
<%--                '<div class="position-absolute " ></div></div>'--%>
<%--            container[0].innerHTML = images;--%>
<%--        } else {--%>
<%--            let images = ' ';--%>
<%--            allFiles.forEach((e, i) => {--%>
<%--                images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +--%>
<%--                    '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'--%>
<%--            })--%>
<%--            container[0].innerHTML = images--%>
<%--        }--%>
<%--    }--%>
<%--    let dt = new DataTransfer();--%>
<%--    const delImage = index => {--%>
<%--        let dt = new DataTransfer();--%>
<%--        for (let i = 0; i < input.files.length; i++) {--%>
<%--            if (index !== i)--%>
<%--                dt.items.add(input.files[i]) // here you exclude the file. thus removing it.--%>
<%--        }--%>
<%--        input.files = dt.files--%>
<%--        allFiles = Array.from(input.files)--%>
<%--        showImage()--%>
<%--    }--%>
<%--    // document.onload = function () {--%>
<%--    //         if(input.files.length!== 0) {--%>
<%--    //         input.files--%>
<%--    //         }--%>
<%--    // };--%>

<%--</script>--%>
<%--<script>--%>
<%--    function saveproject(idPost) {--%>
<%--        console.log(idPost)--%>
<%--        let form = new FormData();--%>
<%--        form.append('id', ${project.id});--%>
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
<%--        if ($("#avatar").prop('files').length !== 0){--%>
<%--            form.append('avatar', $("#avatar").prop('files')[0]);--%>
<%--        console.log("notHaveAvatar");}--%>
<%--    else--%>
<%--        {--%>

<%--            form.append('notHaveAvatar', '1');--%>
<%--        }--%>
<%--        if ($("#file_input1").prop('files').length !== 0)--%>
<%--            for (const x of $("#file_input1").prop('files')) {--%>
<%--                console.log(x);--%>
<%--                console.log("nothavegroupimages");--%>
<%--                form.append('groupImage', x);--%>
<%--            } else {--%>
<%--            form.append('notHaveGroupImages', '1')--%>
<%--        }--%>
<%--        ;--%>
<%--        form.append('isAccepted', $("#isAccepted").is(":checked") ? 1 : 0);--%>
<%--        form.append('isComplete', $("#isComplete").is(":checked") ? 1 : 0);--%>
<%--        $.ajax({--%>
<%--            url: "/api/admin/project?action=edit",--%>
<%--            type: "POST",--%>
<%--            dataType: "json",--%>
<%--            processData: false,--%>
<%--            contentType: false,--%>
<%--            data: form,--%>
<%--            success: function (data) {--%>
<%--                console.log(data.responseText)--%>
<%--                delayNotify(2000, data.message);--%>
<%--                if (data.name == "success") {--%>
<%--                    setTimeout(() => {--%>
<%--                        window.location.href = data.data;--%>
<%--                    }, 3000);--%>

<%--                }--%>
<%--            },--%>
<%--            error: function (data) {--%>
<%--                console.log(data.responseText);--%>
<%--                // delayNotify(2000, data.message);--%>
<%--                // delayNotify(2000, "Có lỗi xảy ra");--%>
<%--                var err = JSON.parse(data.responseText);--%>
<%--                //     console.log email--%>
<%--                for (let e of err) {--%>
<%--                    console.log(e.name, e.message)--%>
<%--                    fetchErr(e.name, e.message);--%>
<%--                }--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--&lt;%&ndash;console.log(${post.id})&ndash;%&gt;--%>

<%--</script>--%>
<script>
    <%--$('#save').click(function () {--%>
    <%--    let content = CKEDITOR.instances.post.getData();--%>
    <%--    $.ajax({--%>
    <%--        url: "/api/admin/post?action=edit",--%>
    <%--        type: "POST",--%>
    <%--        dataType: "json",--%>
    <%--        data: {--%>
    <%--            content: content,--%>
    <%--            id: ${post.id}--%>
    <%--        },--%>
    <%--        success: function (data) {--%>
    <%--            console.log(data)--%>
    <%--            saveproject(data.data.id)--%>
    <%--        },--%>
    <%--        error: function (data) {--%>
    <%--            //thông báo lỗi sys--%>
    <%--            console.log(data)--%>
    <%--            var err = JSON.parse(data.responseText);--%>
    <%--            //     console.log email--%>
    <%--            for (let e of err) {--%>
    <%--                console.log(e.name, e.message)--%>
    <%--                fetchErr(e.name, e.message);--%>
    <%--            }--%>
    <%--        }--%>
    <%--    })--%>
    <%--})--%>
</script>
<script>
    let allFiles1 = [];
    let input1 = document.getElementById("file_input1");
    let container1 = document.getElementsByClassName("img-container1");

    if (input1.files.length == 0 || allFiles1.length == 0) {
        let images = ' ';
        container1[0].parentElement.classList.add('d-block')
        container1[0].parentElement.classList.remove('d-none')
        <c:forEach var="item" begin="0" items="${groupImages}">
        images += '<div class="image position-relative border-radius"><img src="${item}" alt="" class="border"> ' +
            '</div>'
        </c:forEach>
        container1[0].innerHTML = images;
    }
    input1.addEventListener('change', function () {
        let files1 = this.files;
        for (let i = 0; i < files1.length; i++) {
            allFiles1.push(files1[i])
        }
        showImage1();
    })
    const showImage1 = () => {
        container1[0].parentElement.classList.add('d-block')
        container1[0].parentElement.classList.remove('d-none')
        console.log(input1.files.length)
        if (input1.files.length == 0) {
            let images = ' ';
            <c:forEach var="item" begin="0" items="${groupImages}">
            images += '<div class="image position-relative border-radius"><img src="${item}" alt="" class="border"> ' +
                '</div>'
            </c:forEach>
            container1[0].innerHTML = images;
        } else {
            let images1 = ' ';
            allFiles1.forEach((e, i) => {
                images1 += '<div class="image1 position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
                    '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage1(' + i + ')" style=""></i></div></div>'
            })
            container1[0].innerHTML = images1
        }
    }
    let dt1 = new DataTransfer();
    const delImage1 = index => {
        let dt1 = new DataTransfer();
        for (let i = 0; i < input1.files.length; i++) {
            if (index !== i)
                dt1.items.add(input1.files[i]) // here you exclude the file. thus removing it.
        }
        input1.files = dt1.files
        allFiles1 = Array.from(input1.files)
        showImage1()
    }
</script>
</body>
</html>
