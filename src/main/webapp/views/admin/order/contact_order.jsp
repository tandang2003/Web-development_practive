<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 13/12/2023
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <%@include file="/layout/public/link.jsp" %>
    <meta charset="UTF-8">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <title>Quản lý yêu cầu</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container">
        <div class="container p-0">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item main-color"><a class="main-color" href="#">QL yêu cầu</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL yêu cầu</h3>
                    </div>
                </div>
                <table id="project-cart-table" class="table table-hover table-striped table-bordered m-0 " style="">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Email yêu cầu</th>
                        <th class="font-weight-bold" scope="col">Tỉnh thành</th>
                        <th class="font-weight-bold" scope="col">Loại dự án</th>
                        <th class="font-weight-bold" scope="col">Mẫu dự án</th>
                        <th class="font-weight-bold" scope="col">Chiều rộng</th>
                        <th class="font-weight-bold" scope="col">Chiều dài</th>
                        <th class="font-weight-bold" scope="col">Người dùng xác nhận</th>
                        <th class="font-weight-bold" scope="col">Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    </tbody>

                </table>

            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script>

</script>
<script>
    let x = 0;
    $('#project-cart-table').dataTable({
        "ajax": {
            "url": "/api/admin/cart",
            "type": "GET",
            "dataSrc": ""
        },
        "columns": [
            {
                "data": "id",
                "render": function (data) {
                    x++;
                    return x;
                }
            },
            {
                "data": "email",
                "render": function (data) {
                    return data == null ? "" : data;
                }
            },
            {"data": "province",
                "render": function (data) {
                    return data == null ? "" : data;
                }},
            {"data": "category",
                "render": function (data) {
                    return data == null ? "" : data;
                }},
            {"data": "representProjectId",
                "render": function (data) {
                    return data == null ? "" : data;
                }},
            {"data": "width",
                        "render": function (data) {
                        return data == null ? "" : data;
                }},
            {"data": "height",
                "render": function (data) {
                    return data == null ? "" : data;
                }},
            {"data": "isCheck",
                "render": function (data) {
                    return data == 1 ? "<i class='fa-solid fa-square active-icon'></i>" : "<i class='fa-solid fa-square inactive-icon'></i>"
                }},
            {"data": "id",
                "render": function (data) {
                console.log(data)
                    return "<a href='/admin/cart/detail/" + data + "'><i class='fa-solid fa-eye'></i></a>";
                }
            }

        ],
        // scrollX: true,
        "columnDefs": [

            {
                "targets": 0,
                "width": "5%",
            },
            {
                "targets": 1,
                "width": "15%",
            },
            {
                "targets": 2,
                "width": "15%",
            },
            {
                "targets": 3,
                "width": "10%",
            },
            {
                "targets": 4,
                "width": "30%",
            }, {
                "targets": 5,
                "width": "10%",
            },
            {
                "targets": 6,
                "width": "7%",
            },
            {
                "targets": 7,
                "width": "7%",
            },
            {className: "text-center mt-auto mb-auto", targets: "_all"},

        ],
        "order": [[ 7, 'asc' ]],
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
    let cur;
    for (let item of $('.sidebar-item')) {
        item.addEventListener('click', function () {
            if (cur != null) {
                cur.classList.remove('d-block');
                cur.classList.add('d-none');
            }
            if (this.children.length === 2) {
                this.children[1].classList.remove('d-none')
                this.children[1].classList.add('d-block')
                cur = this.children[1];
            }
        })
    }

</script>

<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });
</script>
</body>
</html>

