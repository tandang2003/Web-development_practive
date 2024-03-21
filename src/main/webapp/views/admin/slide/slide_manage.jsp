<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <%@include file="/layout/public/link.jsp" %>
    <meta charset="UTF-8">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">

    <title>Title</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp"%>
    <div class="main-container">
        <div class="container p-0">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL Slide</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL Slide</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <a href="/admin/slide/add">
                            <button class="btn btn-blue p-2" type="button"><i class="fa-solid fa-plus"></i>Thêm slide</button>
                        </a>

                    </div>
                </div>
                <table id="project-type-table" class="table table-hover table-striped table-bordered m-0 "
                       style="width:100%">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Tiêu đề</th>
                        <th class="font-weight-bold" scope="col">Hình ảnh</th>
                        <th class="font-weight-bold" scope="col">Thứ tự</th>
                        <th class="font-weight-bold" scope="col">Trạng thái</th>
                        <th class="font-weight-bold" scope="col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${sliders}" varStatus="loop" var="slide">
                        <tr>
                            <td>${loop.index+1}</td>
                            <td>${slide.title}</td>
                            <td><img src="${slide.avatar}" alt="" class="w-100 h-auto"></td>
                            <td>${slide.sequence}</td>

                            <td>
                        <c:choose>
                            <c:when test="${slide.status==1}">
                                <i class="fa-solid fa-square active-icon" value="1"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="fa-solid fa-square inactive-icon" value="0"></i>
                            </c:otherwise>
                        </c:choose>
                            </td>
                            <td>
                                <a href="/admin/slide/edit?id=${slide.id}"><i class="icon-action fa-solid fa-edit"></i></a>
                                <a href="/admin/slide/delete?id=${slide.id}"><i class="icon-action fa-solid fa-trash-can"></i></a></td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>

            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<!--<script src="/template/lib/DataTables/FixedColumns-4.3.0/js/dataTables.fixedColumns.min.js"></script>-->
<script>

</script>
<script>
    $('#project-type-table').dataTable({
        // "ajax": {
        //     // "url": "http://localhost/RealEstateWeb/userManage" ,
        //     "dataSrc": ""
        // },
        scrollX: true,
        "columnDefs": [
            {
                "targets": 0,
                "width": "10%",

            }, {
                "targets": 1,
                "width": "20%",
            },
            {
                "targets": 2,
                "width": "20%",
            },
            {className: "text-center mt-auto mb-auto", targets: "_all"},

        ],
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng",
            "zeroRecords": "Không tìm thấy dữ liệu",
            "info": "Hiển thị trang _PAGE_ trên _PAGES_",
            "infoEmpty": "Không có dữ liệu",
            "infoFiltered": "(lọc từ _MAX_ dòng dữ liệu)",
            "search": "Tìm kiếm",
            "paginate": {
                "previous": "Trước",
                "next": "Tiếp theo"
            }
        },
        "pagingType": "full_numbers",
        "lengthMenu": [5, 10, 15, 20],
        "order": [[0, "asc"]],
    });

</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
<script>
    let cur ;
    for (let item of  $('.sidebar-item')) {
        item.addEventListener('click', function (){
            if(cur!=null) {
                cur.classList.remove('d-block');
                cur.classList.add('d-none');
            }
            if(this.children.length===2){
                this.children[1].classList.remove('d-none')
                this.children[1].classList.add('d-block')
                cur=this.children[1];
            }
        })
    }

</script>
</body>
</html>
