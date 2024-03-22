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
    <link href=" <c:url value="/template/css/projectPost.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/user-demoPost.css"/>" rel="stylesheet">
    <title>XEM TRƯỚC</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<div class="wrapper">
    <!--end Navigation-->

    <!--start content-->
    <section id="PostContent">
        <!--start breadcrumb-->

        <!--end breadcrumb-->
        <div class="container">
            <div>
                <div class="bc-icons-2">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-white small">
                            <li class="breadcrumb-item">
                                <a class="black-text breadcrumb-size" href="/">
                                    <i class="fa-solid fa-house"></i>
                                </a>
                            </li>
                            <li>
                                <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                            </li>
                            <li class="breadcrumb-item active breadcrumb-size">
                                <a class="black-text text-uppercase " href="#">Tài khoản cá nhân</a>
                            </li>
                            <li>
                                <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                            </li>
                            <li class="breadcrumb-item active breadcrumb-size">
                                <a class="black-text text-uppercase " href="#">Dự án của tôi</a>
                            </li>
                            <li>
                                <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                            </li>
                            <li class="breadcrumb-item active breadcrumb-size p-0">
                                <a class="black-text text-uppercase font-weight-bold" href="#">${project.title}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row">

                <div class="col-sm-12 col-md-9 col-lg-9 post-content">
                    <h6 class="text-center post-title text-uppercase m-0 " style="font-size: 18px"><span
                            style="border-bottom: 2px solid #E90808">Chế độ xem trước</span></h6>
                    <h1 class="text-center mb-3 mt-3 post-title text-uppercase">${project.title}</h1>
                    <div class="row">

                        <p class="font-italic col-lg-6 col-md-6 col-sm-12 m-0"><strong>Ngày đăng: ${project.updatedAt}; Mã
                            dự án:
                            ${project.id}</strong></p>
                        <%--                    Thiết kế, Sửa chữa--%>
                        <p class="font-italic col-lg-6 col-md-6 col-sm-12 m-0"><strong><span>Loại dự án: ${project.category};</span>
                            <span>Loại dịch vụ: <c:forEach items="${services}" var="service" varStatus="loop">
                                ${service.name}<c:if test="${not loop.last}">,</c:if>
                            </c:forEach> </span></strong></p>
                    </div>



                    <div class="gallery position-relative h-auto mb-3 ">
                        <c:forEach items="${gallery}" var="image">
                            <div class="img position-relative w-100 h-100 overflow-hidden ">
                                <img class="" src="${image}" alt="Image">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="post-content-text" style="max-width: 100%">
                        ${post.content}

                        <div class="company-address">
                            <h6 class="mt-2 mb-2">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</h6>
                            <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP. HCM</p>
                            <p>Hotline: 0935 671 886</p>
                            <p>Email: xaydungnhadep@gmail.com</p>
                            <p>Website: nhadep.asia</p></div>
                    </div>
                </div>

                <div class="col-sm-12 col-md-3 col-lg-3 recommend-box sticky-top" style="z-index: 1; top:70px">
                    <div class="wrapper-feature-news mt-3 mb-1 sticky-top">
                        <div class="feature-news-header">
                            <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                            </i>Hình ảnh dự án</p>

                        </div>
                        <div class="overflow-hidden position-relative projectCard-container">
                            <a class="bg-image position-relative hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block"
                               href="#"><img
                                    src="${project.avatar}"
                                    class="w-100">
                                <div class="w-100 position-absolute projectCard-content">
                                    <div class="mask justify-content-center d-flex h-100"
                                         style="background-color: rgba(48, 48, 48, 0.72);">
                                        <div class="align-items-center flex-column d-flex w-100"><h6
                                                class="text-white text-center pt-4 projectTitle-center text-uppercase">
                                            ${project.title}</h6>
                                            <p class="text-white p-0 id-project">
                                                <strong>MDA:${project.id}</strong></p>
                                            <p class="text-white p-4 text-break"> ${project.description}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="flex-center mt-2">
                            <c:choose>
                                <c:when test="${project.isAccepted==1}">
                                    <button class="btn btn-grey "> Đã được duyệt</button>
                                </c:when>
                                <c:otherwise>
                                    <button onclick="accept(${project.id})"  class="btn btn-green font-weight-bold ml-0"> Chờ duyệt</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="/layout/public/script.jsp" %>

    <script src="<c:url value="/template/js/user.js"/>"></script>
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