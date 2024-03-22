<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>

    <%@include file="/layout/public/link.jsp" %>
    <meta charset="UTF-8">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/addProjectPage.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.css"/>" rel="stylesheet">

    <title>Thêm loại dự án</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp" %>
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/project_management">QL Dự án</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/category_management">QL loại dự
                        án</a>
                    </li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Thêm loại dự
                        án</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-100">
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Thêm Loại dự án</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center p-0">
                                <button class="btn btn-warning p-2 waves-effect waves-light" id="save" type="button">LƯU
                                </button>
                        </div>
                    </div>
                    <div>
                        <div class="row flex-center h-auto">
                            <div class="card col-lg-10 mb-4">
                                <div class="card-body">
                                    <div class="mb-4">
                                        <label for="name" class="labels">Tên dự án</label>
                                        <input id="name" type="text" class="form-control"
                                               placeholder="Tên dự án" value="">
                                    </div>
                                    <div class="mb-4">
                                        <label for="status" class="labels">Trạng thái</label>
                                        <select id="status"  class="browser-default custom-select">
                                            <option value="1" selected>Kích hoạt</option>
                                            <option value="2">Ẩn</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard/ckeditor/ckeditor.js"/>"></script>

<%--<script>--%>
<%--    $('#save').click(function () {--%>
<%--        console.log(123)--%>
<%--        let form = new FormData();--%>
<%--        form.append('name', $('#name').val());--%>
<%--        form.append('status', $('#status').val());--%>
<%--        $.ajax({--%>
<%--            url: "/api/category?action=add",--%>
<%--            type: 'POST',--%>
<%--            dataType: "json",--%>
<%--            // contentType: false,--%>
<%--            // processData: false,--%>
<%--            // data: form,--%>
<%--            success: function (data) {--%>
<%--                console.log(data.responseText)--%>
<%--            },--%>
<%--            error: function (data) {--%>
<%--                console.log(data.responseText)--%>
<%--                var err = JSON.parse(data.responseText);--%>
<%--                console.log(err)--%>
<%--                for (let e of err) {--%>
<%--                    console.log(e.name, e.message)--%>
<%--                    fetchErr(e.name, e.message);--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
        $('#save').click(function () {

        $.ajax({
            url: '/api/admin/category?action=add',
            type: 'POST',
            // processData:false,
            // contentType:false,
            data: {
                name: $('#name').val(),
                status: $('#status').val()
            },
            // dataType: "json",
            // contentType: 'application/json',

            success: function (data) {
                console.log(data)
                // save
                obj = JSON.parse(data);
                delayNotify(0,obj.message);
                if (obj.name == "success") {
                    setTimeout(() => {
                        setTimeout(() => {
                            $('#centralModalSm').modal('hide');
                            window.location.href = obj.data;
                        }, 1000)
                    }, 2000);

                }
            },
            error: function (data) {
                console.log(data.responseText)
                var err = JSON.parse(data.responseText);
                // console.log(e.name, e.message)
                fetchErr(err.name, err.message);
            }
        })
    })
</script>
<script>
    function fetchErr(name, mess) {
        console.log(name, mess)
        switch (name) {
            case 'name':
                let name = document.getElementById('name');
                name.classList.add('border-danger');
                name.classList.add('text-danger');
                name.value = "";
                name.setAttribute('value', " ");
                name.setAttribute('placeholder', mess);
                break;
            // case 'status':
            // let status = document.getElementById('status');
            // status.classList.add('border-danger');
            // status.classList.add('text-danger');
            // status.value = "";
            // status.setAttribute('value', " ");
            // status.setAttribute('placeholder', mess);
            //     break;
        }
    }
</script>
<script>
    CKEDITOR.replace('service-des');
    CKEDITOR.config.width = "100%";
    CKEDITOR.config.height = "400px";
</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
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
</body>
</html>