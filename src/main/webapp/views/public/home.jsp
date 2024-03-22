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

    <div class="container carousel-inner w-100">
        <c:forEach items="${sliders}" var="slide" varStatus="loop">
            <div class="carousel-item  <c:if test="${loop.index== 0}">active</c:if> w-100">
                    <%--            <img class="d-block w-100 " src="../../../../RealEstateWeb/public/img/slide/slide-nha-xinh-1-4581.png"--%>
                <img class="d-block w-100 " src="${slide.avatar}"
                     alt="${slide.title}">
            </div>
        </c:forEach>

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
                <ul class="category-menu d-flex align-items-center justify-content-center md-pills">
                    <c:forEach var="category" items="${categories}">
                        <li class="category-item">
                            <button class="item-selector "
                                    role="tab" onclick="getProject(${category.id})"
                                    title="${category.name}">
                                XÂY DỰNG ${category.name}
                            </button>
                        </li>
                    </c:forEach>
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
    <div id="modal"></div>
    <div class="slide-container swiper">
        <div class="slide-content" id="catch">
            <h4 class="title mb-3 text-uppercase">dịch vụ THI CÔNG</h4>
            <div class="card-wrapper swiper-wrapper">
                <c:forEach var="service" items="${services}" varStatus="loop">
                    <a href="/post/service?id=${service.id}" class="card-home swiper-slide">
                            <%--                    <!--start image-->--%>
                        <div class="image-content">
                            <div class="card-image ">
                                <div href="postService.jsp"
                                     class="img-container  ">
                                    <div class="img-wrapper hover-image">
                                        <img src="${service.avatar}"
                                             alt=""
                                             class="card-img  ">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--                    <!-- start image title-->--%>
                        <div class="card-content">
                            <h4 class="text-uppercase">${service.name}</h4>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <div class="swiper-pagination"></div>
        </div>
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
                    <form class="card" action="" method="post">
                        <div class="card-body">
                            <!--Header-->
                            <!--Body-->
                            <div class="md-form">
                                <i class="fas fa-user prefix grey-text"></i>
                                <input type="text" id="fullName" class="form-control">
                                <label for="fullName">Họ và tên</label>
                            </div>
                            <div class="md-form">
                                <i class="fas fa-envelope prefix grey-text"></i>
                                <input type="text" id="email" class="form-control">
                                <label for="email">Địa chỉ email</label>
                            </div>
                            <div class="md-form">
                                <i class="fa-solid fa-map-location prefix grey-text"></i>
                                <input type="text" id="address" class="form-control">
                                <label for="address">Địa chỉ(tỉnh/thành phố)</label>
                            </div>
                            <div class="md-form">
                                <i class="fa-solid  fa-phone prefix grey-text"></i>
                                <input type="text" id="phone" class="form-control">
                                <label for="phone">Số điện thoại</label>
                            </div>
<%--                            <div class="row">--%>
<%--                                <div class=" black-brown-text font-weight-bold text-uppercase text-lg-center col-6 flex-center">--%>
<%--                                    <!--                            <label>Chủ đề</label>-->--%>
<%--                                    <select id="categoryId" class="browser-default custom-select mb-4">--%>
<%--                                        <option value="" disabled="">Loại dự án</option>--%>
<%--                                        <c:forEach var="category" items="${categories}">--%>
<%--                                            <option value="${category.id}">${category.name}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="form-outline col-6">--%>
<%--                                    <input type="text" id="projectId" class="form-control" placeholder="Mã dự án">--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <!-- Message -->
                            <div class="form-group">
                                <textarea class="form-control rounded-0" id="content" rows="3"
                                          placeholder="Lời nhắn" style="height: 250px"></textarea>
                            </div>
                            <div class="text-center mt-4">
                                <button class="btn btn-red waves-effect waves-light" onclick="saveContact()"
                                        type="button">Gửi ngay
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
                    <!--Buttons-->

                </div>
            </div>
        </section>
        <!--Section: Contact v.1-->
    </div>
    <!--    end main contact-->
</section>


<%@include file="/layout/public/footer.jsp" %><script src="<c:url value="/template/js/swiper-bundle.min.js"/>"></script>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>

