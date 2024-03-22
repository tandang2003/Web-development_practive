020<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <%--    <div class="header fixed-top">--%>
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
    <%--                <img src="../../../../RealEstateWeb/public/img/logo/logo.png" alt="logo" style="">--%>
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
    <%--                    <a href="project_manage.jsp">--%>
    <%--                        <span>QL Dự án</span>--%>
    <%--                    </a> <i--%>
    <%--                        class="m-0 fas fa-chevron-circle-down drop-down"></i></div>--%>
    <%--                <div class="sub-menu d-none">--%>
    <%--                    <a href="../category/category_management.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-building m-0"> </i> <i class="fa-solid fa-folder-tree"></i><span>QL loại dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="post_project.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="project_schedule.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-bars-progress"></i><span>QL Dự án thi công</span>--%>
    <%--                    </a>--%>
    <%--                </div>--%>
    <%--            </li>--%>

    <%--            <li class="sidebar-item" id="type-project">--%>
    <%--                <div class="menu-btn">--%>
    <%--                    <a href="../service/service_manage.jsp">--%>
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
                                                                   value="${userEmail}">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="title" class="labels">Tiêu đề</label>
                                                            <input id="title" type="text" class="form-control"
                                                                   name="title" placeholder="Tiêu đề"
                                                                   value="${project.title}">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="category" class="labels">Loại dự án</label>
                                                            <select name="category" id="category" name="category"
                                                                    class="form-control">
                                                                <option value="" selected>Loại dự án</option>
                                                                <c:forEach var="item" items="${categories}">
                                                                    <option value="${item.id}"
                                                                            <c:if test="${project.categoryId==item.id}">selected</c:if>><span
                                                                            class="text-uppercase">${item.name}</span>
                                                                    </option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6 mb-4">
                                                                <label for="price" class="labels">Kinh phí</label>
                                                                <input id="price" type="number" name="price"
                                                                       class="form-control"
                                                                       placeholder="Kinh phí" value="${project.price}">
                                                            </div>
                                                            <div class="col-6 mb-4">
                                                                <label for="acreage" class="labels">Diện tích</label>
                                                                <input id="acreage" type="number" class="form-control"
                                                                       placeholder="Diện tích" name="acreage"
                                                                       value="${project.acreage}">

                                                            </div>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="province" class="labels">Địa chỉ</label>
                                                            <select name="province" id="province"
                                                                    class="form-control">
                                                                <option value="" selected>Chọn tỉnh thành</option>
                                                                <c:forEach var="item" items="${provinces}">
                                                                    <option value="${item.id}" <c:if
                                                                            test="${project.provinceId==item.id}"> selected</c:if>><span
                                                                            class="text-uppercase">${item.name}</span>
                                                                    </option>
                                                                </c:forEach>

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
                                                                <c:forEach var="item" items="${services}">
                                                                    <option value="${item.id}"
                                                                            <c:forEach var="item1"
                                                                                       items="${servicesOfproject}">
                                                                                <c:if test="${item.id==item1.id}">
                                                                                    selected
                                                                                </c:if></c:forEach>>
                                                                   <span
                                                                           class="text-uppercase">${item.name}</span>
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-4 ">
                                                            <div class="d-flex">
                                                                <label>Tiến độ dự án:</label>
                                                                <div class="form-check">
                                                                    <input type="checkbox"
                                                                           name="isComplete" onclick="conpleteProject()"
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
                                                                       value=" <c:if test="${isExcuting}">${project.schedule}</c:if>">
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
                                                            <div class="input-group mt-2 d-flex align-items-center">
                                                                <label>Chọn hình đại diện</label>
                                                                <div class="file-field d-flex align-items-center">
                                                                    <div class="btn btn-primary btn-sm float-left waves-effect waves-light">
                                                                        <span>chọn ảnh</span>
                                                                        <input type="file" name="avatar"
                                                                               id="avatar"
                                                                               accept="image/*">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="upload-wrapper d-none avatar">
                                                                <div class="border d-flex img-container">
                                                                </div>
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
                                                <div class="input-group mt-2 d-flex align-items-center">
                                                    <label>Hình ảnh mô tả dự án</label>
                                                    <div class="file-field d-flex align-items-center">
                                                        <div class="btn btn-primary btn-sm float-left waves-effect waves-light">
                                                            <span>chọn ảnh</span>
                                                            <input type="file" accept="image/*" name="groupImage"
                                                                   id="file_input1" multiple>
                                                        </div>
                                                    </div>
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
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<%--<script src="<c:url value="/template/js/inputFile.js"/>"></script>--%>
<script>
    console.log("${groupImages}")
    let allFiles = [];
    let input = document.getElementById("avatar");
    let container = document.getElementsByClassName("img-container");
    // console.log(input.files)
    if (input.files.length == 0 && allFiles.length == 0) {
        let images = ' ';
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
        images += '<div class="image position-relative border-radius"><img src="${project.avatar}" alt="" class="border"> ' +
            '<div class="position-absolute " ></div></div>'
        container[0].innerHTML = images;
    }

    input.addEventListener('change', function () {
        let files = this.files;
        allFiles = [];
        for (let i = 0; i < files.length; i++) {
            allFiles.push(files[i])
        }
        showImage();
    })

    const showImage = () => {
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
        if (input.files.length == 0) {
            let images = ' ';
            images += '<div class="image position-relative border-radius"><img src="${project.avatar}" alt="" class="border"> ' +
                '<div class="position-absolute " ></div></div>'
            container[0].innerHTML = images;
        } else {
            let images = ' ';
            allFiles.forEach((e, i) => {
                images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
                    '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
            })
            container[0].innerHTML = images
        }
    }
    let dt = new DataTransfer();
    const delImage = index => {
        let dt = new DataTransfer();
        for (let i = 0; i < input.files.length; i++) {
            if (index !== i)
                dt.items.add(input.files[i]) // here you exclude the file. thus removing it.
        }
        input.files = dt.files
        allFiles = Array.from(input.files)
        showImage()
    }
    // document.onload = function () {
    //         if(input.files.length!== 0) {
    //         input.files
    //         }
    // };

