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
<script src="<c:url value="/template/js/ajax/ownerProject.js"/>" type="module"></script>
</body>
</html>