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
                                        <!-- Grid row -->
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                    <input type="email" id="form8"
                                                           class="form-control form-control-sm" name="email"
                                                           value="${user.email}">
                                                    <label for="form8" class="">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                    <c:if test="${passwordErr != null}">
                                                        <input type="password" id="form9"
                                                               class="form-control form-control-sm" name="password"
                                                               value="" placeholder="${passwordErr}">
                                                    </c:if>
                                                    <c:if test="${passwordErr == null}">
                                                        <input type="password" id="form9"
                                                               class="form-control form-control-sm" name="password"
                                                               value="${passwordValue}">
                                                    </c:if>
                                                    <label for="form9" class="">Password</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row d-flex align-items-center">
                                            <!-- Grid column -->
                                            <div class="col-lg-4">
                                                <%--                                                <div class="md-form form-sm mb-0">--%>
                                                <%--                                                    <c:if test="${fullnameErr!=null}">--%>
                                                <%--                                                        <input type="text" id="form12"--%>
                                                <%--                                                               class="form-control form-control-sm" name="fullname"--%>
                                                <%--                                                               value="" placeholder="${fullnameErr}">--%>
                                                <%--                                                    </c:if>--%>
                                                <%--                                                    <c:if test="${fullnameErr==null}">--%>
                                                <%--                                                        <input type="text" id="form12"--%>
                                                <%--                                                               class="form-control form-control-sm" name="fullname">--%>
                                                <%--                                                    </c:if>--%>
                                                <%--                                                    <label for="form12" class="">Họ và tên</label>--%>
                                                <%--                                                </div>--%>

                                                <div class="md-form form-sm mb-0">
                                                    <c:if test="${fullnameErr != null}">
                                                        <input type="text" id="form12"
                                                               class="form-control form-control-sm" name="fullname"
                                                               value="" placeholder="${fullnameErr}">
                                                    </c:if>
                                                    <c:if test="${fulnameErr == null}">
                                                        <input type="text" id="form12"
                                                               class="form-control form-control-sm" name="fullname"
                                                               value="${user.fullName}">
                                                    </c:if>
                                                    <label for="form12" class="">Họ và tên</label>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-4">
                                                <div id="date-picker-example"
                                                     class="md-form mb-0 input-with-post-icon datepicker"
                                                     style="outline: none" inline="true">
                                                    <c:if test="${birthdayErr != null}">
                                                        <input placeholder="${birthdayErr}" type="text" id="birthday"
                                                               value="" class="form-control form-control-sm"
                                                               name="birthday">
                                                    </c:if>
                                                    <c:if test="${birthdayErr == null}">
                                                        <input type="text" id="birthday"
                                                               class="form-control form-control-sm" name="birthday"
                                                               value="${user.birthday}">
                                                    </c:if>
                                                    <label for="birthday" class="">Ngày sinh</label>
                                                    <i id="label-birthday" class="fas fa-calendar input-prefix"
                                                       style="font-size: .875rem"></i>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-4">

                                                <div class="md-form form-sm mb-0">
                                                    <c:if test="${phoneErr != null}">
                                                        <input type="text" id="form4"
                                                               class="form-control form-control-sm" name="phone"
                                                               value="" placeholder="${phoneErr}">
                                                    </c:if>
                                                    <c:if test="${phoneErr == null}">
                                                        <input type="text" id="form4"
                                                               class="form-control form-control-sm" name="phone"
                                                               value="${user.phone}">
                                                    </c:if>
                                                    <label for="form4" class="">SĐT</label>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                        </div>
                                        <div class="row">
                                            <!-- Grid column -->
                                            <div class="col-lg-6 col-md-10">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="province" id="province" class=" custom-select ">
                                                        <option value="" disabled>Chọn tỉnh thành</option>
                                                        <c:forEach var="item" items="${sessionScope.get('provinces')}">
                                                            <option value="${item.id}"
                                                                    <c:if test="${user.province==item.name}">selected</c:if> >${item.name}</option>
                                                        </c:forEach>

                                                    </select>

                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->

                                            <div class="col-lg-6 input-group  justify-content-around" role="group">
                                                <div class="col-6 col-md-3">
                                                    <!-- Material unchecked -->
                                                    <div class="form-check mt-4">
                                                        <input name="isMale" type="checkbox" class="form-check-input"
                                                               id="materialUnchecked"
                                                               <c:if test="${user.gender==1}">checked </c:if> >
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
                                                               <c:if test="${user.gender==0}">checked </c:if>>
                                                        <label class="form-check-label"
                                                               for="materialIndeterminate2">Nữ</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-12 col-md-12 d-flex justify-content-between m-auto p-0">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="status"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Trạng thái</option>
                                                            <option value="0"<c:if
                                                                    test="${user.status==0}"> selected</c:if>Chưa kích
                                                                    hoạt
                                                            </option>
                                                            <option value="1" <c:if
                                                                    test="${user.status==1}"> selected</c:if>>Kích hoạt
                                                            </option>
                                                            <option value="2" <c:if
                                                                    test="${user.status==2}"> selected</c:if>>Khóa
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="role" class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Chọn phân quyền</option>
                                                            <option value="0" <c:if
                                                                    test="${user.role==1}"> selected</c:if>selected>
                                                                Người dùng thường
                                                            </option>
                                                            <option value="1" <c:if
                                                                    test="${user.role==2}"> selected</c:if>>Admin
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <!-- Grid column -->
                                            </div>
                                        </div>
                                        <!-- Grid row -->
                                        <!-- Grid row -->
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
                oldEmail: '${user.email}',
                action: "edit",
                email: $('#form8').val(),
                password: $('#form9').val(),
                fullname: $('#form12').val(),
                birthday: $('#birthday').val(),
                phone: $('#form4').val(),
                provinceId: $('#province').val(),
                isMale: $('#materialUnchecked').val(),
                isFemale: $('#materialIndeterminate2').val(),
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
<script>
    function fetchErr(name, mess) {
        switch (name) {
            case "email":
                let email = document.getElementById('form8');
                email.classList.add('border-danger');
                email.classList.add('text-danger');
                email.value = "";
                email.nextElementSibling.classList.add('active');
                email.setAttribute('value', " ");
                // email.setAttribute('placeholder', mess);
                console.log("run 1")
                break;
            case "password":
                let password = document.getElementById('form9');
                password.classList.add('border-danger');
                password.classList.add('text-danger');
                password.value = "";
                password.nextElementSibling.classList.add('active');
                // password.setAttribute('placeholder', mess);
                console.log("run 2");
                break;
            case "fullName":
                let fullname = document.getElementById('form12');
                fullname.classList.add('border-danger');
                fullname.classList.add('text-danger');
                fullname.value = "";
                fullname.nextElementSibling.classList.add('active');
                console.log(fullname.nextElementSibling);
                // fullname.setAttribute('placeholder', mess);
                console.log("run 3");
                break;
            case "phone":
                let phone = document.getElementById('form4');
                phone.classList.add('border-danger');
                phone.classList.add('text-danger');
                phone.value = "";
                phone.nextElementSibling.classList.add('active');
                // phone.setAttribute('placeholder', mess);
                console.log("run 4");
                break;
            case "birthday":
                let birthday = document.getElementById('birthday');
                birthday.classList.add('border-danger');
                birthday.classList.add('text-danger');
                birthday.value = "";
                birthday.nextElementSibling.classList.add('active');
                console.log(birthday.nextElementSibling);
                // birthday.setAttribute('placeholder', mess);
                console.log("run 5");
                break;
        }
    }
