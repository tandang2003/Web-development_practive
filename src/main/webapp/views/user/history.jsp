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
    <link href=" <c:url value="/template/css/user_history.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/project.css"/>" rel="stylesheet">
    <title>lịch sử đã xem</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<div class="wrapper">
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
                           href="#">Lịch sử hoạt động</a>
                    </li>
                </ol>
            </nav>
        </div>

        <main class="my-body">
            <div class="container">
                <!-- Main Container -->
                <div class="container">
                    <div class="row" id="project-container">

                    </div>
                    <div class="d-flex justify-content-center">
                        <ul class="nav md-pills" id="contain-button">
                            <li class="page-item page-0 ">
                                <a class="page-link " onClick="getP(0)">Trang đầu</a>
                            </li>
                            <c:forEach begin="0" end="${sizePage-1}" var="i">
                                <c:if test="${i == 0}">
                                    <li class="page-item active page-${i} ">
                                        <a class="page-link " onclick="getP(${i})">${i+1} </a></li>
                                </c:if>
                                <c:if test="${i != 0}">
                                    <li class="page-item page-${i}">
                                        <a class="page-link " onclick="getP(${i})">${i+1}</a></li>
                                </c:if>

                            </c:forEach>
                            <li class="page-item page-${sizePage-1}">
                                <a class="page-link" onClick="getP(${sizePage-1})">Trang cuối</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- Main Container -->
            </div>
        </main>

        <!--footer -->
        <!--end footer -->
    </div>
</div>
<%@include file="/layout/public/script.jsp" %>
<script src=" <c:url value="/template/js/ajax/saveProject.js"/>"></script>
<script>
    $(document).ready(function () {
        getP(0);
        $.ajax({
            url: "/api/user/history/length",
            type: "GET",
            dataType: "json",
            success: function (data) {
                if (data.status == 200) {
                    let sizePage = data.data;
                    let containButton = document.getElementById('contain-button');
                    containButton.innerHTML = "";
                    let button = '';
                    button += '<li class="page-item page-0 ">\n' +
                        '                                <a class="page-link " onClick="getP(0)">Trang đầu</a>\n' +
                        '                            </li>';
                    for (let i = 0; i < sizePage; i++) {
                        if (i == 0) {
                            button += '<li class="page-item active page-' + i + ' ">\n' +
                                '                                        <a class="page-link " onclick="getP(' + i + ')">' + (i + 1) + ' </a></li>';
                        } else {
                            button += '<li class="page-item page-' + i + '">\n' +
                                '                                        <a class="page-link " onclick="getP(' + i + ')">' + (i + 1) + '</a></li>';
                        }
                    }
                    button += '<li class="page-item page-' + (sizePage - 1) + '">\n' +
                        '                                <a class="page-link" onClick="getP(' + (sizePage - 1) + ')">Trang cuối</a>\n' +
                        '                            </li>';
                    containButton.innerHTML = button;
                }
            },
            error: function (data) {
                console.log(data);
            }
        })
    });
</script>
<%--<script>--%>
<%--    $('document').ready(function () {--%>
<%--        $(".button-collapse").sideNav();--%>
<%--        var sideNavScrollbar = document.querySelector('.custom-scrollbar');--%>
<%--        var ps = new PerfectScrollbar(sideNavScrollbar);--%>
<%--    });--%>
<%--</script>--%>
<script>
    function effectButton() {
        let pageItem = document.getElementsByClassName('page-item');
        for (let i = 0; i < pageItem.length; i++) {
            pageItem[i].addEventListener('click', function () {
                for (let j = 0; j < pageItem.length; j++) {
                    if (pageItem[j].classList.contains('active')) pageItem[j].classList.remove('active');
                }
                this.classList.add('active');
            })
        }
    }

    effectButton();

    function getP(offset) {
        $.ajax({
            url: "/api/user/history",
            type: "GET",
            data: {
                offset: offset
            },
            success: function (data) {
                let data1 = JSON.parse(data);
                drawProject(data1);
            },
            error: function (data) {
                console.log(data);
            }
        })

    }
</script>
<script>
    function drawProject(data) {
        console.log(data);
        let container = document.getElementById('project-container');
        container.innerHTML = "";
        let project = '';
        for (const x of data) {
            project += '<div class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">' +
                '<div' + ' class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">';


            if (x.isSave) project += ' <i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'
            else
                project += '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>';
            project += '<a href="/post/project/' + x.id + '">' +
                '<img src="' + x.avatar + '"' + ' class="w-100">' +
                ' <input type="hidden" class="project-id" value=' + x.id + '>' +
                ' <div class="w-100 position-absolute projectCard-content">' +
                '  <div class="mask justify-content-center d-flex h-100"' + ' style="background-color: rgba(48, 48, 48, 0.72);">' +
                '<div class="align-items-center flex-column d-flex w-100">' +
                ' <h6 class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">' + x.title + '</h6>' +
                '<p class="text-white p-0 id-project">' +
                '<strong>MDA:' + x.id + '</strong>' +
                '</p>' + '<p class="text-white p-4 vanBan">' + x.description + '</p>' +
                '</div>' + '</div></div></a></div></div>'
        }
        container.innerHTML = project;
    }
</script>
</body>
</html>