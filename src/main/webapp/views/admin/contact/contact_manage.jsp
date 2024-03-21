<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:32 PM
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
    <title>Yêu cầu liên hệ</title>
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
                    <li class="breadcrumb-item main-color"><a class="main-color" href="#">QL Liên hệ</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <div class="row border-bottom pb-3 mb-3 ml-1 mr-1   ">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">QL Liên hệ</h3>
                    </div>
                </div>
                <table id="project-post-table" class="table table-hover table-striped table-bordered m-0 " style="">
                    <thead>
                    <tr>
                        <th class="font-weight-bold" scope="col">#</th>
                        <th class="font-weight-bold" scope="col">Tên người gửi</th>
                        <th class="font-weight-bold" scope="col">Email</th>
                        <th class="font-weight-bold" scope="col">Tỉnh/thành phố</th>
                        <th class="font-weight-bold" scope="col">Số điện thoại</th>
                        <th class="font-weight-bold" scope="col">Nội dung</th>
                        <th class="font-weight-bold" scope="col">Ngày gửi</th>
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
$(document).ready(function (){
    $.ajax({
        url:'/api/admin/contact',
        type: 'get',
        dataType:'json',
        success: function (data){
            console.log(data)
        }
    })
})
</script>
<script>
    let index = 0;
    $('#project-post-table').dataTable({
        ajax: {
            type: "GET",
            url: "/api/admin/contact",
            dataSrc: "",
            //     "dataSrc": ""
        },
        columns: [
            {
                data:
                'id', render: function (data) {
                    index++;
                    return index;
                }
            },
            {
                data: 'fullName', render: function (data) {
                    return data == null ? "" : data;
                }
            },
            {
                data: 'email', render: function (data) {
                    return data == null ? "" : data;
                }
            },
            {
                data:'address', render: function (data) {
                    return data == null ? "" : data;
                }
            },
            {
                data: 'phone', render: function (data) {
                    return data == null ? "" : data;
                }
            },
            {
                data: 'content', render: function (data) {
                    return data == null ? "" : data;
                }
            },
            {
                data: "updatedAt", render: function (data) {
                    return data == null ? "" : data;
                }
            },
        ],
        // scrollX: true,
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
                "width": "15%",
            },
            {
                "targets": 3,
                "width": "10%",
            },
            {
                "targets": 4,
                "width": "17%",
            }, {
                "targets": 5,
                "width": "30%",
            },
            {
                "targets": 6,
                "width": "7%",
            },
            // {
            //     "targets": 7,
            //     "width": "7%",
            // },
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