</script>
<script>
    function saveproject(idPost) {
        console.log(idPost)
        let form = new FormData();
        form.append('id', ${project.id});
        form.append('email', $("#email").val())
        form.append('title', $("#title").val());
        form.append('categoryId', $("#category").val());
        form.append('price', $("#price").val());
        form.append('acreage', $("#acreage").val());
        form.append('provinceId', $("#province").val());
        form.append('description', $("#description").val());
        form.append('postId', idPost);
        form.append('service', $("#service").val());
        form.append('schedule', $("#schedule").val());
        form.append('estimated_complete', $("#estimated_complete").val());
        form.append('status', $("#status").val());
        if ($("#avatar").prop('files').length !== 0){
            form.append('avatar', $("#avatar").prop('files')[0]);
        console.log("notHaveAvatar");}
    else
        {

            form.append('notHaveAvatar', '1');
        }
        if ($("#file_input1").prop('files').length !== 0)
            for (const x of $("#file_input1").prop('files')) {
                console.log(x);
                console.log("nothavegroupimages");
                form.append('groupImage', x);
            } else {
            form.append('notHaveGroupImages', '1')
        }
        ;
        form.append('isAccepted', $("#isAccepted").is(":checked") ? 1 : 0);
        form.append('isComplete', $("#isComplete").is(":checked") ? 1 : 0);
        $.ajax({
            url: "/api/admin/project?action=edit",
            type: "POST",
            dataType: "json",
            processData: false,
            contentType: false,
            data: form,
            success: function (data) {
                console.log(data.responseText)
                delayNotify(2000, data.message);
                if (data.name == "success") {
                    setTimeout(() => {
                        window.location.href = data.data;
                    }, 3000);

                }
            },
            error: function (data) {
                console.log(data.responseText);
                // delayNotify(2000, data.message);
                // delayNotify(2000, "Có lỗi xảy ra");
                var err = JSON.parse(data.responseText);
                //     console.log email
                for (let e of err) {
                    console.log(e.name, e.message)
                    fetchErr(e.name, e.message);
                }
            }
        })
    }
</script>
<script>
<%--console.log(${post.id})--%>

</script>
<script>
    let editor = CKEDITOR.replace('post', {
        width: "100%",
        height: "400px",
    });
