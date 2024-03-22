<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<html>
<head>
    <%@include file="/layout/public/link.jsp" %>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href=" <c:url value="/template/lib/DataTables/DataTables-1.13.6/css/jquery.dataTables.min.css"/>"
          rel="stylesheet">
    <link href=" <c:url value="/template/lib/DataTables/datatables.min.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/admin-nav-bar.css"/>" rel="stylesheet">
    <title>Title</title>
</head>
<body>
!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp"%>
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/dashboard">Thống
                        kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/service">QL
                        Dịch vụ</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text" href="/admin/post_service">QL bài viết dịch vụ </a>
                    </li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa bài viết dịch vụ</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">

                <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center p-0 ">
                        <h3 class="font-weight-bold main-color m-0">Chỉnh sửa bài viết</h3>
                    </div>

                    <div class="btn-save flex-center">
                        <button class="btn btn-warning p-2 waves-effect waves-light" id="save" type="button"> LƯU
                        </button>
                    </div>
                </div>
                <div class="col-md-12 mb-4">
                    <div class="card card-cascade cascading-admin-card user-card">
                        <div class="card-body card-body-cascade">
                            <div class="col-lg-12 col-md-12 p-0">
                                <div class="form-group">
                                        <textarea class="form-control rounded-0" name="content" rows="10"
                                                  id="service-des">${post.content}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </main>
        </div>
    </div>
</div>
<!--/. Sidebar navigation -->


<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard/ckeditor/ckeditor.js"/>"></script>
<script>
    $('#save').click(function () {
        let content = CKEDITOR.instances['service-des'].getData();
        let id = ${post.id};
        $.ajax({
            url: "/api/admin/post?action=edit",
            type: "POST",
            dataType: "json",
            data: {
                content: content,
                id: ${post.id}
            },
            success: function (data) {
               if(data.name == "success" || data.name == "sys"){
                   delayNotify(2000, data.message);
                   setTimeout(()=>{
                       window.location.href = "/admin/service";
                       // window.location.href = data.data;
                   }, 2000);
               }
            },
            error: function (data) {
                //thông báo lỗi sys
                console.log(data)
            }
        })

    })
</script>
<script>
    CKEDITOR.replace('service-des');
    CKEDITOR.config.width = "100%";
    CKEDITOR.config.height = "800px";
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
