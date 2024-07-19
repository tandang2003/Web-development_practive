<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:37 PM
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
    <title>Tiến độ dự án</title>
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
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/project_management">QL dự án</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL dự án đang thi công</a>
                    </li>
                </ol>
            </nav>
            <main class="container border p-3 h-100">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL DỰ ÁN ĐANG THI CÔNG</h3>
                    </div>
                </div>
                <table id="project-executing-table" class="table table-hover table-striped table-bordered m-0 w-100"
                >
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">STT</th>
                        <th class="font-weight-bold" scope="col">Email khách hàng</th>
                        <th class="font-weight-bold" scope="col">Mã dự án</th>
                        <th class="font-weight-bold" scope="col">Tiến độ</th>
                        <th class="font-weight-bold" scope="col">Dự kiến ngày hoàn thành</th>
                        <th class="font-weight-bold" scope="col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <%--                                ${project.schedule}--%>
                        </td>
                        <td></td>
                        <td>
                            <%--                            <a href="/admin/project_additional_and_edit?action=edit&id=${project.id}"><i class="icon-action fa-solid fa-edit"></i></a>--%>
                        </td>
                    </tr>
                </table>

            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<!--<script src="/template/lib/DataTables/FixedColumns-4.3.0/js/dataTables.fixedColumns.min.js"></script>-->
<script>
    <%--console.log(${emails})--%>
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
    let index = 1;
    $('#project-executing-table').dataTable({
        "ajax": {
            "url": "/api/admin/project_schedule",
            "dataSrc": "",
            type: "get",
            dataType: "json",
        },
        columns: [{
            render: function () {
                return index++;
            }
        },
            {data: "owner"},
            {data: "id"},
            {data: "schedule"},
            {data: "estimatedComplete"},
            {
                data:"id",
                render: function (data) {
                    return "<a href='/admin/project/edit/"+ data+"'><i class='icon-action fa-solid fa-edit'></i></a>";
                }
            }],
        "columnDefs": [
            {
                "targets": 0,
                "width": "10%",
            },
            {
                "targets": 1,
                "width": "20%",
            },
            {
                "targets": 2,
                "width": "10%",
            },
            {
                "targets": 3,
                "width": "30%",
            },
            {
                "targets": 4,
                "width": "20%",
            },
            {
                "targets": 5,
                "width": "10%",
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