</script>
<script>
    $('#save').click(function () {
        let content = CKEDITOR.instances.post.getData();
        $.ajax({
            url: "/api/admin/post?action=edit",
            type: "POST",
            dataType: "json",
            // contentType: "application/json",
            // processData: false,

            data: {
                content: content,
                id: ${post.id}
            },
            success: function (data) {
                console.log(data)
                saveproject(data.data.id)
            },
            error: function (data) {
                //thông báo lỗi sys
                console.log(data)
                var err = JSON.parse(data.responseText);
                //     console.log email
                for (let e of err) {
                    console.log(e.name, e.message)
                    fetchErr(e.name, e.message);
                }
            }
        })
    })
</script>
<script>
    function fetchErr(name, mess) {
        console.log(name, mess)
        switch (name) {
            case "email":
                let email = document.getElementById('email');
                email.classList.add('border-danger');
                email.classList.add('text-danger');
                email.value = "";
                email.setAttribute('value', " ");
                email.setAttribute('placeholder', mess);
                break;
            case "title":
                let title = document.getElementById('title');
                title.classList.add('border-danger');
                title.classList.add('text-danger');
                title.value = "";
                title.setAttribute('value', " ");
                title.setAttribute('placeholder', mess);
                break;
            case "category":
                let category = document.getElementById('category');
                category.classList.add('border-danger');
                category.classList.add('text-danger');
                category.value = "";
                category.setAttribute('value', " ");
                category.setAttribute('placeholder', mess);
                break;
            case "price":
                let price = document.getElementById('price');
                price.classList.add('border-danger');
                price.classList.add('text-danger');
                price.value = "";
                // price.setAttribute('value', " ");
                price.setAttribute('placeholder', mess);
                // price.value("");
                // price.placeholder(mess);
                break;
            case "acreage":
                let acreage = document.getElementById('acreage');
                acreage.classList.add('border-danger');
                acreage.classList.add('text-danger');
                acreage.value = "";
                // acreage.setAttribute('value', " ");
                acreage.value = "";
                acreage.setAttribute('placeholder', mess);
                break;
            case "province":
                let province = document.getElementById('province');
                province.classList.add('border-danger');
                province.classList.add('text-danger');
                province.value = "";
                province.setAttribute('value', " ");
                province.setAttribute('placeholder', mess);
                break;
            case "description":
                let description = document.getElementById('description');
                description.classList.add('border-danger');
                description.classList.add('text-danger');
                description.value = "";
                description.setAttribute('value', " ");
                description.setAttribute('placeholder', mess);
                break;
            case "service":
                let service = document.getElementById('service');
                service.classList.add('border-danger');
                service.classList.add('text-danger');
                service.value = "";
                service.setAttribute('value', " ");
                service.setAttribute('placeholder', mess);
                break;
            case "schedule":
                let schedule = document.getElementById('schedule');
                schedule.classList.add('border-danger');
                schedule.classList.add('text-danger');
                schedule.value = "";
                schedule.setAttribute('value', " ");
                schedule.setAttribute('placeholder', mess);
                break;
            case "estimated_complete":
                let estimated_complete = document.getElementById('estimated_complete');
                estimated_complete.classList.add('border-danger');
                estimated_complete.classList.add('text-danger');
                estimated_complete.value = "";
                estimated_complete.setAttribute('value', " ");
                estimated_complete.setAttribute('placeholder', mess);
                break;
            // case "status":
            //     let status = document.getElementById('status');
            //     status.classList.add('border-danger');
            //     status.classList.add('text-danger');
            //     status.value = "";
            //     status.setAttribute('value', " ");
            //     status.setAttribute('placeholder', mess);
            //     break;
            <!-- Updated "avatar" case -->
            case "avatar":
                // let avatarInput = document.getElementById('avatar');
                // let avatarUploadWrapper = document.getElementById('upload-avatar');
                //
                // avatarInput.classList.add('border-danger');
                // avatarInput.classList.add('text-danger');
                // avatarInput.value = "";
                //
                // avatarInput.setAttribute('placeholder', mess);
                //
                // avatarUploadWrapper.classList.remove('d-none');
                //
                // avatarUploadWrapper.innerHTML = "";
                //
                // avatarUploadWrapper.innerHTML = '<p class="text-danger">Upload failed. Please try again.</p>';
                break;

            case "groupImage":

                break;


        }
    }

