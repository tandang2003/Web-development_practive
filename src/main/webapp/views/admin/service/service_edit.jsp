<%--
  Created by IntelliJ IDEA.
  User: Clover
  Date: 11/12/2023
  Time: 2:05 PM
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
    <link href=" <c:url value="/template/css/admin-datatable.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">

    <title>Title</title>
</head>
<body>
<!-- Sidebar navigation -->
<div class="wrapper">
    <%@include file="/layout/admin/adminheader.jsp"%>
    <div class="main-container">
        <div class="container p-0">
            <nav class="" aria-label="breadcrumb">
                <ol class="breadcrumb m-0 bg-white">
                    <li class="breadcrumb-item"><a class="black-text"
                                                   href="/admin/dashboard">Thống
                        kê</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="black-text"
                                                   href="/admin/service">QL
                        Dịch vụ</a></li>
                    <li><i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i></li>
                    <li class="breadcrumb-item"><a class="main-color" href="#">Chỉnh sửa dịch vụ</a></li>
                </ol>
            </nav>
            <main class="container shadow border p-3 h-auto">
                <form action="#" method="post" id="addproject">
                    <div class="border-bottom pb-3 mb-3 ml-1 mr-1 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center p-0">
                            <h3 class="font-weight-bold main-color m-0">Chỉnh sửa dịch vụ</h3>
                        </div>
                        <div class="d-flex">
                            <ul class="nav nav-pills  d-flex font-weight-bold align-items-center" id="pills-tab"
                                role="tablist">
                                <li class="">
                                    <a class="nav-link active " id="pills-home-tab" data-toggle="pill"
                                       href="#pills-home"
                                       role="tab"
                                       aria-controls="pills-home" aria-selected="true">Thông tin</a>
                                </li>
                                <li class="">
                                    <a class="nav-link " id="pills-profile-tab" data-toggle="pill"
                                       href="#pills-profile"
                                       role="tab"
                                       aria-controls="pills-profile" aria-selected="false">Bài viết</a>
                                </li>
                            </ul>
                        </div>
                        <div class="btn-save flex-center">
                            <button form="addproject" id="save" class="btn btn-warning p-2 waves-effect waves-light"
                                    type="button"> LƯU
                            </button>
                        </div>
                    </div>

                    <div class="tab-content pt-2 pl-1 h-auto" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                             aria-labelledby="pills-home-tab">
                            <div class="edit-profile d-flex justify-content-center">
                                <div class="col-md-8 mb-4">
                                    <!-- Card -->
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <!-- Card content -->
                                        <div class="card-body card-body-cascade">
                                            <div class="row flex-center">
                                                <div class="col-lg-11 mb-4">
                                                    <div class="card-body">
                                                        <div class="mb-4">
                                                            <label for="name" class="labels">Tiêu đề</label>
                                                            <input id="name" type="text" class="form-control"
                                                                   placeholder="Tiêu đề" value="${service.name}">
                                                        </div>
                                                        <div class="mb-4">
                                                            <div class="form-group green-border-focus">
                                                                <label for="description">Mô tả</label>
                                                                <textarea class="form-control"
                                                                          id="description"
                                                                          rows="3">${service.description}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="mb-4">
                                                            <label for="status" class="labels">Trạng thái</label>
                                                            <select id="status" class="browser-default custom-select">

                                                                <option value="1"
                                                                        <c:if test="${service.status==1}">selected</c:if>>
                                                                    Hiện dịch vụ
                                                                </option>
                                                                <option value="0"
                                                                        <c:if test="${service.status==0}">selected</c:if>>
                                                                    Ẩn dịch vụ
                                                                </option>
                                                            </select>
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
                                        <!-- Card content -->
                                    </div>
                                    <!-- Card -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                             aria-labelledby="pills-profile-tab">
                            <div class="edit-profile d-flex justify-content-center">
                                <div class="col-md-12 mb-12">
                                    <div class="card card-cascade cascading-admin-card user-card">
                                        <div class="card-body card-body-cascade">
                                            <div class="col-lg-12 col-md-12 p-0">
                                                <div class="form-group">
                                                 <textarea
                                                         class="form-control rounded-0"
                                                         id="post"
                                                         rows="10">${post.content}
                                                 </textarea>
                                                    <!--                                                    <textarea id="sample">Hi</textarea>-->
                                                </div>
                                            </div>
                                        </div>
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
<script src="<c:url value="/template/lib/DataTables/DataTables-1.13.6/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/template/lib/ckeditor_4.22.1_standard/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<%--<script src="<c:url value="/template/js/inputFile.js"/>"></script>--%>
<script>
    const srcToFile = async (src, fileName) => {
        const response = await axios.get(src, {
            responseType: "blob",
        });
        const mimeType = response.headers["content-type"];
        return new File([response.data], fileName, {type: mimeType});
    };

