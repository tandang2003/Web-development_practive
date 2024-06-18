<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 04/12/2023
  Time: 2:41 PM
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
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <!---->
    <title>Thêm người dùng</title>
    <style>
        div.picker.datepicker .picker__box {
            border: 1px solid;
            box-shadow: none;
        }
    </style>
    <title>Title</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <%--    <div class="header fixed-top ">--%>
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
    <%--                <img src="<c:url value="/template/img/logo/logo.png"></c:url>" alt="logo" style="">--%>
    <%--            </center>--%>
    <%--            <li class="sidebar-item">--%>
    <%--                <a href="../dashboard.jsp" class="menu-btn">--%>
    <%--                    <i class="fas fa-desktop"></i><span>Thống kê</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="user">--%>
    <%--                <a href="user_manage.jsp" class="menu-btn">--%>
    <%--                    <i class="fas fa-user-circle"></i><span>QL Người dùng</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--            <li class="sidebar-item" id="project">--%>
    <%--                <div class="menu-btn">--%>
    <%--                    <i class="fa-solid fa-building"> </i>--%>
    <%--                    <a href="../project/project_manage.jsp">--%>
    <%--                        <span>QL Dự án</span>--%>
    <%--                    </a> <i--%>
    <%--                        class="m-0 fas fa-chevron-circle-down drop-down"></i></div>--%>
    <%--                <div class="sub-menu d-none">--%>
    <%--                    <a href="../category/category_management.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-building m-0"> </i> <i class="fa-solid fa-folder-tree"></i><span>QL loại dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="../project/post_project.jsp" class="menu-btn">--%>
    <%--                        <i class="fa-solid fa-newspaper"></i><span>QL Bài viết dự án</span>--%>
    <%--                    </a>--%>
    <%--                    <a href="../project/project_schedule.jsp" class="menu-btn">--%>
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
                <ol class="breadcrumb p-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text"
                                                   href="/admin/dashboard">Thống
                        kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/user_management?action=manager">QL
                        người dùng</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa người dùng</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3" style="height: fit-content!important;">
                <form action="${pageContext.request.contextPath}/admin/user_management?action=edit" method="post">
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Chỉnh sửa người dùng</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center p-0">
                            <div class="btn-save flex-center">
                                <button type="button" class="btn btn-warning p-2 waves-effect waves-light"
                                        id="save">LƯU
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="edit-profile flex-center">
                            <div class="col-md-8 mb-4">
                                <!-- Card -->
                                <div class="card card-cascade cascading-admin-card user-card">
                                    <!-- Card content -->
                                    <div class="card-body card-body-cascade">
                                        <input type="hidden" id="userId" value="">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                    <input type="email" id="email" class="form-control form-control-sm"
                                                           name="email" value="">
                                                    <label for="email">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                    <input type="password" id="password"
                                                           class="form-control form-control-sm" name="password"
                                                           value="">
                                                    <label for="password">Password</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row d-flex align-items-center">
                                            <div class="col-lg-4">
                                                <div class="md-form form-sm mb-0">
                                                    <input type="text" id="fullname"
                                                           class="form-control form-control-sm" name="fullname"
                                                           value="">
                                                    <label for="fullname">Họ và tên</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div id="date-picker-example"
                                                     class="md-form mb-0 input-with-post-icon datepicker">
                                                    <input type="text" id="birthday"
                                                           class="form-control form-control-sm" name="birthday"
                                                           value="">
                                                    <label for="birthday">Ngày sinh</label>
                                                    <i id="label-birthday" class="fas fa-calendar input-prefix"
                                                       style="font-size: .875rem"></i>
                                                </div>
                                            </div>

                                            <div class="col-lg-4">
                                                <div class="md-form form-sm mb-0">
                                                    <input type="text" id="phone" class="form-control form-control-sm"
                                                           name="phone" value="">
                                                    <label for="phone">SĐT</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6 col-md-10">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="province" id="province" class="custom-select">
                                                        <option value="" disabled>Chọn tỉnh thành</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 input-group  justify-content-around" role="group">
                                                <div class="col-6 col-md-3">
                                                    <!-- Material unchecked -->
                                                    <div class="form-check mt-4">
                                                        <input name="isMale" type="checkbox" class="form-check-input"
                                                               id="materialUnchecked" checked>
                                                        <label class="form-check-label"
                                                               for="materialUnchecked">Nam</label>
                                                    </div>
                                                </div>
                                                <!-- Grid column -->
                                                <!-- Grid column -->
                                                <div class="col-6 col-md-3">
                                                    <!-- Material indeterminate -->
                                                    <div class="form-check mt-4">
                                                        <input name="isFemale" type="checkbox" class="form-check-input"
                                                               id="materialIndeterminate2"
                                                        >
                                                        <label class="form-check-label"
                                                               for="materialIndeterminate2">Nữ</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-10">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="district" id="district" class="custom-select">
                                                        <option value="" disabled>Chọn quận</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-10">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="ward" id="ward" class="custom-select">
                                                        <option value="" disabled>Chọn phường/xã</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 col-md-12 d-flex justify-content-between m-auto p-0">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="status" id="status"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Trạng thái</option>
                                                            <option value="0">Chưa kích hoạt</option>
                                                            <option value="1">Kích hoạt</option>
                                                            <option value="2">Khóa</option>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-lg-6 col-md-6">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="role" id="role"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Chọn phân quyền</option>
                                                            <option value="0">Người dùng thường</option>
                                                            <option value="1">Admin</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Grid row -->
                                    <!-- Grid row -->
                                </div>
                                <!-- Card content -->
                            </div>
                            <!-- Card -->

                        </div>
                    </div>
                </form>
            </main>
        </div>
    </div>
    </form>
