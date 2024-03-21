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
    <link href=" <c:url value="/template/css/user.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <title>Thông tin người dùng</title>
    <style>
        div.picker.datepicker .picker__box {
            border: 1px solid;
            box-shadow: none;
        }
    </style>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<div class="wrapper">
    <!--start Navigation-->
    <%--    <div class="wrapper position-relative">--%>
    <%--        <!--start Navigation-->--%>
    <%--        <nav class="navbar navbar-expand-lg navbar-light nav-property position-fixed w-100"--%>
    <%--             style="z-index: 1000; top:0">--%>
    <%--            <div class="container">--%>
    <%--                <a class="navbar-brand "--%>
    <%--                   href="../../../../RealEstateWeb/resources/views/template/main.html">--%>
    <%--                    <div class="navbar-brand flex-center justify-content-between">--%>
    <%--                        <img class="mr-3 ml-4 " src="../../../../RealEstateWeb/public/img/logo/logo.png" style="width: 50px">--%>
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
                        <a class="black-text text-uppercase font-weight-bolder "
                           href="#">Tài khoản cá nhân</a>
                    </li>
                </ol>
            </nav>
        </div>
        <main>
            <div class="container-fluid">
                <!-- Section: Team v.1 -->
                <section class="section team-section">
                    <!-- Grid column -->
                    <div class="edit-profile flex-center">

                        <div class="col-md-8 mb-4">
                            <!-- Card -->
                            <div class="card card-cascade cascading-admin-card user-card">
                                <!-- Card content -->
                                <div class="card-body card-body-cascade">

                                    <!-- Grid row -->
                                    <%--                                        <div class="img-avatar flex-center">--%>
                                    <%--                                            <a class="img-avatar-edit flex-center">--%>
                                    <%--                                                <img src="/template/img/main-service/nhacap45-1-6634.jpg"--%>
                                    <%--                                                     class="rounded-circle"--%>
                                    <%--                                                     alt="User's Profile Picture">--%>
                                    <%--                                                <div class="edit-icon">--%>
                                    <%--                                                    <i class="fas fa-pencil-alt pencil-edit"></i>--%>
                                    <%--                                                </div>--%>
                                    <%--                                            </a>--%>

                                    <%--                                        </div>--%>
                                    <div class="row">

                                        <!-- Grid column -->
                                        <div class="col-lg-4">

                                            <div class="md-form form-sm mb-0">
                                                <input type="text" id="form12" class="form-control form-control-sm"
                                                       value="${auth.fullName}">
                                                <label for="form12" class="">Họ và tên</label>
                                            </div>

                                        </div>
                                        <!-- Grid column -->

                                        <!-- Grid column -->
                                        <div class="col-lg-4">
                                            <div id="date-picker-example" class="md-form mb-0 datepicker"
                                                 style="outline: none" inline="true">
                                                <input type="text" id="birthday"
                                                       class="form-control form-control-sm"
                                                       value="${auth.birthday}">
                                                <label for="birthday" style="">Ngày sinh</label>
                                                <i class="fas fa-calendar input-prefix"
                                                   style="font-size: .875rem; right:10% "></i>
                                            </div>
                                        </div>
                                        <!-- Grid column -->

                                        <!-- Grid column -->
                                        <div class="col-lg-4">

                                            <div class="md-form form-sm mb-0">
                                                <input type="text" id="form4" class="form-control form-control-sm"
                                                       value="${auth.phone}">
                                                <label for="form4" class="disabled">SĐT</label>
                                            </div>

                                        </div>
                                        <!-- Grid column -->

                                    </div>
                                    <!-- Grid row -->

                                    <!-- Grid row -->
                                    <div class="row">

                                        <!-- Grid column -->
                                        <div class="col-lg-6 col-md-10">

                                            <select class="mdb-select md-form" id="provinceId"
                                                    searchable="Search here..">
                                                <option value="" disabled selected>Chọn tỉnh thành</option>
                                                <c:forEach items="${sessionScope.provinces}" var="province">
                                                    <option value="${province.id}" <c:if
                                                            test="${province.id==auth.provinceId}"> selected</c:if>>${province.name}</option>
                                                </c:forEach>
                                            </select>
                                            <label class="mdb-main-label">Tỉnh thành</label>

                                        </div>
                                        <!-- Grid column -->

                                        <!-- Grid column -->
                                        <div class="col-lg-2 col-md-3">
                                            <!-- Material radio -->
                                            <div class="form-check">
                                                <input type="radio" class="form-check-input" id="materialNam"
                                                       name="gender" <c:if test="${auth.gender==1}"> checked</c:if>>
                                                <label class="form-check-label" for="materialNam">Nam</label>
                                            </div>
                                        </div>
                                        <!-- Grid column -->
                                        <!-- Grid column -->
                                        <div class="col-lg-2 col-md-3">
                                            <!-- Material radio -->
                                            <div class="form-check">
                                                <input type="radio" class="form-check-input" id="materialNu"
                                                       name="gender"<c:if test="${auth.gender==0}"> checked</c:if>>
                                                <label class="form-check-label" for="materialNu">Nữ</label>
                                            </div>
                                        </div>

                                        <!-- Grid column -->


                                        <!-- Grid column -->
                                        <div class="col-lg-4 col-md-6">

                                            <div class="md-form form-sm mb-0">
                                                <input type="text" id="form8" class="form-control form-control-sm"
                                                       value="${auth.email}">
                                                <label for="form8" class="">Email</label>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">

                                            <div class="md-form form-sm mb-0">
                                                <input type="password" id="form9"
                                                       class="form-control form-control-sm"
                                                       value="">
                                                <label for="form9" class="">Password</label>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">

                                            <div class="md-form form-sm mb-0">
                                                <input type="password" id="form10"
                                                       class="form-control form-control-sm"
                                                       value="">
                                                <label for="form10" class="">Nhập lại Password</label>
                                            </div>

                                        </div>
                                        <!-- Grid column -->

                                    </div>
                                    <!-- Grid row -->

                                    <!-- Grid row -->
                                    <div class="btn-save flex-center">
                                        <button id="save" type="button"
                                                class="btn btn-mdb-color waves-effect waves-light btn-save-edit"> Lưu
                                        </button>
                                    </div>
                                </div>
                                <!-- Card content -->

                            </div>
                            <!-- Card -->

                        </div>

                    </div>
                    <!-- Grid column -->
                </section>
                <!-- Section: Team v.1 -->

            </div>
        </main>

        <!--footer -->
        <!--end footer -->
    </div>
</div>
</div>
<div id="modal"></div>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/user.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
        $('#save').click(function () {     console.log($('#provinceId').val()),
        console.log($('#materialNu').is(':checked') ? 0 : 1)

        $.ajax({
            url: '/api/user/update',
            type: 'POST',
            dataType: "json",
            data: {
                fullName: $('#form12').val(),
                birthday: $('#birthday').val(),
                phone: $('#form4').val(),
                provinceId: $('#provinceId').val(),
                gender: $('#materialNu').is(':checked') ? 0 : 1,
                email: $('#form8').val(),
                password: $('#form9').val(),
                rePassword: $('#form10').val()
            },
            success: function (data) {
                console.log(data);
                console.log("success");
                window.location.reload();
            },
            error: function (e) {
                console.log("err");
                console.log(e);
                let err= JSON.parse(e.responseText);
                alert(err[0].message)
            }
        })

    })
</script>
</body>
</html>