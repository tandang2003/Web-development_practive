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
    <link href="<c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href="<c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <link href="<c:url value="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css"/>" rel="stylesheet">
    <link href="<c:url value="https://cdn.datatables.net/select/2.0.3/css/select.dataTables.css"/>" rel="stylesheet">
    <title>Title</title>
    <style>
        #custom-button {
            display: none;
            margin-left: 10px;
            padding: 4px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container ">
        <div class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">Logging</a>
                    </li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                <div class="row border-bottom  ml-1 mr-1">
                    <div class="col-6 d-flex align-items-center p-0">
                        <h3 class="font-weight-bold main-color m-0">Logging</h3>
                    </div>
                </div>
                <div class="">
                    <table class="table table-hover table-striped table-bordered m-0 w-100" id="table-user">
                        <thead>
                        <tr>
                            <th class="font-weight-bold" scope="col">#</th>
                            <th class="font-weight-bold" scope="col">Ip</th>
                            <th class="font-weight-bold" scope="col">address</th>
                            <th class="font-weight-bold" scope="col">level</th>
                            <th class="font-weight-bold" scope="col">created</th>
                            <th class="font-weight-bold" scope="col">updated</th>
                            <th class="font-weight-bold" scope="col">
                                <input type="checkbox" id="select-all"
                                       style="right: 27px; pointer-events: auto; opacity: unset">
                            </th>
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
                </div>
            </main>
        </div>
    </div>
</div>
<%@include file="/layout/public/script.jsp" %>
<%--<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>--%>
<script src="<c:url value="https://cdn.datatables.net/2.0.8/js/dataTables.js"/>"></script>
<script src="<c:url value="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.js"/>"></script>
<script src="<c:url value="https://cdn.datatables.net/select/2.0.3/js/select.dataTables.js"/>"></script>
<script>
    const table = $('#table-user').DataTable({
        ajax: {
            url: "${pageContext.request.contextPath}/api/admin/logs",
            type: "get",
            dataSrc: ''
        },
        columns: [
            {
                data: 'id',
                render: function (id) {
                    if (id == null || id === "") return "---"; else return id;
                }
            },
            {
                data: 'ip',
                render: function (ip) {
                    if (ip == null || ip === "") return "---"; else return ip;
                }
            },
            {
                data: 'address',
                render: function (address) {
                    if (address == null || address === "") return "---"; else return address;
                }
            },
            {
                data: 'level',
                render: function (level) {
                    //     level = 1 is INFO
                    //     level = 2 is ALERT
                    //     level = 3 is WARNING
                    //     level = 4 is DANGER
                    //     null or '' is UNKNOW
                    return level == 1 ? "<h6 class='mb-0'><span class='badge bg-success'>INFO</span></h6>" :
                        level == 2 ? "<h6 class='mb-0'><span class='badge bg-warning'>ALERT</span></h6>" :
                            level == 3 ? "<h6 class='mb-0'><span class='badge bg-danger'>WARNING</span></h6>" :
                                level == 4 ? "<h6 class='mb-0'><span class='badge bg-danger'>DANGER</span></h6>" :
                                    "<h6 class='mb-0'><span class='badge bg-danger'>UNKNOW</span></h6>"

                }
            },
            {
                data: 'created',
                render: function (created) {
                    if (created == null || created === "") return "---"; else return created;
                }
            },
            {
                data: 'updated',
                render: function (updated) {
                    if (updated == null || updated === "") return "---"; else return updated;
                }
            },
            {
                className: 'select-checkbox',
                orderable: false,
                data: null,
                defaultContent: ''
            }
        ],
        select: {
            style: 'multi',
            selector: 'td:last-child'
        },
        columnDefs: [
            {
                "targets": 0,
                "width": "5%",

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
                "width": "15%",
            },
            {
                "targets": 5,
                "width": "15%",
            },
            {
                "targets": 5,
                "width": "5%",
            },
            {className: "text-center mt-auto mb-auto", targets: "_all"},
            {className: "text-break", targets: "_all"}
        ],
        "language": {
            "lengthMenu": "Hiển thị _MENU_ dòng",
            "zeroRecords": "Không tìm thấy dữ liệu",
            "info": "Hiển thị trang _PAGE_ trên _PAGES_",
            "infoEmpty": "Không có dữ liệu",
            "infoFiltered": "(lọc từ _MAX_ dòng dữ liệu)",
            "search": "<div id='button-container' style='display: inline-block;'></div> Tìm kiếm",
            "paginate": {
                "previous": "Trước",
                "next": "Tiếp theo"
            }
        },
        "pagingType": "full_numbers",
        "lengthMenu": [5, 10, 15, 20],
        "order": [[0, "asc"]],
    });

    const button = $('<button id="custom-button" class="btn btn-red p-2">Delete</button>');
    $('#button-container').append(button);
    // Handle custom button click event
    button.on('click', function () {
        const selectedRows = table.rows({selected: true}).data();
        console.log(selectedRows);
    });

    // Handle 'Select All' checkbox
    $('#select-all').on('click', function () {
        if (this.checked) {
            table.rows().select();
            $('#custom-button').show();
        } else {
            table.rows().deselect();
            $('#custom-button').hide();
        }
    });

    // Handle row select/deselect events to update 'Select All' checkbox and button visibility
    table.on('select deselect', function () {
        const allRows = table.rows().count();
        const selectedRows = table.rows({selected: true}).count();

        if (selectedRows === allRows) {
            $('#select-all').prop('checked', true);
        } else {
            $('#select-all').prop('checked', false);
        }

        if (selectedRows > 0) {
            $('#custom-button').show();
        } else {
            $('#custom-button').hide();
        }
    });
</script>
</body>
</html>
