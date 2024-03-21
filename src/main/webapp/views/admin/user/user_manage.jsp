<%--
 Created by IntelliJ IDEA.
 User: Clover
 Date: 11/12/2023
 Time: 1:56 PM
 To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <title>Quản lý người dùng</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp"%>
    <div class="main-container ">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">QL người dùng</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <div class="row border-bottom  ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL Người dùng</h3>
                    </div>
                    <div class="col-6 d-flex justify-content-end align-items-center p-0">
                        <a href="${pageContext.request.contextPath}/admin/user_management?action=add">
                            <button class="btn btn-blue p-2" type="button"><i class="fa-solid fa-plus"></i> Đăng ký
                            </button>
                        </a>

                    </div>
                </div>
                <div class="">
                    <table class="table table-hover table-striped table-bordered m-0 w-100" id="table-user">
                        <thead>
                        <tr>
                            <th class="font-weight-bold" scope="col">#</th>
                            <th class="font-weight-bold" scope="col">Tên</th>
                            <th class="font-weight-bold" scope="col">Email</th>
                            <th class="font-weight-bold" scope="col">Số điện thoại</th>
                            <th class="font-weight-bold" scope="col">Địa Chỉ</th>
                            <!--                            <th class="font-weight-bold" scope="col">Avatar</th>-->
                            <th class="font-weight-bold" scope="col">Phái</th>
                            <th class="font-weight-bold" scope="col">Trạng thái</th>
                            <th class="font-weight-bold" scope="col">Quyền</th>
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
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/api/admin/user",
            type: "post",
            dataType: "json",
            success: function (data) {
                console.log(data)
            },
        })
    });
</script>
<script>
    let index = 1;
    $('#table-user').dataTable({
        ajax: {
            url: "${pageContext.request.contextPath}/api/admin/user",
            type: "get",
            dataSrc: ''
        },
        columns: [

            {
                render:function (){
                  return index++
                },
            },
            {
                data: 'fullName',
                render: function (fullName) {
                    if (fullName == null || fullName === "") return "---"; else return fullName;
                }
            },
            {
                data: 'email',
                render: function (email) {
                    if (email == null || email === "") return "---"; else return email;
                }
            },

            {
                data: 'phone',
                render: function (phone) {
                    if (phone == null || phone === "") return "---"; else return phone;
                }
            },
            {
                data: 'province', render: function (province) {
                    if (province == null || province === "") return "---"; else return province;
                }
            },
            {
                data: 'gender',
                render: function (gender) {
                    return gender == 1 ? "<i class='fa-solid fa-person' style='color: #005eff;'></i>" : "<i class='fa-solid fa-person-dress' style='color: #ff00d0;'></i>"
                }
            },
            {
                data: 'status',
                render: function (status) {
                    return status == 0 ? "<i class='fa-solid fa-square inactive-icon'></i>" : "<i class='fa-solid fa-square active-icon'></i>"
                }
            },
            {
                data: 'role',
                render: function (role) {
                    return role == 2 ? "Admin" : "Người dùng"
                }
            },
            {
                data: 'email', render: function (email) {
                    return "<a href='${pageContext.request.contextPath}/admin/user_management?action=edit&useremail=" + email + "'><i class='icon-action fa-solid fa-edit'></i></a>\n"
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
            // {
            //     "targets": 1,
            //     "width": "150px",
            // },
            {
                "targets": 2,
                "width": "15%",
            },
            // {
            //     "targets": 2,
            //     "width": "300px",
            // },
            {
                "targets": 3,
                "width": "10%",
            },
            // {
            //     "targets": 3,
            //     "width": "90px",
            // },
            {
                "targets": 4,
                "width": "10%",
            },
            // {
            //     "targets": 4,
            //     "width": "90px",
            // },
            // {
            //     "targets":6,
            //     "width": "5vw",
            // },
            // {
            //     "targets": 5,
            //     "width": "65px",
            // },
            {
                "targets": 5,
                "width": "10%",
            },
            // {
            //     "targets": 6,
            //     "width": "90px",
            // },
            {
                "targets": 6,
                "width": "10%",
            },
            // {
            //     "targets": 7,
            //     "width": "75px",
            // },
            {
                "targets": 7,
                "width": "7%",
            },
            // {
            //     "targets": 8,
            //     "width": "75px",
            // },
            {
                "targets": 8,
                "width": "7%",
            },
            // {
            //     "targets": 9,
            //     "width": "60px",
            // },
            {className: "text-center mt-auto mb-auto", targets: "_all"},
            {className: "text-break", targets: "_all"}
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
