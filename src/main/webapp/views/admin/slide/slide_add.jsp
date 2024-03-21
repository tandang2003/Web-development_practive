<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 04/12/2023
  Time: 2:03 PM
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
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/dataTables.bootstrap4.css"/>" rel="stylesheet">
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
                        <a class="black-text" href="/admin/slide">QL slide</a>
                    </li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item">
                        <a class="main-color" href="#">Thêm Slide</a>
                    </li>
                </ol>
            </nav>

            <main class="container shadow border p-3 h-auto">
<%--                <form action="/admin/slide/add" method="post" enctype="multipart/form-data">--%>
                    <div class="row border-bottom pb-3 mb-3 ml-1 mr-1  justify-content-lg-between">
                        <div class="col-6 d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Thêm Slide</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end align-items-center p-0">
                            <button class="btn btn-warning p-2 waves-effect waves-light" id="save" type="button">LƯU</button>
                        </div>
                    </div>
                    <div>
                        <div class="row flex-center h-auto">
                            <div class="card col-lg-10 mb-4">
                                <div class="card-body">
                                    <div class="mb-4">
                                        <label for="title" class="labels">Tiêu đề</label>
                                        <input id="title" type="text" class="form-control"
                                               placeholder="Tiêu đề" value="">
                                    </div>
                                    <div class="mb-4">
                                        <label for="status" class="labels">Trạng thái</label>
                                        <select id="status" class="browser-default custom-select">
                                            <option value="1">Kích hoạt</option>
                                            <option value="0">Ẩn</option>
                                        </select>
                                    </div>
                                    <div class="mb-4">
                                        <label for="sequence" class="labels">STT</label>
                                            <input id="sequence" type="text" class="form-control"
                                                   placeholder="STT" value="">
                                    </div>
                                    <div class="mb-4">
                                        <div class="input-group mt-2 d-flex align-items-center">
                                            <label>Chọn hình đại diện</label>
                                            <div class="file-field d-flex align-items-center">
                                                <div class="btn btn-primary btn-sm float-left waves-effect waves-light">
                                                    <span>chọn ảnh</span>
                                                    <input type="file" name="avatar"
                                                           id="avatar"
                                                           accept="image/*">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="upload-wrapper d-none avatar">
                                            <div class="border d-flex img-container">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%--                </form>--%>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->

<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/inputFile.js"/>"></script>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/dataTables.bootstrap4.min.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
    $('#save').click(function () {
        console.log(123)
        let form = new FormData();
        form.append('title', $('#title').val());
        form.append('status', $('#status').val());
        form.append('sequence', $('#sequence').val());
        form.append('avatar', $('#avatar').prop('files')[0]);
        $.ajax({
            url: "/api/admin/slider/add",
            type: 'POST',
            dataType: "json",
            contentType: false,
            processData: false,
            data: form,
            success: function (data) {
                console.log(data)
                if(data.name == 'success' || data.name == 'sys'){
                    delayNotify(2000,data.message);
                    setTimeout(()=>{
                        window.location.href = data.data;
                    }, 2000);

                }
            },
            error: function (data) {
                console.log(data.responseText)
                let err = JSON.parse(data.responseText);
                // saveService(data.data.id);
                for (let key of err) {
                    fetchErr(key.name, key.message);
                }
                // fetchErr(data.responseJSON.name, data.responseJSON.message);
            }
        });
    });
</script>
<script>
    function fetchErr(name, message) {
    console.log(name, message)
        switch (name){
            case "title":
                let title = document.getElementById('title');
                title.classList.add('border-danger');
                title.classList.add('text-danger');
                title.value = "";
                title.setAttribute('placeholder', message);
                break;
            case "status":
                let status = document.getElementById('status');
                status.classList.add('border-danger');
                status.classList.add('text-danger');
                status.value = "";
                status.setAttribute('placeholder', message);
                break;
            case "sequence":
                let sequence = document.getElementById('sequence');
                sequence.classList.add('border-danger');
                sequence.classList.add('text-danger');
                sequence.value = "";
                sequence.setAttribute('placeholder', message);
                break;
            case "avatar":
                break

    }
    }
</script>
<script>
    let title = document.getElementById('title');
    title.addEventListener('click', function () {
        title.classList.remove('border-danger');
        title.classList.remove('text-danger');
        title.setAttribute('placeholder', 'Tiêu đề');
    })
    let status = document.getElementById('status');
    status.addEventListener('click', function () {
        status.classList.remove('border-danger');
        status.classList.remove('text-danger');
        status.setAttribute('placeholder', 'Trạng thái');
    })
    let sequence = document.getElementById('sequence');
    sequence.addEventListener('click', function () {
        sequence.classList.remove('border-danger');
        sequence.classList.remove('text-danger');
        sequence.setAttribute('placeholder', 'STT');
    })
</script>
<script>
    $(document).ready(function () {
        $(".sidebar-btn").click(function () {
            $(".wrapper").toggleClass("mycollapse");
        });
    });</script>
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
