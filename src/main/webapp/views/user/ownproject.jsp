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
    <!--start Navigation-->
<%--    <div class="wrapper position-relative">--%>
        <!--start Navigation-->
<%--        <nav class="navbar navbar-expand-lg navbar-light nav-property position-fixed w-100"--%>
<%--             style="z-index: 1000; top:0">--%>
<%--            <div class="container">--%>
<%--                <a class="navbar-brand "--%>
<%--                   href="../../../../RealEstateWeb/resources/views/template/main.html">--%>
<%--                    <div class="navbar-brand flex-center justify-content-between">--%>
<%--                        <img class="mr-3 ml-4 " src="../../../../RealEstateWeb/public/img/logo/logo.png"--%>
<%--                             style="width: 50px">--%>
<%--                        <h5 class=" text-uppercase mb-2 mt-2 font-weight-bold main-color">XÂY DỰNG NHÀ ĐẸP</h5>--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--                <div class="collapse navbar-collapse border-left row  align-items-center"--%>
<%--                     id="navbarSupportedContent-555">--%>
<%--                    <ul class="navbar-nav  col-9 border-right">--%>
<%--                        <li class="nav-item nav-menuItem font-weight-bolder ">--%>
<%--                            <a class="nav-link text-center"--%>
<%--                               href="../../../../RealEstateWeb/resources/views/template/main.html">Trang Chủ--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item nav-menuItem font-weight-bolder">--%>
<%--                            <a class="nav-link text-center"--%>
<%--                               href="../../../../RealEstateWeb/resources/views/template/intro.html">Giới Thiệu</a>--%>
<%--                        </li>--%>
<%--                        <li class="d-flex align-items-center nav-item--%>
<%--                nav-menuItem position-relative font-weight-bolder nav-dropdownItem"--%>
<%--                        >--%>
<%--                            <a class="nav-link text-center"--%>
<%--                               href="../../../../RealEstateWeb/resources/views/template/services.html"--%>
<%--                               role="link"--%>
<%--                            >Dịch vụ--%>
<%--                            </a>--%>
<%--                            <i class="fa-solid fa-angle-down position-absolute  " style="color: #000000;"></i>--%>
<%--                            <div class="dropdown-menu w-100">--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Xây Nhà Trọn--%>
<%--                                    Gói</a>--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Xây Nhà Thô</a>--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Xây Biệt Thự</a>--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Xây Nhà Xưởng</a>--%>
<%--                            </div>--%>

<%--                        </li>--%>
<%--                        <li class="d-flex align-items-center nav-item--%>
<%--                nav-menuItem position-relative font-weight-bolder nav-dropdownItem"--%>
<%--                        >--%>
<%--                            <a class="nav-link text-center"--%>
<%--                               href="../../../../RealEstateWeb/resources/views/template/project.html"--%>
<%--                               role="link"--%>
<%--                            >Dự án--%>
<%--                            </a>--%>
<%--                            <i class="fa-solid fa-angle-down position-absolute  " style="color: #000000;"></i>--%>
<%--                            <div class="dropdown-menu w-100">--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Biệt Thự</a>--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Nhà Phố</a>--%>
<%--                                <a class="dropdown-item text-center" style="font-size: 16px" href="#">Văn Phòng</a>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item nav-menuItem font-weight-bolder">--%>
<%--                            <a class="nav-link text-center"--%>
<%--                               href="../../../../RealEstateWeb/resources/views/template/contact.html">Liên Hệ</a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item nav-menuItem font-weight-bolder" id="nav-menuItem-active">--%>
<%--                            <a class="nav-link text-center" href="#">TK của tôi</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <!--icon font ring-->--%>
<%--                    <div class="phone-contain flex-center justify-content-center col-3">--%>

<%--                        <div class="icon-phone-ring col-lg-6 col-md-6 col-sm-12 ">--%>
<%--                            <div class="w-100 h-100 d-flex justify-content-center align-items-center">--%>
<%--                                <i class="fa-solid fa-phone"></i>--%>
<%--                                <i class="circle-1"></i>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <a class=" col-lg-6 col-md-6">0352033199</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>


        <!--end Navigation-->
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
                <div class="container">
                    <c:forEach items="${projects}" var="project">
                    <div class="border box-project hover-image d-flex">
                        <a class="">
                            <img src="${project.avatar}">
                        </a>
                        <div class="w-100 flex-column">
                            <div class="box-content">
                                <h4 class=""> ${project.title}</h4>

                                <p><span>Chủ đầu tư: </span> ${auth.fullName}</p>
                                <p><span>Địa chỉ: </span> ${project.province}</p>
                                <p><span>Loại dự án: </span>${project.category}</p>
                                <p><span>Loại dịch vụ: </span> ${map[project.id]}</p>
                                <p><span>Mã dự án: </span> ${project.id}</p>
                                <p><span>Dự toán kinh phí: </span> ${project.price}</p>
                                <p><span>Tiến độ công trình: </span> ${project.schedule}</p>
                                <p><span>Dự kiến thời điểm hoàn thành: </span> ${project.estimated_complete}</p>

                            </div>
                            <div class="box-button d-flex justify-content-around">
                                <a href="/user/own-project/demo-post/${project.id}">
                                    <button class="btn btn-blue font-weight-bold ml-0"> Xem bài viết về dự án</button>
                                </a>
                                <c:choose>
                                    <c:when test="${project.isAccepted==1}">
                                        <button class="btn btn-grey font-weight-bold ml-0"> Đã được duyệt</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button onclick="accept(${project.id})"  class="btn btn-green font-weight-bold ml-0"> Chờ duyệt</button>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </main>

            <!--footer -->
            <!--end footer -->
        </div>
    </div>
</div>
<%@include file="/layout/public/script.jsp" %>
<script>

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