</script>
<script>
    <%-- email--%>
    let email = document.getElementById('form8');
    if (${emailErr!=null}) {
        email.classList.add('border-danger');
        email.classList.add('text-danger');
    }
    email.addEventListener('click', function () {
            email.classList.remove('border-danger');
            email.classList.remove('text-danger');
            email.attributes.removeNamedItem("placeholder");
            email.attributes.removeNamedItem("value");
            ${requestScope.remove("emailErr")}
        }
    )
    <%-- password--%>
    let password = document.getElementById('form9');
    if (${passwordErr!=null}) {
        password.classList.add('border-danger');
        password.classList.add('text-danger');
    }
    password.addEventListener('click', function () {
            password.classList.remove('border-danger');
            password.classList.remove('text-danger');
            password.attributes.removeNamedItem("placeholder");
            password.attributes.removeNamedItem("value");
            ${requestScope.remove("passwordErr")}
        }
    )
    <%-- fullname--%>
    let fullname = document.getElementById('form12');
    if (${fullnameErr!=null}) {
        fullname.classList.add('border-danger');
        fullname.classList.add('text-danger');
    }
    fullname.addEventListener('click', function () {
            fullname.classList.remove('border-danger');
            fullname.classList.remove('text-danger');
            fullname.attributes.removeNamedItem("placeholder");
            fullname.attributes.removeNamedItem("value");
            ${requestScope.remove("fullnameErr")}
        }
    )
    <%-- phone--%>
    let phone = document.getElementById('form4');
    if (${phoneErr!=null}) {
        phone.classList.add('border-danger');
        phone.classList.add('text-danger');
    }

    phone.addEventListener('click', function () {
            phone.classList.remove('border-danger');
            phone.classList.remove('text-danger');
            phone.attributes.removeNamedItem("placeholder");
            phone.attributes.removeNamedItem("value");
            ${requestScope.remove("phoneErr")}
        }
    )
    <%-- birthday--%>
    let birthday = document.getElementById('birthday');
    let label = document.getElementById('label-birthday');
    if (${birthdayErr!=null}) {
        birthday.classList.add('border-danger');
        birthday.classList.add('text-danger');
    }
    label.addEventListener('click', function () {
            birthday.classList.remove('border-danger');
            birthday.classList.remove('text-danger');
            birthday.attributes.removeNamedItem("placeholder");
            birthday.attributes.removeNamedItem("value");
            ${requestScope.remove("birthdayErr")}
        }
    )
    birthday.addEventListener('click', function () {
            birthday.classList.remove('border-danger');
            birthday.classList.remove('text-danger');
            birthday.attributes.removeNamedItem("placeholder");
            birthday.attributes.removeNamedItem("value");
            ${requestScope.remove("birthdayErr")}
        }
    )
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
