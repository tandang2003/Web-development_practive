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
    <link href=" <c:url value="/template/css/project.css"/>" rel="stylesheet">
    <title>DỰ ÁN</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<main class="my-body">
    <div class="container">
        <!--        breadcrumb -->
        <div id="section-1" class="bc-icons-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white small">
                    <li class="breadcrumb-item">
                        <a class="black-brown-text breadcrumb-size" href="/">
                            <i class="fa-solid fa-house"></i>
                        </a>
                    </li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item active breadcrumb-size">
                        <a class="black-text text-uppercase font-weight-bolder" href="#">Dự án</a>
                    </li>
                </ol>
            </nav>
        </div>
        <!--    end breadcrumb-->
        <div class="sub-container">
            <section>
                <h1 class="text-center mb-5"
                    style="color:#E90808; font-family: Inter,Arial, Helvetica, sans-serif; font-weight: 700;">Dự án</h1>
                <!--choose price-->
                <div class="row justify-content-center mb-4 ml-2" id="spinner-filters">

                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="category" id="categoryId" class="form-control">
                                <option value="">Loại</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="service" id="serviceId" class="form-control">
                                <option value="">Loại dịch vụ</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="address" id="provinceId" class="form-control">
                                <option value="" selected>Chọn tỉnh thành</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="area" id="area" class="form-control">
                                <option value="">Diện tích</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="price" id="price" class="form-control">
                                <option value="">Kinh phí</option>
                                </option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 text-center">
                        <button type="button" onclick="searching()" class="btn btn-info btn-search">Tìm</button>
                    </div>
                </div>
                <!--end choose price-->

                <!-- Tab panels -->
                <div class="tab-content pt-0">

                    <!--Panel 1-->
                    <div class="tab-pane fade in show active" id="panel11" role="tabpanel">
                        <br>
                        <div class="row" id="project-container">
                        </div>
                    </div>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination pg-blue" id="container-button">
                        <li class="page-item ">
                            <a class="page-link" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link">1</a></li>
                        <li class="page-item active">
                            <a class="page-link">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link">3</a></li>
                        <li class="page-item ">
                            <a class="page-link">Next</a>
                        </li>
                    </ul>
                </nav>

            </section>

        </div>

    </div>
</main>
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value='/template/js/ajax/saveProject.js'/>"></script>
<script type="module" src="<c:url value='/template/js/ajax/project.js'/>"></script>

</body>
</html>