<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="UTF-8">
    <meta content="application/x-www-form-urlencoded;charset=utf-8" http-equiv="Content-Type">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">

    <style>
        .select-wrapper input.select-dropdown, .custom-file-label {
            z-index: 0;
        }

        div.picker.datepicker .picker__box {
            border: 1px solid;
            box-shadow: none;
        }

    </style>
    <title>Chi tiết đơn yêu cầu</title>
</head>
<body>

<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/cart">QL Yêu cầu</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chi tiết yêu cầu</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <form action="#" enctype="multipart/form-data" method="post" id="add-project">
                    <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Chi tiết yêu cầu</h3>
                        </div>
                        <%--                        <div class="btn-save flex-center">--%>
                        <%--                            <button id="save" form="add-project" class="btn btn-warning p-2 waves-effect waves-light"--%>
                        <%--                                    type="button"> LƯU--%>
                        <%--                            </button>--%>
                        <%--                        </div>--%>
                    </div>

                    <div class="tab-content pt-2 pl-1" id="pills-tabContent" style="height: fit-content">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab">
                            <div class="edit-profile flex-center">
                                <div class="col-md-8 mb-4">
                                    <!-- Card -->
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <!-- Card content -->
                                        <div class="card-body card-body-cascade">
                                            <div class="row flex-center">
                                                <div class="col-lg-11 mb-4">
                                                    <div class="card-body">
                                                        <div class="mb-4">
                                                            <label for="email" class="labels">Chủ đầu tư</label>
                                                            <input id="email" type="email" class="form-control"
                                                                   name="email" placeholder="Email chủ đầu tư"
                                                                   value="${cart.email}">
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="province" class="labels">Địa chỉ</label>
                                                            <select name="province" id="province"
                                                                    class="form-control">
                                                                <option value="" selected>Chọn tỉnh thành</option>
                                                                <c:forEach items="${sessionScope.provinces}" var="province">
                                                                    <option value="${province.id}"
                                                                            <c:if test="${province.id==cart.provinceId}">selected</c:if>>${province.name}</option>
                                                                </c:forEach>

                                                            </select>
                                                        </div>
                                                        <div class="row d-flex justify-content-between m-0 p-0 ">
                                                            <select name="category" id="category"
                                                                    class="form-control col-lg-6 col-md-6 col-sm-12 m-0 mt-2 p-0  p-1">
                                                                <option value="" disabled="" selected="">Loại dự án
                                                                </option>
                                                                <c:forEach var="item" items="${sessionScope.categories}">
                                                                    <option value="${item.id}" <c:if
                                                                            test="${cart.categoryId ==item.id}"> selected</c:if> ><span
                                                                            class="text-uppercase">${item.name}</span>
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            <!--                                </div>-->
                                                            <div class="form-outline col-lg-6 col-md-6 col-sm-12  mt-2 p-0 m-0 ">
                                                                <input name="idProject" type="number" id="itProject"
                                                                       placeholder="Mã dự án"
                                                                       class="form-control ml-md-2 p-1" value="${cart.representProjectId}">
                                                            </div>
                                                        </div>

                                                        <div class="row  d-flex justify-content-between m-0 p-0">
                                                            <div class="form-outline col-lg-6  col-md-6 col-sm-12 p-0 m-0">
                                                                <label for="area-width" style="font-size: 13px"
                                                                       class="">
                                                                    Chiều rộng(<span
                                                                        class="position-relative m-1">m<span
                                                                        class="position-absolute top right "
                                                                        style="font-size: 10px;">2</span></span>
                                                                    )</label>
                                                                <input name="width" type="number" id="area-width"
                                                                       class="form-control mr-2 p-1" value="${cart.width}">
                                                            </div>
                                                            <div class="form-outline col-lg-6 col-md-6 col-sm-12 p-0 m-0 ">
                                                                <label for="area-length" class="ml-md-2"
                                                                       style="font-size: 13px">
                                                                    Chiều dài(<span class="position-relative m-1">m<span
                                                                        class="position-absolute top right "
                                                                        style="font-size: 10px;">2</span></span>
                                                                    )</label>
                                                                <input name="height" type="number" id="area-length"
                                                                       class="form-control ml-md-2 p-1" value="${cart.height}">
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <label class="mdb-main-label" style="font-size: 13px">Dịch
                                                                vụ</label>
                                                            <select name="services" class="mdb-select md-form "
                                                                    multiple>
                                                                <c:forEach items="${sessionScope.services}" var="service">
                                                                    <option value="${service.id}"
                                                                                <c:forEach var="item1"
                                                                                           items="${cart.services}">
                                                                                    <c:if test="${service.id==item1}">
                                                                                        selected
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                    >${service.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="input-group mt-2">
                                                            <div class="file-field d-flex align-items-center">
                                                                <p class="m-0">khu vực thi công: </p>
                                                                <div class="btn btn-primary btn-sm float-left waves-effect waves-light">
                                                                    <span>chọn ảnh</span>
                                                                    <input name="image" type="file" disabled id="file_input"
                                                                           multiple="">
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="upload-wrapper avatar">
                                                        <div class="border d-flex img-container">
                                                            <c:forEach items="${cart.images}" var="image">
                                                               <div class="image position-relative border-radius">
                                                                <img src="${image}" alt="" class="border" style="width: 200px; height: auto">
                                                               </div></c:forEach>
<%--                                                                <div class="position-relative">--%>
<%--                                                                    <img src="${image}" class="img-fluid z-depth-1"--%>
<%--                                                                         alt="Responsive image">--%>
<%--                                                                    <div class="position-absolute top right">--%>
<%--                                                                        <i class="fas fa-times-circle"></i>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
</div>
<!--/. Sidebar navigation -->
<%@include file="/layout/public/script.jsp" %>
<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();
    });
</script>
</body>
</html>