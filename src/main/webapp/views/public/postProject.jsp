<!doctype html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@include file="/layout/common.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/projectPost.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <style>
        .upload-wrapper .image > div, .upload-wrapper .image1 > div {
            top: 2.5%;
            right: 5%;
        }
    </style>
    <title></title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<section id="PostContent">
    <!--start breadcrumb-->

    <!--end breadcrumb-->
    <div class="container">
        <div>
            <div class="bc-icons-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white breadcrumb-font">
                        <li class="breadcrumb-item p-0"><a class="black-text breadcrumb-size" href="/"><i
                                class="fas fa-home"></i></a>
                            <i class="fas fa-caret-right mx-2" aria-hidden="true"></i></li>
                        <li class="breadcrumb-item breadcrumb-size p-0">
                            <a class="black-text text-uppercase" href="#">Dự án</a>
                            <i class="fas fa-caret-right mx-2" aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active breadcrumb-size p-0">
                            <a class="black-text text-uppercase project-title" href="#"></a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-8 col-lg-8 post-content position-relative">
                <c:choose>
                    <c:when test="${project.saveBy==auth.id}">
                        <i class="fa-solid fa-bookmark position-absolute " onclick="like(this)"
                           style="z-index: 1000; left: 1%; top:22px; font-size: 25px"></i>
                    </c:when>
                    <c:otherwise>
                        <i class="fa-regular fa-bookmark position-absolute " onclick="like(this)"
                           style="z-index: 1000; left: 1%; top:22px; font-size: 25px"></i>

                    </c:otherwise>
                </c:choose>
                <h1 class="text-center mb-3 mt-3 post-title text-uppercase project-title"></h1>
                <div class="row">

                    <p class="font-italic col-lg-5 col-md-5 col-sm-12 m-0"><strong>Ngày đăng: <span
                            class="project-updatedAt"></span>; Mã
                        dự án:
                        <span class="project-id"></span></strong></p>
                    <%--                    Thiết kế, Sửa chữa--%>
                    <p class="font-italic col-lg-7 col-md-7 col-sm-12 m-0"><strong><span>Loại dự án: <span
                            class="project-category"></span>;</span>
                        <span class="project-services">Loại dịch vụ:
