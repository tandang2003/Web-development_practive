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
    <link href=" <c:url value="/template/css/projectPost.css"/>" rel="stylesheet">
    <link href=" <c:url value="/template/css/fileInput.css"/>" rel="stylesheet">
    <style>
        .upload-wrapper .image > div, .upload-wrapper .image1 > div {
            top: 2.5%;
            right: 5%;
        }
    </style>
    <title>${project.title}</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<section id="PostContent">
    <!--start breadcrumb-->

    <!--end breadcrumb-->
    <div class="container">
        <div>
            <div class="bc-icons-2">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-white breadcrumb-font">
                        <li class="breadcrumb-item p-0"><a class="black-text breadcrumb-size" href="/"><i
                                class="fas fa-home"></i></a>
                            <i class="fas fa-caret-right mx-2" aria-hidden="true"></i></li>
                        <li class="breadcrumb-item breadcrumb-size p-0">
                            <a class="black-text text-uppercase" href="#">Dự án</a>
                            <i class="fas fa-caret-right mx-2" aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active breadcrumb-size p-0">
                            <a class="black-text text-uppercase" href="#">${project.title}</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-8 col-lg-8 post-content position-relative">
                <c:choose>
                    <c:when test="${project.saveBy==auth.id}">
                        <i class="fa-solid fa-bookmark position-absolute " onclick="like(this)"
                           style="z-index: 1000; left: 1%; top:22px; font-size: 25px"></i>
                    </c:when>
                    <c:otherwise>
                        <i class="fa-regular fa-bookmark position-absolute " onclick="like(this)"
                           style="z-index: 1000; left: 1%; top:22px; font-size: 25px"></i>

                    </c:otherwise>
                </c:choose>
                <h1 class="text-center mb-3 mt-3 post-title text-uppercase">${project.title}</h1>
                <div class="row">

                    <p class="font-italic col-lg-5 col-md-5 col-sm-12 m-0"><strong>Ngày đăng: ${project.updatedAt}; Mã
                        dự án:
                        ${project.id}</strong></p>
                    <%--                    Thiết kế, Sửa chữa--%>
                    <p class="font-italic col-lg-7 col-md-7 col-sm-12 m-0"><strong><span>Loại dự án: ${project.category};</span>
                        <span>Loại dịch vụ: <c:forEach items="${services}" var="service" varStatus="loop">
                            ${service.name}<c:if test="${not loop.last}">,</c:if>
                        </c:forEach> </span></strong></p>
                </div>


                <div class="gallery position-relative h-auto mb-3 ">
                    <c:forEach items="${gallery}" var="image">
                        <div class="img position-relative w-100 h-100 overflow-hidden ">
                            <img class="" src="${image}" alt="Image">
                        </div>
                    </c:forEach>
                </div>
                <div class="post-content-text" style="max-width: 100%">
                    ${post.content}

                    <div class="company-address">
                        <h6 class="mt-2 mb-2">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</h6>
                        <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP. HCM</p>
                        <p>Hotline: 0935 671 886</p>
                        <p>Email: xaydungnhadep@gmail.com</p>
                        <p>Website: nhadep.asia</p></div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-4 recommed-box ">
                <div class="wrapper-feature-news mt-3 mb-1 h-100">
                    <div class="feature-news-header">
                        <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                        </i>Đặt ngay cho bạn</p>
                    </div>
                    <div class="sticky-top" style="z-index: 1; top:80px">

                        <form class="card " action="post?action=cast" method="post">
                            <div class="card-body pl-3 pr-3">
                                <!--Header-->
                                <!--Body-->
                                <div class="md-form mt-1 mb-1 p-1">
                                    <input type="text" id="form-email" name="email"
                                           class="form-control form-input form-input p-1 m-0"
                                           style="font-size: 15px" value="${cart.email}">
                                    <label for="form-email" class="m-0" style="font-size: 15px"> <i
                                            class="fa-lg fas fa-envelope grey-text"></i>
                                        Địa chỉ email</label>
                                </div>
                                <div class="form-outline mt-1 mb-1">
                                    <label for="address" class="labels">Địa chỉ</label>
                                    <select name="address" id="address" class="form-control form-input">
                                        <option value="" disabled selected>Chọn tỉnh thành</option>
                                        <c:forEach items="${provinces}" var="province">
                                            <option value="${province.id}"
                                                    <c:if test="${province.id==cart.provinceId}">selected</c:if>>${province.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="row d-flex justify-content-between m-0 p-0 ">
                                    <!--                                <div class=" col-lg-5 col-md-5 col-sm-12 mb-3  p-0">-->
                                    <select name="category" id="category" class="form-control form-input md-form
                                     col-lg-6 col-md-6 col-sm-12 m-0 mt-2 p-0  p-1">
                                        <option value="" disabled="" selected="">Loại dự án</option>
                                        <c:forEach items="${categories }" var="category">
                                            <option value="${category.id}"
                                                    <c:if test="${category.id==cart.categoryId}">selected</c:if>> ${category.name}</option>
                                        </c:forEach>
                                    </select>
                                    <!--                                </div>-->
                                    <div class="form-outline col-lg-6 col-md-6 col-sm-12  mt-2 p-0 m-0 ">
                                        <input name="representProjectId" type="number" id="itProject"
                                               placeholder="Mã dự án"
                                               class="form-control form-input ml-md-2 p-1"
                                               value="${cart.representProjectId}">
                                    </div>
                                </div>
                                <div class="row  d-flex justify-content-between m-0 p-0">
                                    <div class="form-outline col-lg-6  col-md-6 col-sm-12 p-0 m-0">
                                        <label for="area-width" style="font-size: 13px">
                                            Chiều rộng(<span class="position-relative m-1">m<span
                                                class="position-absolute top right "
                                                style="font-size: 10px;">2</span></span> )</label>
                                        <input name="width" type="number" id="area-width"
                                               class="form-control form-input mr-2 p-1" value="${cart.width}">
                                    </div>
                                    <div class="form-outline col-lg-6 col-md-6 col-sm-12 p-0 m-0 ">
                                        <label for="area-length" class="ml-md-2" style="font-size: 13px">
                                            Chiều dài(<span class="position-relative m-1">m<span
                                                class="position-absolute top right "
                                                style="font-size: 10px;">2</span></span> )</label>
                                        <input name="height" type="number" id="area-length"
                                               class="form-control form-input ml-md-2 p-1" value="${cart.height}">
                                    </div>
                                </div>
                                <div class="">
                                    <label class="mdb-main-label" style="font-size: 13px">Dịch vụ</label>
                                    <select name="services" id="services" class="mdb-select md-form services" multiple>
                                        <c:forEach items="${sessionScope.services}" var="service">
                                            <option value="${service.id}"
                                                    <c:if test="${cart!=null&& cart.services!=null}">
                                                        <c:forEach var="item1"
                                                                   items="${cart.services}">
                                                            <c:if test="${service.id==item1}">
                                                                selected
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                            >${service.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="button" class="btn-save btn btn-primary btn-sm">Save</button>
                                </div>

                                <!-- Message -->
                                <form method="dialog" enctype="multipart/form-data" class="form-img">
                                    <div class="input-group mt-2">
                                        <div class="file-field d-flex align-items-center">
                                            <p class="m-0">khu vực thi công: </p>
                                            <div class="btn btn-primary btn-sm float-left">
                                                <span>chọn ảnh</span>
                                                <input name="image" type="file" id="file_input" multiple>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="upload-wrapper">
                                        <div class="border d-flex img-container">
                                        </div>
                                    </div>
                                </form>
                                <div class="text-center mt-4">
                                    <button class="btn btn-red" id="save" type="button">Đặt Ngay</button>
                                </div>
                            </div>
                        </form>

                        <div class="mt-2">
                            <div class="feature-news-header">
                                <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                                </i> bạn có thể quan tâm</p>
                            </div>
                            <ul class="feature-news-list">
                                <c:forEach items="${suggestProjects}" var="project">
                                    <li class="feature-news-items mb-2">
                                        <a href="project?id=${project.id}"
                                           class="feature-news-items-link d-flex row"
                                           role="link">
                                            <div class="feature-news-items-img d-block hover-image col-5 pr-0">
                                                <img src="${project.avatar}" alt="">
                                            </div>
                                            <div class="feature-news-items-info col-6 pl-0">
                                                <div class="feature-news-items-info-title text-uppercase">
                                                        ${project.title}
                                                </div>
                                                <div class="feature-news-items-info-date">
                                                    <i class="fa-solid fa-calendar-alt mr-2"></i>
                                                        ${project.updatedAt}
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script>
    $(document).ready(function () {
        $('.mdb-select').materialSelect();
    });
</script>
<script>
    let allFiles = [];
    let form = document.getElementsByClassName("form-img");
    let input = document.getElementById("file_input");
    let container = document.getElementsByClassName("img-container");
    if (input.files.length != 0) {
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
    } else {
        container[0].parentElement.classList.add('d-none')
        container[0].parentElement.classList.remove('d-block')
    }
    input.addEventListener('change', function () {
        let files = this.files;
        for (let i = 0; i < files.length; i++) {
            allFiles.push(files[i])
        }
        showImage();
    })
    const showImage = () => {
        if (input.files.length != 0) {
            container[0].parentElement.classList.add('d-block')
            container[0].parentElement.classList.remove('d-none')
        } else {
            container[0].parentElement.classList.add('d-none')
            container[0].parentElement.classList.remove('d-block')
        }
        let images = ' ';
        allFiles.forEach((e, i) => {
            images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
                '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
        })
        container[0].innerHTML = images
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
</script>
<script>
    $('#save').click(function () {
        let form = new FormData;
        form.append('email', $('#form-email').val())
        form.append('address', $('#address').val())
        form.append('representProjectId', $('#itProject').val())
        form.append('category', $('#category').val())
        form.append('width', $('#area-width').val())
        form.append("representProjectId",$('#representProjectId').val())
        form.append('width', $('#area-width').val())
        form.append('height', $('#area-length').val())
        form.append('services', $('#services').val())
        for (const x of $("#file_input").prop('files')) {
            form.append('image', x)
        }

        $.ajax({
            url: '/api/cart',
            type: 'post',
            data: form,
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
                console.log("save")
                alert(data[0].message)
                console.log(data)
            },
            error: function (e) {
                // console.log("false")
                console.log(e.responseText)
                let err = JSON.parse(e.responseText);
                for (let key of err) {
                    console.log(key.name, key.message)
                    fetchErr(key.name, key.message)
                }
            }
        })

    })
    $(document).ready(function () {
        $('select.services').change(function () {
            let value = $(this).val().toString();
            console.log(value)
            $.ajax({
                url: '/session/cart',
                type: 'get',
                data: {
                    name: 'services',
                    value: value
                },
                success: function (data) {
                    <%--console.log(${cart})--%>
                    console.log(data)
                },
                error: function (e) {
                    console.log(e)
                }
            })
        })
    })
    $('.form-input').blur(function () {
        let name = $(this).attr("name");
        let value = $(this).val();
        $.ajax({
            url: '/session/cart',
            type: 'get',
            data: {
                name: name,
                value: value
            },
            success: function (data) {
                <%--console.log(${cart})--%>
                console.log("run")
                console.log(data)
            },
            error: function (e) {
                console.log("err")
                console.log(e)
            }
        })

    });
</script>
<script>
    function like(project) {
        console.log(project.classList)
        $.ajax({
            url: "/api/save_project",
            type: "GET",
            data: {
                "projectId":${project.id}
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
    function fetchErr(name, mess) {
        console.log(name, mess)
        switch (name) {
            case'email':
                let email = document.getElementById('form-email')
                email.classList.add('border-danger');
                email.classList.add('text-danger');
                email.value = "";
                email.setAttribute('value', "");
// email.setAttribute('placeholder', mess);
                break;
            case'address':
                let address = document.getElementById('address')
                address.classList.add('border-danger');
                address.classList.add('text-danger');
                address.value = "";
                address.setAttribute('value', "");
                address.setAttribute('placeholder', mess);
                break;
            case'category':
                let category = document.getElementById('category')
                category.classList.add('border-danger');
                category.classList.add('text-danger');
                category.value = "";
                category.setAttribute('value', "");
                category.setAttribute('placeholder', mess);
                break;
            case'width':
                let width = document.getElementById('area-width')
                width.classList.add('border-danger');
                width.classList.add('text-danger');
                width.value = "";
                width.setAttribute('value', "");
                width.setAttribute('placeholder', mess);
                break;
            case'height':
                let height = document.getElementById('area-length')
                height.classList.add('border-danger');
                height.classList.add('text-danger');
                height.value = "";
                height.setAttribute('value', "");
                height.setAttribute('placeholder', mess);
                break;
            case'services':
                let services = document.getElementById('services')
                services.classList.add('border-danger');
                services.classList.add('text-danger');
                services.value = "";
                services.setAttribute('value', "");
                services.setAttribute('placeholder', mess);
                break;
            case'itProject':
                let itProject = document.getElementById('itProject')
                itProject.classList.add('border-danger');
                itProject.classList.add('text-danger');
                itProject.value = "";
                itProject.setAttribute('value', "");
                itProject.setAttribute('placeholder', mess);
                break;
        }
    }
</script>
<script>
    let email = document.getElementById('form-email')
    email.addEventListener('click', function () {
        email.classList.remove('border-danger');
        email.classList.remove('text-danger');
        email.setAttribute('placeholder', "");
    })

    let address = document.getElementById('address')
    address.addEventListener('click', function () {
        address.classList.remove('border-danger');
        address.classList.remove('text-danger');
        address.setAttribute('placeholder', "");
    })

    let category = document.getElementById('category')
    category.addEventListener('click', function () {
        category.classList.remove('border-danger');
        category.classList.remove('text-danger');
        category.setAttribute('placeholder', "");
    })

    let width = document.getElementById('area-width')
    width.addEventListener('click', function () {
        width.classList.remove('border-danger');
        width.classList.remove('text-danger');
        width.setAttribute('placeholder', "");
    })

    let height = document.getElementById('area-length')
    height.addEventListener('click', function () {
        height.classList.remove('border-danger');
        height.classList.remove('text-danger');
        height.setAttribute('placeholder', "");
    })

    let services = document.getElementById('services')
    services.addEventListener('click', function () {
        services.classList.remove('border-danger');
        services.classList.remove('text-danger');
        services.setAttribute('placeholder', "");
    })

    let itProject = document.getElementById('itProject')
    itProject.addEventListener('click', function () {
        itProject.classList.remove('border-danger');
        itProject.classList.remove('text-danger');
        itProject.setAttribute('placeholder', "");
    })
</script>
</body>
</html>