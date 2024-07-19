<%@ taglib prefix="ac" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
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

    <title>Title</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container ">
        <div class="container p-0">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL Dịch vụ</a>
                    </li>
                </ol>
            </nav>

            <main class="container shadow border p-3 h-auto">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL Dịch vụ</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <a href="/admin/service/add">
                            <button class="btn btn-blue p-2" type="button"><i class="fa-solid fa-plus"></i> Thêm dịch vụ
                            </button>
                        </a>

                    </div>
                </div>
                <div class="">
                    <table class="table table-hover table-striped table-bordered m-0 w-100 " id="table-service">
                        <thead>
                        <tr>
                            <th class="font-weight-bold " scope="col">STT</th>
                            <th class="font-weight-bold" scope="col">Tên DV</th>
                            <th class="font-weight-bold" scope="col">Mô tả</th>
                            <th class="font-weight-bold" scope="col">Hình ảnh</th>
                            <th class="font-weight-bold" scope="col">Số dự án</th>
                            <th class="font-weight-bold" scope="col">Trạng thái</th>
                            <th class="font-weight-bold" scope="col">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--                        <c:forEach step="1" begin="0" var="service"  varStatus="loop" items="${serviceList}">--%>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>

                            </td>
                        </tr>
                        <%--                        </c:forEach>--%>
                        </tbody>
                        <tfoot>

                        </tfoot>
                    </table>
                </div>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script type="module" src="<c:url value="/template/js/admin/service-manage.js"/>"></script>
</body>
</html>
