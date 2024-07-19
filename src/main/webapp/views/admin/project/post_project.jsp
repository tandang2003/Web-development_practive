<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:35 PM
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

    <title>Bài viết dự án</title>
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
                        <a class="main-color" href="#">QL bài viết dự án</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-12 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL BÀI VIẾT DỰ ÁN</h3>
                    </div>
                </div>
                <table id="project-post-table" class="table table-hover table-striped table-bordered m-0 w-100"
                       style="width:100%">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Tên dự án</th>
                        <th class="font-weight-bold" scope="col">Lượt lưu</th>
                        <th class="font-weight-bold" scope="col">Lượt xem</th>
                        <th class="font-weight-bold" scope="col">Ngày cập nhập</th>
                        <th class="font-weight-bold" scope="col">Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--                    <c:forEach items="${projects}" var="project" varStatus="s" begin="0" step="1">--%>
                    <tr>
                        <td>${s.index}</td>
                        <td>${project.title}</td>
                        <td>${project.numSave}</td>
                        <td>${project.numVisit}</td>
                        <td>${project.updatedAt}</td>
                        <td>
                            <%--                                <a href="/admin/project_additional_and_edit?action=edit&id=${project.id}"><i class="icon-action fa-solid fa-edit"></i></a>--%>
                            <%--                                <a href="/admin/post_project?action=edit&id=${project.id}"><i class="icon-action fa-solid fa-edit"></i></a>--%>
                        </td>
                    </tr>
                    <%--                    </c:forEach>--%>
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
    let index = 1;
    $('#project-post-table').dataTable({
        "ajax": {
            url: "/api/admin/post_page/project",
            type: "get",
            "dataSrc": "",
            dataType: "json",
        },
        columns: [
            {
                render: function () {
                    return index++;
                }
            },
            {
                data: "title",
                render: function (title) {
                    return (title == null || title === "") ? "---" : title;
                }
            },
            {
                data: "numSave",
                render: function (numSave) {
                    return (numSave == null || numSave === "") ? "---" : numSave;
                }
            },
            {
                data: "numVisit",
                render: function (numVisit) {
                    return (numVisit == null || numVisit === "") ? "---" : numVisit;
                }
            },
            {
                data: "updatedAt",
                render: function (updatedAt) {
                    return (updatedAt == null || updatedAt === "") ? "---" : updatedAt;
                }
            },
            {
                data:"id",
                render: function (data, type, row) {
                    return "<a href='/admin/project/edit/" + data + "'><i class='icon-action fa-solid fa-edit'></i></a>";
                }
            }

        ],
        // scrollX: true,
        "columnDefs":
            [
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
                    "width": "20%",
                },
                {
                    "targets": 3,
                    "width": "20%",
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

        "language":
            {
                "lengthMenu":
                    "Hiển thị _MENU_ dòng",
                "zeroRecords":
                    "Không tìm thấy dữ liệu",
                "info":
                    "Hiển thị trang _PAGE_ trên _PAGES_",
                "infoEmpty":
                    "Không có dữ liệu",
                "infoFiltered":
                    "(lọc từ _MAX_ dòng dữ liệu)",
                "search":
                    "Tìm kiếm",
                "paginate":
                    {
                        "previous":
                            "Trước",
                        "next":
                            "Tiếp theo"
                    }
            }
        ,
        "pagingType":
            "full_numbers",
        "lengthMenu":
            [5, 10, 15, 20],
        "order":
            [[0, "asc"]],
    })
    ;

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
