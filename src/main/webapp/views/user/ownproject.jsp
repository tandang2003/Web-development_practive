<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/user_favourite.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/user_projects.css"/>" rel="stylesheet">
    <title>Dự án của tôi</title>
</head>
<body>
<div class="wrapper position-relative">
    <%@include file="/layout/public/header.jsp" %>
        <div class="sidebar">
            <div class="sidebar-menu">
                <li class="sidebar-item" id="user">
                    <a href="/user" class="menu-btn">
                        <i class="fas fa-user-circle"></i><span>Thông tin cá nhân</span>
                    </a>
                </li>
                <li class="sidebar-item" id="favourite">
                    <a href="/user/save-list" class="menu-btn">
                        <i class="fa-solid fa-star"></i><span>Dự án đã lưu</span>
                    </a>
                </li>
                <li class="sidebar-item" id="history">
                    <a href="/user/history" class="menu-btn">
                        <i class="fa-solid fa-clock-rotate-left"></i><span>Lịch sử truy cập</span>
                    </a>
                </li>
                <li class="sidebar-item" id="my-projcet">
                    <a href="/user/own-project" class="menu-btn">
                        <i class="fa-solid fa-layer-group"></i><span>Dự án của tôi</span>
                    </a>
                </li>
            </div>
        </div>


        <div class="main-container mt-0">

            <div id="section-1" class="bc-icons-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white small">
                        <li class="breadcrumb-item">
                            <a class="black-text breadcrumb-size"
                               href="/home">
                                <i class="fa-solid fa-house"></i>
                            </a>
                        </li>
                        <li>
                            <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active breadcrumb-size">
                            <a class="black-text text-uppercase "
                               href="/user">Tài khoản cá nhân</a>
                        </li>
                        <li>
                            <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active breadcrumb-size">
                            <a class="black-text text-uppercase font-weight-bolder"
                               href="#">Dự án của
                                tôi</a>
                        </li>
                    </ol>
                </nav>
            </div>

            <main class="my-body">
                <div class="container" id="project-container">
                    
                </div>
            </main>

            <!--footer -->
            <!--end footer -->
        </div>
    </div>
</div>
<%@include file="/layout/public/script.jsp" %>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "/api/user/project",
            type: "GET",
            dataType: "json",
            success: function (data) {
                let projects = data.projects;
                let map = data.map;
                // for (let i = 0; i < projects.length; i++) {
                //     let project = projects[i];
                //     let services = project.map;
                //     let service = "";
                //     for (let j = 0; j < services.length; j++) {
                //         service += services[j].name + " ";
                //     }
                //     map[project.id] = service;
                // }
                // for (let i = 0; i < projects.length; i++) {
                //     let project = projects[i];
                //     let serviceNames = map[project.id]; // Get service names for current project id
                //     project.services = serviceNames; // Add service names to the project object
                // }
                let html = "";
                for (let i = 0; i < projects.length; i++) {
                    let project = projects[i];
                    html += "<div class='border box-project hover-image d-flex'>";
                    html += "<a class=''>";
                    html += "<img src='" + project.avatar + "'>";
                    html += "</a>";
                    html += "<div class='w-100 flex-column'>";
                    html += "<div class='box-content'>";
                    html += "<h4 class=''>" + project.title + "</h4>";
                    html += "<p><span>Chủ đầu tư: </span>" + project.owner + "</p>";
                    html += "<p><span>Địa chỉ: </span>" + project.province + "</p>";
                    html += "<p><span>Loại dự án: </span>" + project.category + "</p>";
                    html += "<p><span>Loại dịch vụ: </span>" + map[project.id] + "</p>";
                    html += "<p><span>Mã dự án: </span>" + project.id + "</p>";
                    html += "<p><span>Dự toán kinh phí: </span>" + project.price + "</p>";
                    html += "<p><span>Tiến độ công trình: </span>" + project.schedule + "</p>";
                    html += "<p><span>Dự kiến thời điểm hoàn thành: </span>" + project.estimated_complete + "</p>";
                    html += "</div>";
                    html += "<div class='box-button d-flex justify-content-around'>";
                    html += "<a href='/user/own-project/demo-post/" + project.id + "'>";
                    html += "<button class='btn btn-blue font-weight-bold ml-0'> Xem bài viết về dự án</button>";
                    html += "</a>";
                    if (project.isAccepted == 1) {
                        html += "<button class='btn btn-grey font-weight-bold ml-0'> Đã được duyệt</button>";
                    } else {
                        html += "<button onclick='accept(" + project.id + ")' class='btn btn-green font-weight-bold ml-0'> Chờ duyệt</button>";
                    }
                    html += "</div>";
                    html += "</div>";
                    html += "</div>";
                }
                $("#project-container").html(html);
            },
            error: function (data) {
                let value = JSON.parse(data.responseText);
                console.log(value);
            }
        })
    })

    function accept(id) {
        console.log(id)
        $.ajax({
            url: "/api/user/accepted",
            type: "POST",
            data: {
                id: id
            },
            success: function (data) {
                let value= JSON.parse(data);
                if (value.name == "success") {
                    alert("Đã cho phép đăng bài viết");
                    location.reload();}
            },
            error: function (data) {
               let value= JSON.parse(data.responseText);
                if (value.name == "error") {
                    location.href=value.data;
                }
            }
        })
    }

</script>
</body>
</html>