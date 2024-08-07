<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:46 PM
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
    <title>Quản lý loại dự án</title>
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
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/project_management">QL dự án</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL loại dự án</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL LOẠI DỰ ÁN</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <a href="/admin/category_management/add">
                            <button class="btn btn-blue p-2" type="button"><i class="fa-solid fa-plus"></i> Thêm loại dự
                                án
                            </button>
                        </a>

                    </div>
                </div>
                <table id="project-type-table" class="table table-hover table-striped table-bordered m-0 "
                       style="width:100%">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Tên loại dự án</th>
                        <th class="font-weight-bold" scope="col">Số lượng dự án</th>
                        <th class="font-weight-bold" scope="col">Ngày cập nhập</th>
                        <th class="font-weight-bold" scope="col">Trạng thái</th>
                        <th class="font-weight-bold" scope="col">Hành động</th>
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
                    </tr>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
</div>

<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<!--<script src="/template/lib/DataTables/FixedColumns-4.3.0/js/dataTables.fixedColumns.min.js"></script>-->
<script>
    $.ajax({
        url: "${pageContext.request.contextPath}/api/admin/category",
        type: "GET",
        dataType: "json",
        success: function (data) {
            console.log(data)
        },
        error: function (e) {
            console.log(e)
        }
    })
</script>
<script>
    let index = 1;
    $('#project-type-table').dataTable({
        ajax: {
            url: "/api/admin/category",
            type: "get",
            dataSrc: "",
            dataType: "json",
        },
        columns: [
            {
                data: "id",
                render: function () {
                    return index++;
                }
            },
            {
                data: "name",
                render: function (name) {
                    return (name == null || name === "") ? "---" : name;
                }
            },
            {
                data: "numberOfProject",
                render: function (numberOfProject) {
                    return (numberOfProject == null || numberOfProject === "") ? "---" : numberOfProject;
                }
            },
            {
                data: "updatedAt", render: function (updatedAt) {
                    return updatedAt
                }
            },
            {
                data: "status",
                render: function (status) {
                    if (status === 1) {
                        return '<i class="fa-solid fa-square active-icon" value="0"></i>'
                    } else {
                        return '<i class="fa-solid fa-square inactive-icon" value="1"></i>'
                    }
                }
            },
            {
                data: "id",
                render: function (id) {
                    return '<a href="/admin/category_management/edit/' + id + '"><i class="icon-action fa-solid fa-edit"></i></a>\n'
                }
            },
        ],
        columnDefs: [
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
                "width": "10%",
            },
            {
                "targets": 3,
                "width": "15%",
            },
            {
                "targets": 4,
                "width": "10%",
            },
            {
                "targets": 5,
                "width": "10%",
            },
            {className: "text-center mt-auto mb-auto", targets: "_all"},

        ],
        language: {
            lengthMenu: "Hiển thị _MENU_ dòng",
            zeroRecords: "Không tìm thấy dữ liệu",
            info: "Hiển thị trang _PAGE_ trên _PAGES_",
            infoEmpty: "Không có dữ liệu",
            infoFiltered: "(lọc từ _MAX_ dòng dữ liệu)",
            search: "Tìm kiếm",
            paginate: {
                previous: "Trước",
                next: "Tiếp theo"
            }
        },
        pagingType: "full_numbers",
        lengthMenu: [5, 10, 15, 20],
        order: [[0, "asc"]],
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
