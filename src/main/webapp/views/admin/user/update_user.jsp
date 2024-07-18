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
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb p-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text"
                                                   href="/admin/dashboard">Thống
                        kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/user_management">QL
                        người dùng</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa người dùng</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3" style="height: fit-content!important;">
                <form id="form-update-user">
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Đăng kí người dùng</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center p-0">
                            <div class="btn-save flex-center">
                                <button type="submit" class="btn btn-warning p-2 waves-effect waves-light"
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
                                        <span id="input">
                                            <input type="hidden" id="id" name="id">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0 param-content">
                                                        <input type="text" id="email"
                                                               class="form-control form-control-sm" name="email"
                                                        >
                                                    <label for="email" class="">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0 param-content">
                                                        <input type="password" id="password"
                                                               class="form-control form-control-sm" name="password">
                                                    <label for="password" class="">Password</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <!-- Grid column -->
                                            <div class="col-lg-4 param-content">
                                                <div class="md-form form-sm mb-0">
                                                        <input type="text" id="fullName"
                                                               class="form-control form-control-sm" name="fullName">
                                                    <label for="fullName" class="">Họ và tên</label>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-4 param-content">
                                                <div id="date-picker-example"
                                                     class="md-form mb-0 input-with-post-icon datepicker"
                                                     style="outline: none" inline="true">
                                                        <input type="text" id="birthday"
                                                               class="form-control form-control-sm" name="birthday">
                                                    <label for="birthday" class="">Ngày sinh</label>
                                                    <i id="label-birthday" class="fas fa-calendar input-prefix"
                                                       style="font-size: .875rem"></i>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-4 param-content">
                                                <div class="md-form form-sm mb-0">
                                                        <input type="text" id="form4"
                                                               class="form-control form-control-sm" name="phone">
                                                    <label for="form4" class="disabled">SĐT</label>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                        </div></span>
                                        <div class="row">
                                            <!-- Grid column -->
                                            <div class="col-lg-6 col-md-10 param-content">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="province" id="province" class=" custom-select ">
                                                        <option value="" disabled>Chọn tỉnh thành</option>
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 input-group  justify-content-around param-content"
                                                 role="group">
                                                <div class="col-6 col-md-3">
                                                    <!-- Material unchecked -->
                                                    <div class="form-check mt-4">
                                                        <input name="gender" type="checkbox" class="form-check-input"
                                                               id="materialUnchecked" checked value=1>
                                                        <label class="form-check-label"
                                                               for="materialUnchecked">Nam</label>
                                                    </div>
                                                </div>
                                                <!-- Grid column -->
                                                <!-- Grid column -->
                                                <div class="col-6 col-md-3">
                                                    <!-- Material indeterminate -->
                                                    <div class="form-check mt-4">
                                                        <input name="gender" type="checkbox" class="form-check-input"
                                                               id="materialIndeterminate2" value=0
                                                        >
                                                        <label class="form-check-label"
                                                               for="materialIndeterminate2">Nữ</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-10 param-content">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="district" id="district" class=" custom-select ">
                                                        <option value="" disabled selected>Chọn quận</option>
                                                    </select>

                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-10 param-content">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="ward" id="ward" class=" custom-select ">
                                                        <option value="" disabled selected>Chọn phường/xã</option>

                                                    </select>

                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 d-flex justify-content-between m-auto p-0">
                                                <div class="col-lg-6 col-md-6 param-content">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="status" id="status"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Trạng thái</option>
                                                            <option value="0" selected>Chưa kích hoạt</option>
                                                            <option value="1">Kích hoạt</option>
                                                            <option value="2">Khóa</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 param-content">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="role" id="role"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Chọn phân quyền</option>
                                                            <option value="0" selected>Người dùng thường</option>
                                                            <option value="1">
                                                                <Ad></Ad>
                                                                admin
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
<script src="<c:url value="/template/js/dataAddress.js"/>"></script>
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script>
    $(document).ready(function () {
        // fetchdata of user by email, input is email get from url of browser
        const url = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
        $.ajax({
            url: '/api/admin/user/edit/' + url,
            type: 'GET',
            data: {},
            dataType: 'json',
            success: function (result) {

                if (result.status === 200) {
                    $('#id').val(result.data.id)
                    $('#email').val(result.data.email).change();
                    $('#fullName').val(result.data.fullName).change();
                    $('#birthday').val(result.data.birthday).change();
                    $('#form4').val(result.data.phone).change();
                    // fetch province, district, ward from address of user
                    if (result.data.address) {
                        $("#province").val(result.data.address.provinceId);
                        updateDistricts(result.data.address.provinceId).then(() => {
                            $("#district").val(result.data.address.districtId);
                            updateWard(result.data.address.districtId).then(() => {
                                $("#ward").val(result.data.address.wardId);
                            })
                        });
                    }
                    $('#status').val(result.data.status);
                    $('#role').val(result.data.role);
                } else {
                    errorAlert(result.message)
                }
            },
            error: function (error) {
                console.log("Error fetching user data");
                console.log(error);
            }
        });
    });

</script>
<script>
    validate("#form-update-user", adminUpdateUserValidator, function (form) {
        console.log($(form).serializeArray());
        const url = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
        $.ajax({
            url: '/api/admin/user/edit/' + url,
            type: 'POST',
            data: $(form).serializeArray(),
            dataType: 'json',
            success: function (result) {
                if (result.status === 200) {
                    successAlert(result.messages);
                    setTimeout(() => {
                        window.location.href = '/admin/user_management';
                    }, 2000);
                } else {
                    console.log(result.messages)
                }
            },
            error: function (error) {
                console.log("Error fetching user data");
                console.log(error);
            }
        });
    })

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
    }).on('change', function (ev) {
        $('#birthday').blur();
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
