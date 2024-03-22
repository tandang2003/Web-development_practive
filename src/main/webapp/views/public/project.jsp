<!doctype html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@include file="/layout/common.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/project.css"/>" rel="stylesheet">
    <title>DỰ ÁN</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<main class="my-body">
    <div class="container">
        <!--        breadcrumb -->
        <div id="section-1" class="bc-icons-2">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-white small">
                    <li class="breadcrumb-item">
                        <a class="black-brown-text breadcrumb-size" href="/">
                            <i class="fa-solid fa-house"></i>
                        </a>
                    </li>
                    <li>
                        <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                    </li>
                    <li class="breadcrumb-item active breadcrumb-size">
                        <a class="black-text text-uppercase font-weight-bolder" href="#">Dự án</a>
                    </li>
                </ol>
            </nav>
        </div>
        <!--    end breadcrumb-->
        <div class="sub-container">
            <section>
                <h1 class="text-center mb-5"
                    style="color:#E90808; font-family: Inter,Arial, Helvetica, sans-serif; font-weight: 700;">Dự án</h1>
                <!--choose price-->
                <div class="row justify-content-center mb-4 ml-2" id="spinner-filters">

                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="category" id="categoryId" class="form-control">
                                <option value="">Loại</option>
                                <c:forEach items="${sessionScope.categories}" var="cat">
                                    <option value="${cat.id}" <c:if test="${category.id==cat.id}"> selected</c:if>>${cat.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="service" id="serviceId" class="form-control">
                                <option value="">Loại dịch vụ</option>
                                <c:forEach var="service" items="${sessionScope.services}">
                                    <option value="${service.id}">${service.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="address" id="provinceId" class="form-control">
                                <option value="" selected>Chọn tỉnh thành</option>
                                <c:forEach items="${provinces}" var="province">
                                    <option value="${province.id}">${province.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="area" id="area" class="form-control">
                                <option value="">Diện tích</option>
                                <c:forEach items="${acreages}" varStatus="loop" var="area">
                                    <option value="${loop.index+1}">${area}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3 text-center">
                        <div class="form-outline">
                            <select name="area" id="price" class="form-control">
                                <option value="">Kinh phí</option>
                                <c:forEach items="${prices}" varStatus="loop" var="price">
                                    <option value="${loop.index+1}">${price.strType}</option>
                                </c:forEach>
                                </option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 text-center">
                        <button type="button" onclick="searching()" class="btn btn-info btn-search">Tìm</button>
                    </div>
                </div>
                <!--end choose price-->

                <!-- Tab panels -->
                <div class="tab-content pt-0">

                    <!--Panel 1-->
                    <div class="tab-pane fade in show active" id="panel11" role="tabpanel">
                        <br>
                        <div class="row" id="project-container">
                        </div>
                    </div>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination pg-blue" id="container-button">
                        <li class="page-item ">
                            <a class="page-link" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link">1</a></li>
                        <li class="page-item active">
                            <a class="page-link">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link">3</a></li>
                        <li class="page-item ">
                            <a class="page-link">Next</a>
                        </li>
                    </ul>
                </nav>

            </section>

        </div>

    </div>
</main>
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script>
    function effectButton(){
        let pageItem= document.getElementsByClassName('page-item');
        for (let i = 0; i < pageItem.length; i++) {
            pageItem[i].addEventListener('click', function () {
                for (let j = 0; j < pageItem.length; j++) {
                    if(pageItem[j].classList.contains('active') ) pageItem[j].classList.remove('active');
                }
                this.classList.add('active');
            })
        }
    }
    function getProject(i) {
        $.ajax({
            url: "/api/project/search",
            type: "POST",
            // dataType: "json",
            data: i,
            success: function (response) {
                console.log('project');
                console.log(response);
                let data = JSON.parse(response);
                console.log(data)
                drawProject(data);
                return false;
            },
            error: function (response) {
                console.log('error');
                console.log(response);
            }
        })
    }


</script>
<script>
    function searching() {
        let data = {
            "categoryId": $('#categoryId').val(),
            "provinceId": $('#provinceId').val(),
            "serviceId": $('#serviceId').val(),
            "price": $('#price').val(),
            "area": $('#area').val(),
        }
        if (data.categoryId === "") {
            delete data.categoryId;
        }
        if (data.provinceId === "") {
            delete data.provinceId;
        }

        if (data.serviceId === "") {
            delete data.serviceId;
        }
        if (data.price === "") {
            delete data.price;
        }
        if (data.area === "") {
            delete data.area;
        }
        getSize(data);
        getProject($.param(data), 0);
    }

    function getSize(data) {
        let fdata = data;
        if (fdata == null) {
            fdata = {
                "categoryId": $('#categoryId').val(),
                "provinceId": $('#provinceId').val(),
                "serviceId": $('#serviceId').val(),
                "price": $('#price').val(),
                "area": $('#area').val(),
            }
            if (fdata.categoryId === "") {
                delete fdata.categoryId;
            }
            if (fdata.provinceId === "") {
                delete fdata.provinceId;
            }

            if (fdata.serviceId === "") {
                delete fdata.serviceId;
            }
            if (fdata.price === "") {
                delete fdata.price;
            }
            if (fdata.area === "") {
                delete fdata.area;
            }
        }
        console.log($.param(fdata))
        $.ajax({
            url: "/api/project/search/length",
            type: "POST",
            data: fdata,
            success: function (response) {
                let data = response;
                console.log(data)
                drawButton($.param(fdata), response);
                window.history.replaceState(null, null, "/project?" + $.param(fdata));
                return false;
            },
            error: function (response) {
                console.log('error');
                console.log(response);
            }
        })
    }

    function getProject(data, i) {
        console.log('get project');
        if (data == null) {
            data = 'offset=' + i;
        } else data += "&offset=" + i;
        console.log(data)
        $.ajax({
            url: "/api/project/search",
            type: "POST",
            // dataType: "json",
            data: data,
            success: function (response) {
                console.log('project');
                console.log(response);
                let data = JSON.parse(response);
                console.log(data)
                drawProject(data);
                return false;
            },
            error: function (response) {
                console.log('error');
                console.log(response);
            }
        })
    }
</script>
<script>
    function drawButton(fdata, size) {
        console.log(size)
        let data = fdata != null && fdata !== "" ? fdata : 'null';
        let container = document.getElementById('container-button');
        let page = '';
        page +=
            ' <li class="page-item page-0 " >' +
            '  <a class="page-link " onClick="getProject(\'' + data +
            '\',0)" >Trang đầu</a>' +
            '</li>'

        for (let i = 0; i < size; i++) {
            if (i === 0) {
                page +=
                    '<li class="page-item active page-' + i + '">' +
                    '<a class="page-link " onclick="getProject(\'' + data + '\',' + i + ')">' + i + '</a></li>'

            } else
                page += '<li class="page-item page-' + i + '">' +
                    '<a class="page-link" onclick="getProject(\'' + data + '\',' + i + ')">' + i + '</a></li>'
        }
        page +=
            ' <li class="page-item page-' + (size - 1) + '" >' +
            '  <a class="page-link" onClick="getProject(\'' + data + '\',' + (size - 1) + ')" >Trang cuối</a>' +
            '    </li>'
        console.log(page)
        container.innerHTML = page;
        effectButton();
        console.log('button:' + container.innerHTML)
    }


    function drawProject(data) {
        let container = document.getElementById('project-container');
        container.innerHTML = "";
        let project = '';
        for (const x of data) {
            console.log(x.isSave);
            project += '<div' +
                ' class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">'
                + '<div'
                + ' class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">';
            if (x.isSave) project += ' <i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'
            else project += '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>';
            project += '<a href="/post/project?id=' + x.id + '">'
                + '<img src="' + x.avatar + '"'
                + ' class="w-100">'
                + ' <input type="hidden" class="project-id" value=' + x.id + '>'
                + ' <div class="w-100 position-absolute projectCard-content">'
                + '  <div class="mask justify-content-center d-flex h-100"'
                + ' style="background-color: rgba(48, 48, 48, 0.72);">'
                + '<div class="align-items-center flex-column d-flex w-100"><h6'
                + ' class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">'
                + x.title + '</h6>'
                + '<p class="text-white p-0 id-project">'
                + '<strong>MDA:' + x.id + '</strong>'
                + '</p>'
                + '<p class="text-white p-4 vanBan" name="test">'+x.description+'</p>'
                + '</div>'
                + '</div></div></a></div></div>'
        }
        container.innerHTML = project;
    }
</script>
<script>
    window.onload = searching();
</script>
<script>
    function like(project) {
        let id = $(project).parent().find('.project-id').val();
        console.log(id);
        $.ajax({
            url: "/api/save_project",
            type: "GET",
            data: {
                "projectId": id
            },
            success: function (response) {
                console.log(response);
                let resp = JSON.parse(response);
                if (resp.name == 'save') {
                    project.classList.replace("fa-regular", "fa-solid")
                } else if (resp.name == 'delete')
                    project.classList.replace("fa-solid", "fa-regular")
                //= "fa-solid fa-bookmark position-absolute";
                // console.log(p);
            },
            error: function (response) {
                console.log(response.responseText)
                let resp = JSON.parse(response.responseText);
                window.location.href = resp.data;
            }
        })
    }
</script>
<script>
    // while click fa-regular fa-bookmark change to fa-solid fa-bookmark
    // $(document).ready(function () {
    //     $('.fa-bookmark').click(function () {
    //         $(this).toggleClass('fa-regular fa-bookmark fa-solid fa-bookmark');
    //     });
    // });
</script>
<script>
    function gioiHanChuVaThemDauCham(className, gioiHan) {
        var elements = document.getElementsByClassName(className);

        if (!elements || elements.length === 0) {
            console.error("Không tìm thấy phần tử với class: " + className);
            return;
        }

        for (var i = 0; i < elements.length; i++) {
            var vanBan = elements[i].textContent;

            if (vanBan.length > gioiHan) {
                // Cắt đoạn văn bản và thêm dấu ba chấm
                var vanBanGioiHan = vanBan.slice(0, gioiHan) + '...' + ' xem thêm';
                elements[i].textContent = vanBanGioiHan;
            }
        }
    }

    // Sử dụng hàm
    var className = "vanBan"; // Class của thẻ p
    var gioiHanSoChu = 220;

    setTimeout(()=>{
        gioiHanChuVaThemDauCham(className, gioiHanSoChu);
    },400);
</script>
</body>
</html>