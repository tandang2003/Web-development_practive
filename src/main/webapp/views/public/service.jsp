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