<script src="<c:url value='/template/js/home.js'/>"></script>
<script>
    function saveContact() {
        $.ajax({
            url: '/api/contact/save',
            type: 'Post',
            dataType: 'json',
            data: {
                fullName: $('#fullName').val(),
                email: $('#email').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                content: $('#content').val(),
            },
            success: function (data) {
                // let resp = JSON.parse(data);
                // if (resp.status === 200) {
                //     alert(resp.message);
                //     window.location.reload();
                // } else {
                //     alert(resp.message);
                // }
                delayNotify(1000, data.message);
                if(data.name == 'success'){
                    setTimeout(()=>{
                        window.location.reload();
                    },1000);
                }
            },
            error: function (data) {
                //bắt lỗi email
                console.log(data);
                var e = JSON.parse(data.responseText);
                console.log(e.name, e.message)
                fetchErr(e.name, e.message);
            }

        })
    }
</script>
<script>
    getProject(${categories[0].id});

    function getProject(id) {
        // event.preventDefault();

        $.ajax({
            url: '/api/home/projects',
            type: 'Post',
            // dataType: 'json',
            data: {id: id},
            success: function (data) {
                resdata= JSON.parse(data)
                let list = JSON.parse(resdata.data);
                let containter = document.getElementById('project-container');
                let project = "";
                containter.innerHTML = "";
                for (const x of list) {
                    project += '<div' +
                        ' class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">'
                        + '<div'
                        + ' class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">';
                    if (x.isSave) project += ' <i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'
                    else project += '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>';
                    project += '<a href="/post/project?id=' + x.id + '">'
                        + '<img src="' + x.avatar + '"'
                        + ' class="w-100">'
                        + ' <input type="hidden" class="project-id" value=' + x.id + '>'
                        + ' <div class="w-100 position-absolute projectCard-content">'
                        + '  <div class="mask justify-content-center d-flex h-100"'
                        + ' style="background-color: rgba(48, 48, 48, 0.72);">'
                        + '<div class="align-items-center flex-column d-flex w-100"><h6'
                        + ' class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">'
                        + x.title + '</h6>'
                        + '<p class="text-white p-0 id-project">'
                        + '<strong>MDA:' + x.id + '</strong>'
                        + '</p>'
                        + '<p class="text-white p-4 vanBan">'+x.description+'</p>'
                        + '</div>'
                        + '</div></div></a></div></div>'
                }
                containter.innerHTML = project;
                // console.log(project);
            },
            error: function (data) {
                console.log(data);
            }
        })
        setTimeout(()=>{gioiHanChuVaThemDauCham('vanBan', gioiHanSoChu)},200);
    }
</script>
<script>
    function like(project) {
        let id = $(project).parent().find('.project-id').val();
        console.log(id);
        $.ajax({
            url: "/api/save_project",
            type: "GET",
            data: {
                "projectId": id
            },
            success: function (response) {
                console.log(response);
                let resp = JSON.parse(response);
                if (resp.name == 'save') {
                    project.classList.replace("fa-regular", "fa-solid")
                } else if (resp.name == 'delete')
                    project.classList.replace("fa-solid", "fa-regular")
                //= "fa-solid fa-bookmark position-absolute";
                // console.log(p);
            },
            error: function (response) {
                console.log(response.responseText)
                let resp = JSON.parse(response.responseText);
                window.location.href = resp.data;
            }
        })
    }
</script>
<script>
    function fetchErr(name, mess){
        console.log(name, mess)
        switch (name) {
            case 'email':
                let email = document.getElementById('email');
                email.classList.add('border-danger');
                email.classList.add('text-danger');
                email.value = "";
                email.setAttribute('value', "");
                // email.setAttribute('placeholder', mess);
                break;
        }
    }
</script>
<script>
    let fullName = document.getElementById('email');
    fullName.addEventListener('click', function () {
        fullName.classList.remove('border-danger');
        fullName.classList.remove('text-danger');
        fullName.setAttribute('placeholder', "Email");
    })
</script>
<script>
    function gioiHanChuVaThemDauCham(className, gioiHan) {
        var elements = document.getElementsByClassName(className);

        if (!elements || elements.length === 0) {
            console.error("Không tìm thấy phần tử với class: " + className);
            return;
        }

        for (var i = 0; i < elements.length; i++) {
            var vanBan = elements[i].textContent;

            if (vanBan.length > gioiHan) {
                // Cắt đoạn văn bản và thêm dấu ba chấm
                var vanBanGioiHan = vanBan.slice(0, gioiHan) + '...' + ' xem thêm';
                elements[i].textContent = vanBanGioiHan;
            }
        }
    }

    // Sử dụng hàm
    var className = "vanBan"; // Class của thẻ p
    var gioiHanSoChu = 220;

    setTimeout(()=>{
        gioiHanChuVaThemDauCham(className, gioiHanSoChu);
    },400);
</script>
</body>
</html>