</div>
<!--/. Sidebar navigation -->
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/api/province',
            type: 'GET',
            success: function (result) {
                result = JSON.parse(result)
                console.log(result)
                for (let i of result) {
                    $('#province').append('<option value="' + i.id + '">' + i.fullName + '</option>')
                }
            },
            error: function (error) {
                console.log("error")
                console.log(error);
            }
        })
    })
</script>
<script>
    // Fetch districts when province is selected
    $('#province').change(function() {
        var provinceId = $(this).val();
        if (provinceId) {
            $.ajax({
                url: '/api/district/' + provinceId,
                type: 'GET',
                success: function(result) {
                    result = JSON.parse(result);
                    for (let district of result) {
                        $('#district').append('<option value="' + district.id + '">' + district.fullName + '</option>');
                    }
                },
                error: function(error) {
                    console.log("Error fetching districts");
                    console.log(error);
                }
            });
        } else {
            $('#ward').empty().append('<option value="" disabled>Chọn phường/xã</option>');
        }
    });
</script>
<script>
    // Fetch wards when district is selected
    $('#district').change(function() {
        var districtId = $(this).val();
        if (districtId) {
            $.ajax({
                url: '/api/ward/' + districtId,
                type: 'GET',
                success: function(result) {
                    result = JSON.parse(result);
                    for (let ward of result) {
                        $('#ward').append('<option value="' + ward.id + '">' + ward.fullName + '</option>');
                    }
                },
                error: function(error) {
                    console.log("Error fetching wards");
                    console.log(error);
                }
            });
        } else {
            $('#ward').empty().append('<option value="" disabled>Chọn phường/xã</option>');
        }
    });

</script>

<script>
    // fetchdata of user by email, input is email get from url of browser
    $(document).ready(function () {
        var userEmail = getUrlParameter('useremail');

        if (userEmail) {
            $.ajax({
                url: '/api/admin/user/edit',
                type: 'GET',
                data: {
                    useremail: userEmail
                },
                success: function (result) {
                    // console.log(result);
                    console.log(result.address);
                    $('#email').val(result.email);
                    $('#email').next('label').addClass('active');
                    $('#fullname').val(result.fullName);
                    $('#fullname').next('label').addClass('active');
                    $('#birthday').val(result.birthday);
                    $('#birthday').next('label').addClass('active');
                    $('#phone').val(result.phone);
                    $('#phone').next('label').addClass('active');
                    // fetch province, district, ward from address of user
                    if (result.address){
                        $('#province').val(result.address.provinceId);
                        $('#district').val(result.address.districtId);
                        $('#ward').val(result.address.wardId);
                    }
                    $('#status').val(result.status);
                    $('#role').val(result.role);
                    if (result.gender === 1) {
                        $('#materialUnchecked').prop('checked', true);
                    } else {
                        $('#materialIndeterminate2').prop('checked', true);
                    }
                },
                error: function (error) {
                    console.log("Error fetching user data");
                    console.log(error);
                }
            });
        } else {
            console.log("User email not found in URL parameters");
        }
    });

    function getUrlParameter(name) {
        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
        var results = regex.exec(location.search);
        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
    }
