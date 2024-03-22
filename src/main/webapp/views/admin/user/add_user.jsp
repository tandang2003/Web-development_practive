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
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text"
                                                   href="/admin/dashboard">Thống
                        kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/user_management?action=manager">QL
                        người dùng</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Đăng kí người dùng</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3" style="height: fit-content!important;">
                <form action="/admin/user_management?action=add" method="post">
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Đăng kí người dùng</h3>
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
                                        <span id="input">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                        <input type="email" id="form8"
                                                               class="form-control form-control-sm" name="email"
                                                               value="">
                                                    <label for="form8" class="">Email</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <div class="md-form form-sm mb-0">
                                                        <input type="password" id="form9"
                                                               class="form-control form-control-sm" name="password">
                                                    <label for="form9" class="">Password</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <!-- Grid column -->
                                            <div class="col-lg-4">
                                                <div class="md-form form-sm mb-0">
                                                        <input type="text" id="form12"
                                                               class="form-control form-control-sm" name="fullname">
                                                    <label for="form12" class="">Họ và tên</label>
                                                </div>
                                            </div>
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-4">
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
                                            <div class="col-lg-4">
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
                                            <div class="col-lg-6 col-md-10">
                                                <div class="md-form form-sm mb-0">
                                                    <select name="province" id="province" class=" custom-select ">
                                                        <option value="" disabled>Chọn tỉnh thành</option>
                                                        <c:forEach var="item" varStatus="loop"
                                                                   items="${sessionScope.get('provinces')}">
                                                            <option value="${item.name}"<c:if
                                                                    test="${loop.index==1}"> selected</c:if>  >${item.name}</option>
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
                                                               id="materialUnchecked">
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
                                            <!-- Grid column -->
                                            <!-- Grid column -->
                                            <div class="col-lg-12 col-md-12 d-flex justify-content-between m-auto p-0">
                                                <div class="col-lg-6 col-md-6">
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
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="md-form form-sm mb-0">
                                                        <select name="role" id="role"
                                                                class="browser-default custom-select mb-4">
                                                            <option value="" disabled>Chọn phân quyền</option>
                                                            <option value="0" selected>Người dùng thường</option>
                                                            <option value="1"><Ad></Ad>min</option>
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
    $(document).ready(function () {
        $('#save').click(function () {
            $.ajax({
                url: "/api/admin/user",
                type: "POST",
                dataType: "json",
                data: {
                    action: "add",
                    email: $('#form8').val(),
                    password: $('#form9').val(),
                    fullname: $('#form12').val(),
                    birthday: $('#birthday').val(),
                    phone: $('#form4').val(),
                    province: $('#province').val(),
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
                        // window.location.href = "/admin/user_management?action=manage";
                    }
                },
                error: function (data) {
                    console.log(err)
                    var err = JSON.parse(data.responseText);

                    for (const e of err) {
                        console.log(e.name, e.message)
                        fetchErr(e.name, e.message);
                    }
                }
            })
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
                email.setAttribute('placeholder', mess);
                console.log("run 1")
                break;
            case "password":
                let password = document.getElementById('form9');
                password.classList.add('border-danger');
                password.classList.add('text-danger');
                password.value = "";
                password.nextElementSibling.classList.add('active');
                password.setAttribute('placeholder', mess);
                console.log("run 2");
                break;
            case "fullname":
                let fullname = document.getElementById('form12');
                fullname.classList.add('border-danger');
                fullname.classList.add('text-danger');
                fullname.value = "";
                fullname.nextElementSibling.classList.add('active');
                console.log(fullname.nextElementSibling);
                fullname.setAttribute('placeholder', mess);
                console.log("run 3");
                break;
            case "phone":
                let phone = document.getElementById('form4');
                phone.classList.add('border-danger');
                phone.classList.add('text-danger');
                phone.value = "";
                phone.nextElementSibling.classList.add('active');
                phone.setAttribute('placeholder', mess);
                console.log("run 4");
                break;
            case "birthday":
                let birthday = document.getElementById('birthday');
                birthday.classList.add('border-danger');
                birthday.classList.add('text-danger');
                birthday.value = "";
                birthday.nextElementSibling.classList.add('active');
                console.log(birthday.nextElementSibling);
                birthday.setAttribute('placeholder', mess);
                console.log("run 5");
                break;
        }
    }
</script>
<script>
    <%-- email--%>
    let email = document.getElementById('form8');
    email.addEventListener('click', function () {
            email.classList.remove('border-danger');
            email.classList.remove('text-danger');
            email.placeholder = "";
            // email.value;
        }
    )
    <%-- password--%>
    let password = document.getElementById('form9');
    password.addEventListener('click', function () {
            password.classList.remove('border-danger');
            password.classList.remove('text-danger');
            password.placeholder = "";
            // password.attributes.removeNamedItem("value");
        }
    )
    <%-- fullname--%>
    let fullname = document.getElementById('form12');
    fullname.addEventListener('click', function () {
            fullname.classList.remove('border-danger');
            fullname.classList.remove('text-danger');
            fullname.attributes.removeNamedItem("placeholder");
            fullname.attributes.removeNamedItem("value");
        }
    )
    <%-- phone--%>
    let phone = document.getElementById('form4');
    phone.addEventListener('click', function () {
            phone.classList.remove('border-danger');
            phone.classList.remove('text-danger');
            phone.attributes.removeNamedItem("placeholder");
            phone.attributes.removeNamedItem("value");
        }
    )
    <%-- birthday--%>
    let birthday = document.getElementById('birthday');
    let label = document.getElementById('label-birthday');
    label.addEventListener('click', function () {
            birthday.classList.remove('border-danger');
            birthday.classList.remove('text-danger');
        }
    )
    birthday.addEventListener('click', function () {
            birthday.classList.remove('border-danger');
            birthday.classList.remove('text-danger');
            birthday.attributes.removeNamedItem("placeholder");
            birthday.attributes.removeNamedItem("value");
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
