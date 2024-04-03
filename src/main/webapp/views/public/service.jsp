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
    <link href=" <c:url value="/template/css/services.css"/>" rel="stylesheet">
    <title>DỊCH VỤ</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<div class="my-body">
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
                        <a class="black-text text-uppercase font-weight-bolder text-uppercase" href="#">Dịch vụ</a>
                    </li>
                </ol>
            </nav>
        </div>
        <!--    end breadcrumb-->
        <!--Section: Posts-->
        <section class="text-center">
            <h1 class="mb-5" style="color:#E90808; font-family: Inter,Arial, Helvetica, sans-serif; font-weight: 700;">
                Dịch vụ và báo giá</h1>

            <div class="row g-4 g-lg-5" id="service-container">
                <%--                <c:forEach var="service" items="${services}">--%>
                <%--                    <div class="col-lg-4 col-md-6 mb-5">--%>
                <%--                        <div class="card">--%>
                <%--                            <div--%>
                <%--                                    class="bg-image hover-overlay ripple"--%>
                <%--                                    data-mdb-ripple-color="light">--%>
                <%--                                <a href="#">--%>
                <%--                                    <div--%>
                <%--                                            class="mask"--%>
                <%--                                            style="background-color: rgba(251, 251, 251, 0.15)"--%>
                <%--                                    ></div>--%>
                <%--                                    <div class="hover-img">--%>
                <%--                                        <img--%>
                <%--                                                src="${service.avatar}"--%>
                <%--                                                class="img-fluid"/>--%>
                <%--                                    </div>--%>
                <%--                                </a>--%>
                <%--                            </div>--%>
                <%--                            <div class="card-body">--%>
                <%--                                <div class="card-content">--%>
                <%--                                    <h3 class="card-title">Dịch vụ ${service.name}</h3>--%>
                <%--                                    <p class="card-text">--%>
                <%--                                            ${service.description}--%>
                <%--                                    </p>--%>
                <%--                                </div>--%>
                <%--                                <a href="/post/service?id=${service.id}" class="btn btn-rounded">Xem thêm</a>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </c:forEach>--%>
            </div>
        </section>
        <!--Section: Posts-->
    </div>
</div>
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value="/template/js/services.js"/>"></script>
<script>
    getServices("services", 'service-container');
</script>
</body>
</html>