</script>
<script>
    let email = document.getElementById('email');
    email.addEventListener('click', function () {
        email.classList.remove('border-danger');
        email.classList.remove('text-danger');
        email.setAttribute('placeholder', "Email chủ đầu tư");
    })
    let title = document.getElementById('title');
    title.addEventListener('click', function () {
        title.classList.remove('border-danger');
        title.classList.remove('text-danger');
        title.setAttribute('placeholder', "Tiêu đề");
    })
    let category = document.getElementById('category');
    category.addEventListener('click', function () {
        category.classList.remove('border-danger');
        category.classList.remove('text-danger');
        category.setAttribute('placeholder', "Loại dự án");
    })
    let price = document.getElementById('price');
    price.addEventListener('click', function () {
        price.classList.remove('border-danger');
        price.classList.remove('text-danger');
        price.setAttribute('placeholder', "Kinh phí");
    })
    let acreage = document.getElementById('acreage');
    acreage.addEventListener('click', function () {
        acreage.classList.remove('border-danger');
        acreage.classList.remove('text-danger');
        acreage.setAttribute('placeholder', "Diện tích");
    })
    let province = document.getElementById('province');
    province.addEventListener('click', function () {
        province.classList.remove('border-danger');
        province.classList.remove('text-danger');
        province.setAttribute('placeholder', "Chọn tỉnh thành");
    })
    let description = document.getElementById('description');
    description.addEventListener('click', function () {
        description.classList.remove('border-danger');
        description.classList.remove('text-danger');
        description.setAttribute('placeholder', "Mô tả dự án");
    })
    let service = document.getElementById('service');
    service.addEventListener('click', function () {
        service.classList.remove('border-danger');
        service.classList.remove('text-danger');
        service.setAttribute('placeholder', "Dịch vụ");
    })
    let schedule = document.getElementById('schedule');
    schedule.addEventListener('click', function () {
        schedule.classList.remove('border-danger');
        schedule.classList.remove('text-danger');
        schedule.setAttribute('placeholder', "Tiến độ dự án");
    })
    let estimated_complete = document.getElementById('estimated_complete');
    estimated_complete.addEventListener('click', function () {
        estimated_complete.classList.remove('border-danger');
        estimated_complete.classList.remove('text-danger');
        estimated_complete.setAttribute('placeholder', "Dự kiến ngày hoàng thành");
    })
    let status = document.getElementById('status');
    status.addEventListener('click', function () {
        status.classList.remove('border-danger');
        status.classList.remove('text-danger');
        status.setAttribute('placeholder', "Trạng thái");
    })
</script>
<script>
    let allFiles1 = [];
    let input1 = document.getElementById("file_input1");
    let container1 = document.getElementsByClassName("img-container1");
    // console.log(input.files)

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
<script>
    $('.datepicker').datepicker({
        inline: true,
        monthsFull: ['Tháng 01', 'Tháng 02', 'Tháng 03', 'Tháng 04', 'Tháng 05', 'Tháng 06', 'Tháng 07', 'Tháng 08', 'Tháng 09', 'Tháng 10',
            'Tháng 11', 'Tháng 12'],

        weekdaysFull: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
        showWeekdaysFull: true,
        today: 'Hôm nay',
        clear: 'Xóa',
        close: 'Đóng',
        regional: 'vi-VN',
        labelMonthNext: 'Tháng kế tiêp',
        labelMonthPrev: 'Tháng trước',
        labelMonthSelect: 'Chọn tháng',
        labelYearSelect: 'Chọn năm',
        format: 'yyyy-mm-dd',
    });
</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
<script>
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

<script>
    userAccepted()

    function userAccepted() {
        var status = document.getElementById('status');
        if (!document.getElementById('isAccepted').checked) {
            status.classList.add('d-none');
            status.classList.remove('d-block');
        } else {
            status.classList.add('d-block');
            status.classList.remove('d-none');
        }
    }
</script>
<script>
    conpleteProject()

    function conpleteProject() {
        var projectProgressText = document.getElementById('projectProgressText');
        if (document.getElementById('isComplete').checked) {
            projectProgressText.classList.add('d-none');
            projectProgressText.classList.remove('d-block');
        } else {
            projectProgressText.classList.add('d-block');
            projectProgressText.classList.remove('d-none');
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

<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();
    });
</script>
</body>
</html>