</script>
<script>
    function saveService(id) {
        let form = new FormData();
        form.append('name', $("#name").val());
        form.append('status', $("#status").val());
        form.append('description', $("#description").val());
        if ($("#avatar").prop('files').length !== 0)
            form.append('avatar', $("#avatar").prop('files')[0]);
        else form.append('notHave', '1');
        form.append('postId', id);
        form.append('id', ${service.id});
        $.ajax({
            url: "/api/admin/service?action=edit",
            type: "POST",
            // dataType: "json",
            processData: false,
            contentType: false,
            data: form,
            success: function (data) {
                console.log(data.responseText)
                obj = JSON.parse(data);
                if(obj.name == "success" || obj.name=="sys"){
                    delayNotify(2000, obj.message);
                    setTimeout(()=>{
                        window.location.href = obj.data;
                    }, 2000);
                }
            },
            error: function (data) {
                console.log(data.responseText)
                var err = JSON.parse(data.responseText);

                for (const e of err) {
                    console.log(e.name, e.message)
                    fetchErr(e.name, e.message);
                }
            }
        })
    }
</script>
<script>
    $('#save').click(function () {
        let content = CKEDITOR.instances.post.getData();
        $.ajax({
            url: "/api/admin/post?action=edit",
            type: 'POST',
            dataType: "json",
            data: {
                content: content,
                id:${post.id}
            },
            success: function (data) {
                console.log("success post")
                saveService(data.data.id);
            },
            error: function (data) {
                console.log(data)
                // saveService(data.data.id);
                var err = JSON.parse(data.responseText);

                for (const e of err) {
                    console.log(e.name, e.message)
                    fetchErr(e.name, e.message);
                }
            }
        })
    })

</script>
<script>
    function fetchErr(name, mess) {
        switch (name) {
            case 'name' :
                let name = document.getElementById('name');
                name.classList.add('border-danger');
                name.classList.add('text-danger');
                name.value = "";
                name.setAttribute('value', "");
                name.setAttribute('placeholder', mess);
                break;
            case 'description' :
                let description = document.getElementById('description');
                description.classList.add('border-danger');
                description.classList.add('text-danger');
                description.value = "";
                description.setAttribute('value', "");
                description.setAttribute('placeholder', mess);
                break;

        }
    }
</script>
<script>
    let allFiles = [];
    let input = document.getElementById("avatar");
    let container = document.getElementsByClassName("img-container");
    // console.log(input.files)
    if (input.files.length == 0 && allFiles.length == 0) {
        let images = ' ';
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
        images += '<div class="image position-relative border-radius"><img src="${service.avatar}" alt="" class="border"> ' +
            '<div class="position-absolute " ></div></div>'
        container[0].innerHTML = images;
    }

    input.addEventListener('change', function () {
        let files = this.files;
        allFiles = [];
        for (let i = 0; i < files.length; i++) {
            allFiles.push(files[i])
        }
        showImage();
    })

    const showImage = () => {
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
        if (input.files.length == 0) {
            let images = ' ';
            images += '<div class="image position-relative border-radius"><img src="${service.avatar}" alt="" class="border"> ' +
                '<div class="position-absolute " ></div></div>'
            container[0].innerHTML = images;
        } else {
            let images = ' ';
            allFiles.forEach((e, i) => {
                images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
                    '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
            })
            container[0].innerHTML = images
        }
    }
    let dt = new DataTransfer();
    const delImage = index => {
        let dt = new DataTransfer();
        for (let i = 0; i < input.files.length; i++) {
            if (index !== i)
                dt.items.add(input.files[i]) // here you exclude the file. thus removing it.
        }
        input.files = dt.files
        allFiles = Array.from(input.files)
        showImage()
    }
    // document.onload = function () {
    //         if(input.files.length!== 0) {
    //         input.files
    //         }
    // };

</script>

<script>
    CKEDITOR.replace('post', {
        width: "100%",
        height: "400px",
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