</script>
<script>
    $('#materialUnchecked').change(() => {
        if ($('#materialIndeterminate2').is(':checked')) {
            $('#materialIndeterminate2').prop('checked', false);
        }
    });
    $('#materialIndeterminate2').change(() => {
        if ($('#materialUnchecked').is(':checked')) {
            $('#materialUnchecked').prop('checked', false);
        }
    });
</script>
<script>
    $('#save').click(function () {
        $.ajax({
            url: "/api/admin/user",
            type: "POST",
            dataType: "json",
            data: {
                // oldEmail is email of user before edit
                oldEmail: getUrlParameter('useremail'),
                action: "edit",
                email: $('#form8').val(),
                // if password is empty, don't send password to server and keep the old password
                password: $('#form9').val() === "" ? null : $('#form9').val(),
                fullname: $('#form12').val(),
                birthday: $('#birthday').val(),
                phone: $('#form4').val(),
                // provinceId: $('#province').val(),
                isMale: $('#materialUnchecked').is(':checked'),
                isFemale: $('#materialIndeterminate2').is(':checked'),
                status: $('#status').val(),
                role: $('#role').val(),
            },
            success: function (data) {
                console.log(data);
                if (data.name === "sys") {
                    delayNotify(2000, data.message)
                } else {
                    delayNotify(2000, data.message)
                    setTimeout(() => {
                        window.location.href = data.data;
                    }, 3000);
                }
            },
            error: function (data) {
                console.log(err)
                var err = JSON.parse(data.responseText);
                console.log(err)
                for (let e of err) {
                    console.log(e.name, e.message);
                    fetchErr(e.name, e.message);
                }
            }
        })
    });
