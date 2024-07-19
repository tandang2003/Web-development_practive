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

        div.card-body {
            padding: 1rem;
        }

        div.card-body.card-cascade > div {
            margin-top: 10px;
        }

        .md-form label.active {
            transform: translateY(-15px) scale(0.8) !important;
        }

        input.select-dropdown.form-control {
            margin: 0;
        }

        .md-form {
            margin: 10px 0 0.3rem 0;
        }

        .md-form .form-control {
        }

        #gender-error {
            margin-left: 29px;
        }
    </style>
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

                        <!-- Card -->
                        <div class="card card-cascade cascading-admin-card user-card "
                             style="min-width: 50%; border-radius: 10%">
                            <!-- Card content -->
                            <form class="card-body card-body-cascade " id="form-user-update">

                                <!-- Grid column -->
                                <div class="col-lg-12">

                                    <div class="md-form form-sm mb-0 param-content">
                                        <input type="text" id="fullName" name="fullName"
                                               class="form-control form-control-sm"
                                               value="">
                                        <label for="fullName" class="">Họ và tên</label>
                                    </div>

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-lg-12 param-content">
                                    <div id="date-picker-example" class="md-form mb-0 datepicker"
                                         style="outline: none" inline="true">
                                        <input type="text" id="birthday" name="birthday"
                                               class="form-control form-control-sm"
                                               value="">
                                        <label for="birthday" style="">Ngày sinh</label>
                                        <i class="fas fa-calendar input-prefix"
                                           style="font-size: .875rem; right:10% "></i>
                                    </div>
                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-lg-12">

                                    <div class="md-form form-sm mb-0 param-content">
                                        <input type="text" id="phone" name="phone" class="form-control form-control-sm"
                                               value="">
                                        <label for="phone" class="">SĐT</label>
                                    </div>

                                </div>
                                <div class="col-lg-12 param-content">
                                    <select class="mdb-select md-form" id="province"
                                            name="province"
                                            searchable="Nhập để tìm..">
                                        <option value="" disabled selected>Chọn tỉnh/thành phố</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 param-content">

                                    <select class="mdb-select md-form" id="district" name="district"
                                            searchable="Nhập để tìm..">
                                        <option value="" disabled selected>Chọn quận/huyện</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 param-content">

                                    <select class="mdb-select md-form" id="ward" name="ward"
                                            searchable="Nhập để tìm..">
                                        <option value="" disabled selected>Chọn xã/phường</option>
                                    </select>
                                </div>
                                <!-- Grid column -->
                                <div class="row param-content ">
                                    <!-- Grid column -->
                                    <div class="col-lg-6">
                                        <!-- Material radio -->
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="materialNam"
                                                   name="gender" value=1>
                                            <label class="form-check-label" for="materialNam">Nam</label>
                                        </div>
                                    </div>
                                    <!-- Grid column -->
                                    <!-- Grid column -->
                                    <div class="col-lg-6">
                                        <!-- Material radio -->
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="materialNu"
                                                   name="gender" value="0">
                                            <label class="form-check-label" for="materialNu">Nữ</label>
                                        </div>
                                    </div>
                                </div>
                                <!-- Grid column -->
                                <div class="col-lg-12">
                                    <div class="md-form form-sm mb-0 param-content">
                                        <input type="text" id="email" name="email" class="form-control form-control-sm"
                                               value="">
                                        <label for="email" class="">Email</label>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="md-form form-sm mb-0 param-content">
                                        <input type="password" id="password"
                                               name="password"
                                               class="form-control form-control-sm"
                                               value="">
                                        <label for="password" class="">Password</label>
                                    </div>

                                </div>
                                <div class="col-lg-12">

                                    <div class="md-form form-sm mb-0 param-content">
                                        <input type="password" id="repassword"
                                               name="repassword"
                                               class="form-control form-control-sm"
                                               value="">
                                        <label for="repassword" class="">Nhập lại Password</label>
                                    </div>
                                </div>
                                <!-- Grid row -->

                                <!-- Grid row -->
                                <div class="btn-save flex-center">
                                    <button id="save" type="submit"
                                            class="btn btn-mdb-color waves-effect waves-light btn-save-edit"> Lưu
                                    </button>
                                </div>
                            </form>
                            <!-- Card content -->

                        </div>
                        <!-- Card -->
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
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script src="<c:url value="/template/js/dataAddress.js"/>"></script>
<script>
    $.validator.addMethod("dateFormat", function (value, element) {
        return this.optional(element) || /^\d{4}-\d{2}-\d{2}$/.test(value);
    }, "Vui lòng nhập đúng định dạng yyyy-MM-dd");

    validate("#form-user-update", userUpdator, function (form) {
        $.ajax({
            url: "/api/user/update",
            type: "POST",
            data: $(form).serialize(),
            dataType: "json",
            success: function (data) {
                if (data.status === 200) {
                    autoCloseAlertWithFunction(data.message, 3000, swal2Icon.SUCCESS, function () {
                        window.location.reload();
                    })
                } else {
                    errorAlert(data.message)
                }
            },
            error: function (e) {
                console.log(e.responseText)
            }
        })

    })
    $(document).ready(function () {
        $.ajax({
            url: "/api/user",
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data.status == 200) {

                    data = data.data;
                    console.log(data)
                    $("#fullName").val(data.fullName).change();
                    $("#birthday").val(data.birthday).change();
                    $("#phone").val(data.phone).change();
                    $("#email").val(data.email).change();
                    if (user.gender == 1) {
                        $("#materialNam").prop("checked", true)
                    } else {
                        $("#materialNu").prop("checked", true)
                    }
                    $("#province").val(data.address.provinceId);
                    updateDistricts(data.address.provinceId).then(() => {
                        $("#district").val(data.address.districtId);
                        updateWard(data.address.districtId).then(() => {
                            $("#ward").val(data.address.wardId);
                        })
                    });
                } else {
                    autoCloseAlertIcon(data.message, 3000, swal2Icon.WARNING, data.redirect)
                }
            },
            error: (e) => {
                console.log(e.responseText)
            }
        })
    })
</script>
</body>
</html>