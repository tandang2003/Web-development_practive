<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/contact.css"/>" rel="stylesheet">
    <title>Liên hệ</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<!--start content-->
<!--        Start breadcrumb -->
<div class="container">
    <div id="section-1" class="bc-icons-2 container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white small" style="">
                <li class="breadcrumb-item">
                    <a class="black-text breadcrumb-size hover-red" href="/">
                        <i class="fas fa-home"></i>
                    </a>
                </li>
                <li>
                    <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                </li>
                <li class="breadcrumb-item active breadcrumb-size">
                    <a class="text-uppercase font-weight-bolder black-text" href="#">LIÊN HỆ</a>
                </li>
            </ol>
        </nav>
    </div>
</div>
<!--    end breadcrumb-->
<div id="card">
    <div>
        <h5 class="section-heading h1 pt-4 text-center bottom redbockdoor font-weight-bold">Gửi thư đến chúng
            tôi</h5>
    </div>
    <div class="bg-light">
        <div class="row d-flex flex-wrap container">
            <div class="item col-lg-6 col-md-12 col-sm-12 w-100">
                <img class="w-100"
                     src="https://cms.luatvietnam.vn/uploaded/Images/Original/2020/01/17/gia-nhan-cong-xay-dung_1701151934.jpg">
            </div>
            <div class="item col-lg-6 col-md-10 col-sm-12 w-100 container">
                <div>
                    <p class="text-uppercase text-center font-weight-bold p-lg-4">thông tin liên hệ</p>
                </div>
                <div class="bg-white listContent">
                    <ul class="align-content-lg-start p-0">
                        <li class="text-center">
                            <p class="font-weight-bold">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</p>
                            <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP HCM</p>
                            <p>Số Điện Thoại: 0935 671 886 </p>
                            <p>Email: xaydungnhaxinh72@gmail.com</p>
                            <p>Website: nhaxinh.asia</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--    end wraper contact-->
<div id="section-3" class="container">
    <div id="modal"></div>
    <!--Section: Contact v.1-->
    <section class="section pb-4 pt-5">
        <!--Section heading-->

        <!--Section description-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-5 mb-4">
                <!--Form with header-->
                <form class="card" id="form-contact">
                    <div class="card-body">
                        <!--Header-->
                        <!--Body-->
                        <div class="md-form param-content">
                            <i class="fas fa-user prefix grey-text"></i>
                            <input type="text" id="fullName" name="fullName" class="form-control">
                            <label for="fullName">Họ và tên</label>
                        </div>
                        <div class="md-form param-content">
                            <i class="fas fa-envelope prefix grey-text"></i>
                            <input type="text" id="email" name="email" class="form-control">
                            <label for="email">Địa chỉ email</label>
                        </div>
                        <div class="md-form param-content">
                            <i class="fa-solid  fa-phone prefix grey-text"></i>
                            <input type="text" id="phone" name="phone" class="form-control">
                            <label for="phone">Số điện thoại</label>
                        </div>
                        <div class="md-form param-content">
                            <i class="fas fa-map-location prefix grey-text"></i>
                            <select class="mdb-select md-form" name="province" id="province"
                                    searchable="Search here..">
                                <option disabled selected>Chọn tỉnh thành</option>
                            </select>
                            <input class="d-none" id="provinceValue" name="provinceValue">
                        </div>
                        <div class="md-form param-content">
                            <i class="fas fa-city prefix grey-text"></i>

                            <select class="mdb-select md-form" name="district" id="district"
                                    searchable="Search here..">
                                <option disabled selected>Quận / huyện</option>
                            </select>
                            <input class="d-none" id="districtValue" name="districtValue">
                        </div>
                        <div class="md-form param-content">
                            <i class="fas fa-house-chimney prefix grey-text"></i>
                            <select class="mdb-select md-form" name="ward" id="ward" searchable="Search here..">
                                <option disabled selected>Phường / xã</option>
                            </select>
                            <input class="d-none" id="wardValue" name="wardValue">
                        </div>


                        <!-- Message -->
                        <div class="md-form param-content form-group">
                                <textarea class="form-control rounded-0" id="content" name="content" rows="3"
                                          placeholder="Lời nhắn" style="height: 250px"></textarea>
                        </div>
                        <div class="text-center mt-4">
                            <button class="btn btn-red waves-effect waves-light"
                                    type="submit">Gửi ngay
                            </button>
                        </div>
                    </div>
                </form>

                <!--Form with header-->

            </div>

            <div class="col-lg-7 mb-4">

                <!--Google map-->
                <div id="map-container-google-11" class="z-depth-1-half map-container-6 h-100"
                     style="height: 453px">
                    <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4247.872564543886!2d106.79040908333542!3d10.870529759247004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1695713054142!5m2!1svi!2s"
                            width="200" height="150" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">

                    </iframe>
                </div>

                <br>
                <!--Buttons-->

            </div>
        </div>
    </section>
    <!--Section: Contact v.1-->
</div>
<!--    end main contact-->
<!--end content-->
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value='/template/js/contactForm.js'/>"></script>
<script src="<c:url value='/template/js/validation/contact.js'/>"></script>
<script src="<c:url value='/template/js/dataAddress.js'/>"></script>
<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();

        let validator = $("#form-contact").validate({
                ignore: [],
                rules: contactValidation.rulesContact,
                messages: contactValidation.messagesContact,
                errorElement: "div", // Thẻ HTML sẽ hiển thị thông báo lỗi
                errorPlacement: function (error, element) {
                    // Đặt vị trí hiển thị thông báo lỗi
                    error.addClass("invalid-feedback");
                    element.closest(".param-content").append(error);
                },
                highlight: function (element, errorClass, validClass) {
                    // Highlight lỗi

                    $(element).addClass(errorClass).removeClass(validClass);
                    $(element).closest(".param-content").addClass("has-error");
                },
                unhighlight: function (element, errorClass, validClass) {
                    // Xóa highlight khi hợp lệ
                    $(element).removeClass(errorClass).removeClass(validClass);
                    $("#" + element.id + "-error").remove();
                },
                submitHandler: function (form) {
                    $.ajax({
                        url: "/api/contact/save",
                        type: "POST",
                        dataType: "json",
                        data: $(form).serializeArray(),
                        success: function (data) {
                            console.log(data)
                            if (data.status == 200) {
                                autoCloseAlertWithFunction(data.message, 3000, "success", () => {
                                    window.location.reload();
                                })
                            } else {
                                errorAlert(data.message)
                            }
                        },
                        error: function (e) {
                            errorAlert()
                        }
                    })
                }

            })
        ;
    })


</script>

</body>
</html>