</script>
<%--<script>--%>
<%--    function fetchErr(name, mess) {--%>
<%--        switch (name) {--%>
<%--            case "email":--%>
<%--                let email = document.getElementById('form8');--%>
<%--                email.classList.add('border-danger');--%>
<%--                email.classList.add('text-danger');--%>
<%--                email.value = "";--%>
<%--                email.nextElementSibling.classList.add('active');--%>
<%--                email.setAttribute('value', " ");--%>
<%--                // email.setAttribute('placeholder', mess);--%>
<%--                console.log("run 1")--%>
<%--                break;--%>
<%--            case "password":--%>
<%--                let password = document.getElementById('form9');--%>
<%--                password.classList.add('border-danger');--%>
<%--                password.classList.add('text-danger');--%>
<%--                password.value = "";--%>
<%--                password.nextElementSibling.classList.add('active');--%>
<%--                // password.setAttribute('placeholder', mess);--%>
<%--                console.log("run 2");--%>
<%--                break;--%>
<%--            case "fullName":--%>
<%--                let fullname = document.getElementById('form12');--%>
<%--                fullname.classList.add('border-danger');--%>
<%--                fullname.classList.add('text-danger');--%>
<%--                fullname.value = "";--%>
<%--                fullname.nextElementSibling.classList.add('active');--%>
<%--                console.log(fullname.nextElementSibling);--%>
<%--                // fullname.setAttribute('placeholder', mess);--%>
<%--                console.log("run 3");--%>
<%--                break;--%>
<%--            case "phone":--%>
<%--                let phone = document.getElementById('form4');--%>
<%--                phone.classList.add('border-danger');--%>
<%--                phone.classList.add('text-danger');--%>
<%--                phone.value = "";--%>
<%--                phone.nextElementSibling.classList.add('active');--%>
<%--                // phone.setAttribute('placeholder', mess);--%>
<%--                console.log("run 4");--%>
<%--                break;--%>
<%--            case "birthday":--%>
<%--                let birthday = document.getElementById('birthday');--%>
<%--                birthday.classList.add('border-danger');--%>
<%--                birthday.classList.add('text-danger');--%>
<%--                birthday.value = "";--%>
<%--                birthday.nextElementSibling.classList.add('active');--%>
<%--                console.log(birthday.nextElementSibling);--%>
<%--                // birthday.setAttribute('placeholder', mess);--%>
<%--                console.log("run 5");--%>
<%--                break;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    &lt;%&ndash; email&ndash;%&gt;--%>
<%--    let email = document.getElementById('form8');--%>
<%--    if (${emailErr!=null}) {--%>
<%--        email.classList.add('border-danger');--%>
<%--        email.classList.add('text-danger');--%>
<%--    }--%>
<%--    email.addEventListener('click', function () {--%>
<%--            email.classList.remove('border-danger');--%>
<%--            email.classList.remove('text-danger');--%>
<%--            email.attributes.removeNamedItem("placeholder");--%>
<%--            email.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("emailErr")}--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; password&ndash;%&gt;--%>
<%--    let password = document.getElementById('form9');--%>
<%--    if (${passwordErr!=null}) {--%>
<%--        password.classList.add('border-danger');--%>
<%--        password.classList.add('text-danger');--%>
<%--    }--%>
<%--    password.addEventListener('click', function () {--%>
<%--            password.classList.remove('border-danger');--%>
<%--            password.classList.remove('text-danger');--%>
<%--            password.attributes.removeNamedItem("placeholder");--%>
<%--            password.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("passwordErr")}--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; fullname&ndash;%&gt;--%>
<%--    let fullname = document.getElementById('form12');--%>
<%--    if (${fullnameErr!=null}) {--%>
<%--        fullname.classList.add('border-danger');--%>
<%--        fullname.classList.add('text-danger');--%>
<%--    }--%>
<%--    fullname.addEventListener('click', function () {--%>
<%--            fullname.classList.remove('border-danger');--%>
<%--            fullname.classList.remove('text-danger');--%>
<%--            fullname.attributes.removeNamedItem("placeholder");--%>
<%--            fullname.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("fullnameErr")}--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; phone&ndash;%&gt;--%>
<%--    let phone = document.getElementById('form4');--%>
<%--    if (${phoneErr!=null}) {--%>
<%--        phone.classList.add('border-danger');--%>
<%--        phone.classList.add('text-danger');--%>
<%--    }--%>

<%--    phone.addEventListener('click', function () {--%>
<%--            phone.classList.remove('border-danger');--%>
<%--            phone.classList.remove('text-danger');--%>
<%--            phone.attributes.removeNamedItem("placeholder");--%>
<%--            phone.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("phoneErr")}--%>
<%--        }--%>
<%--    )--%>
<%--    &lt;%&ndash; birthday&ndash;%&gt;--%>
<%--    let birthday = document.getElementById('birthday');--%>
<%--    let label = document.getElementById('label-birthday');--%>
<%--    if (${birthdayErr!=null}) {--%>
<%--        birthday.classList.add('border-danger');--%>
<%--        birthday.classList.add('text-danger');--%>
<%--    }--%>
<%--    label.addEventListener('click', function () {--%>
<%--            birthday.classList.remove('border-danger');--%>
<%--            birthday.classList.remove('text-danger');--%>
<%--            birthday.attributes.removeNamedItem("placeholder");--%>
<%--            birthday.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("birthdayErr")}--%>
<%--        }--%>
<%--    )--%>
<%--    birthday.addEventListener('click', function () {--%>
<%--            birthday.classList.remove('border-danger');--%>
<%--            birthday.classList.remove('text-danger');--%>
<%--            birthday.attributes.removeNamedItem("placeholder");--%>
<%--            birthday.attributes.removeNamedItem("value");--%>
<%--            ${requestScope.remove("birthdayErr")}--%>
<%--        }--%>
<%--    )--%>
<%--</script>--%>
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
        format: 'dd-mm-yyyy',
    });
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
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
</body>
</html>