<%--                            <c:forEach items="${services}" var="service"--%>
<%--                                                                                varStatus="loop">--%>
<%--                            ${service.name}<c:if test="${not loop.last}">,</c:if>--%>
<%--                        </c:forEach>--%>
</span></strong></p>
                </div>


                <div class="gallery position-relative h-auto mb-3 gallery">

                </div>
                <div class="post-content-text" style="max-width: 100%">

                    <div class="company-address">
                        <h6 class="mt-2 mb-2">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</h6>
                        <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP. HCM</p>
                        <p>Hotline: 0935 671 886</p>
                        <p>Email: xaydungnhadep@gmail.com</p>
                        <p>Website: nhadep.asia</p></div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-4 recommed-box ">
                <div class="wrapper-feature-news mt-3 mb-1 h-100">
                    <div class="feature-news-header">
                        <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                        </i>Đặt ngay cho bạn</p>
                    </div>
                    <div class="sticky-top" style="z-index: 1; top:80px">

                        <form class="card " action="post?action=cast" method="post">
                            <div class="card-body pl-3 pr-3">
                                <!--Header-->
                                <!--Body-->
                                <div class="md-form mt-1 mb-1 p-1">
                                    <input type="text" id="form-email" name="email"
                                           class="form-control form-input form-input p-1 m-0"
                                           style="font-size: 15px" value="${cart.email}">
                                    <label for="form-email" class="m-0" style="font-size: 15px"> <i
                                            class="fa-lg fas fa-envelope grey-text"></i>
                                        Địa chỉ email</label>
                                </div>
                                <div class="form-outline mt-1 mb-1">
                                    <label for="address" class="labels">Địa chỉ</label>
                                    <select name="address" id="address" class="form-control form-input">
                                        <option value="" disabled selected>Chọn tỉnh thành</option>
                                        <c:forEach items="${provinces}" var="province">
                                            <option value="${province.id}"
                                                    <c:if test="${province.id==cart.provinceId}">selected</c:if>>${province.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="row d-flex justify-content-between m-0 p-0 ">
                                    <!--                                <div class=" col-lg-5 col-md-5 col-sm-12 mb-3  p-0">-->
                                    <select name="category" id="category" class="form-control form-input md-form
                                     col-lg-6 col-md-6 col-sm-12 m-0 mt-2 p-0  p-1">
                                        <option value="" disabled="" selected="">Loại dự án</option>
                                        <c:forEach items="${categories }" var="category">
                                            <option value="${category.id}"
                                                    <c:if test="${category.id==cart.categoryId}">selected</c:if>> ${category.name}</option>
                                        </c:forEach>
                                    </select>
                                    <!--                                </div>-->
                                    <div class="form-outline col-lg-6 col-md-6 col-sm-12  mt-2 p-0 m-0 ">
                                        <input name="representProjectId" type="number" id="itProject"
                                               placeholder="Mã dự án"
                                               class="form-control form-input ml-md-2 p-1"
                                               value="${cart.representProjectId}">
                                    </div>
                                </div>
                                <div class="row  d-flex justify-content-between m-0 p-0">
                                    <div class="form-outline col-lg-6  col-md-6 col-sm-12 p-0 m-0">
                                        <label for="area-width" style="font-size: 13px">
                                            Chiều rộng(<span class="position-relative m-1">m<span
                                                class="position-absolute top right "
                                                style="font-size: 10px;">2</span></span> )</label>
                                        <input name="width" type="number" id="area-width"
                                               class="form-control form-input mr-2 p-1" value="${cart.width}">
                                    </div>
                                    <div class="form-outline col-lg-6 col-md-6 col-sm-12 p-0 m-0 ">
                                        <label for="area-length" class="ml-md-2" style="font-size: 13px">
                                            Chiều dài(<span class="position-relative m-1">m<span
                                                class="position-absolute top right "
                                                style="font-size: 10px;">2</span></span> )</label>
                                        <input name="height" type="number" id="area-length"
                                               class="form-control form-input ml-md-2 p-1" value="${cart.height}">
                                    </div>
                                </div>
                                <div class="">
                                    <label class="mdb-main-label" style="font-size: 13px">Dịch vụ</label>
                                    <select name="services" id="services" class="mdb-select md-form services" multiple>
                                        <c:forEach items="${sessionScope.services}" var="service">
                                            <option value="${service.id}"
                                                    <c:if test="${cart!=null&& cart.services!=null}">
                                                        <c:forEach var="item1"
                                                                   items="${cart.services}">
                                                            <c:if test="${service.id==item1}">
                                                                selected
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                            >${service.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn-save btn btn-primary btn-sm">Save</button>
                                </div>

                                <!-- Message -->
                                <form method="dialog" enctype="multipart/form-data" class="form-img">
                                    <div class="input-group mt-2">
                                        <div class="file-field d-flex align-items-center">
                                            <p class="m-0">khu vực thi công: </p>
                                            <div class="btn btn-primary btn-sm float-left">
                                                <span>chọn ảnh</span>
                                                <input name="image" type="file" id="file_input" multiple>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="upload-wrapper">
                                        <div class="border d-flex img-container">
                                        </div>
                                    </div>
                                </form>
                                <div class="text-center mt-4">
                                    <button class="btn btn-red" id="save" type="button">Đặt Ngay</button>
                                </div>
                            </div>
                        </form>

                        <div class="mt-2">
                            <div class="feature-news-header">
                                <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                                </i> bạn có thể quan tâm</p>
                            </div>
                            <ul class="feature-news-list project-suggest">
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value="/template/js/post-project.js"/>"></script>
<script>

</script>
</body>
</html>