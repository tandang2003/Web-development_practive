<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/layout/public/link.jsp" %>
    <link rel="stylesheet" href="<c:url value="/template/css/swiper-bundle.min.css" />">
    <link rel="stylesheet" href="<c:url value="/template/css/home.css" />">
    <title>Trang chủ</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>

<!--start slide-->
<div id="carouselExampleControls" class="carousel slide mb-5" data-ride="carousel">

    <div class="container carousel-inner w-100" id="slide-container">
        <%--        <c:forEach items="${sliders}" var="slide" varStatus="loop">--%>
        <%--            <div class="carousel-item  <c:if test="${loop.index== 0}">active</c:if> w-100">--%>
        <%--                    &lt;%&ndash;            <img class="d-block w-100 " src="../../../../RealEstateWeb/public/img/slide/slide-nha-xinh-1-4581.png"&ndash;%&gt;--%>
        <%--                <img class="d-block w-100 " src="${slide.avatar}"--%>
        <%--                     alt="${slide.title}">--%>
        <%--            </div>--%>
        <%--        </c:forEach>--%>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--end slide-->

<!--start introdution-->
<div class="section-about justify-content-between">
    <div class="container">
        <div class="row" style="margin: 0">
            <div class="col-md-6 col-lg-6 about-description">
                <div class="box-name">
                    CONSTRUCTION
                </div>
                <div class="box-slogan font-weight-bold pb-4 border-bottom">
                    CÔNG TY TNHH XÂY DỰNG THƯƠNG MẠI ĐẦU TƯ
                    <span style="color: #E90808">NHÀ ĐẸP</span>
                </div>
                <div class="section-abouts__box-content">
                    <p style="">
                  <span class="text-justify" style="line-height:1.5;font-size:18px;word-spacing: 5px;color: #8D8D8D;">
                Chúng tôi là đơn vị chuyên thi công thiết kế xây dựng, trang trí nội ngoại thất công trình với nhiều năm kinh nghiệm trong
                      lĩnh vực thiết kế và thi công xây dựng các công trình dân dụng, nhà phố, thiết kế nội thất
                      shoowroom, spa,…. tại Tp. Hồ Chí Minh và các tỉnh lân cận trong khu vực miền Nam.</span>
                    </p>
                </div>
                <div class="box-btn d-flex align-items-center p-2 justify-content-center">
                    <a class="box-btn-left " href="/intro" title="XEM CHI TIẾT">
                        <%--                    <a class="box-btn-left " href="../../../../RealEstateWeb/resources/views/template/intro.html" title="XEM CHI TIẾT">--%>
                        XEM CHI TIẾT
                        <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
            </div>
            <div class="col-md-6 col-lg-6 about-image hover-image w-100">
                <img class="w-100 " src="/template/img/main-intro.png">
            </div>
        </div>
    </div>
</div>

<!--end introdution-->


<!--start project-->
<section class="home-project  ">
    <div class="container">
        <div class="col wrapper-project " id="HomeProjectCategory">
            <div class="title flex-center ">
                <h3 class="text-uppercase mb-4">Dự án tiêu biểu</h3>
            </div>
            <div class="project-category">
                <ul class="category-menu d-flex align-items-center justify-content-center md-pills"
                    id="category-container">
                </ul>
            </div>
            <main class="my-5 mt-0">
                <div class="container tab-content p-0">
                    <!--Section: Design Block-->
                    <section class="tab-pane show active">
                        <div class="row" id="project-container">

                        </div>
                    </section>
                    <!--Section: Design Block-->
                </div>
            </main>
        </div>
    </div>
</section>
<!-- end project -->
<!--start service-->
<section class="service container pl-0 pr-0">
    <div class="slide-container swiper">
        <div class="slide-content" id="catch">
            <h4 class="title mb-3 text-uppercase">dịch vụ THI CÔNG</h4>
            <div class="card-wrapper swiper-wrapper" id="services-container">

            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>

</section>
<!--end service-->
<!--    end wraper contact-->
<section id="section-3">
    <div class="container">
        <!--Section: Contact v.1-->
        <section class="section pb-4 pt-4">
            <!--Section heading-->
            <h4 class="title mt-2 mb-3 text-uppercase text-center" style="font-weight: 700">Liên hệ với chúng tôi</h4>
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
                <div class="col-lg-7 mb-3">
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
                </div>
            </div>
        </section>
    </div>
</section>


<%@include file="/layout/public/footer.jsp" %>
<script src="<c:url value="/template/js/swiper-bundle.min.js"/>"></script>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value='/template/js/home.js'/>"></script>
<script type="module" src="<c:url value='/template/js/services.js'/>"></script>
<script src="<c:url value='/template/js/ajax/saveProject.js'/>"></script>
<script src="<c:url value='/template/js/contactForm.js'/>"></script>
<script src="<c:url value='/template/js/validation/validateFunction.js'/>"></script>
<script src="<c:url value='/template/js/validation/validator.js'/>"></script>
<script src="<c:url value='/template/js/dataAddress.js'/>"></script>
<script type="module" src="<c:url value='/template/js/ajax/home.js'/>"></script>
<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();
        validate("#form-contact", contactValidation, function (form) {
            $.ajax({
                url: "/api/contact/save",
                type: "POST",
                dataType: "json",
                data: $(form).serializeArray(),
                success: function (data) {
                    if (data.status == 200) {
                        autoCloseAlertWithFunction(data.message, 3000, swal2Icon.SUCCESS, () => {
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
        })

    })
</script>
</body>
</html>