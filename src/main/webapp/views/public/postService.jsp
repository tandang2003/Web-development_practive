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
    <title class="text-uppercase"></title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<!--start content-->
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
                            <i
                                    class="fas fa-caret-right mx-2"
                                    aria-hidden="true"></i></li>
                        <li class="breadcrumb-item breadcrumb-size p-0">
                            <a class="black-text text-uppercase"
                               href="/service">Dịch vụ</a>
                            <i
                                    class="fas fa-caret-right mx-2"
                                    aria-hidden="true"></i>
                        </li>
                        <li class="breadcrumb-item active breadcrumb-size p-0">
                            <a class="black-text text-uppercase service-name"
                               href="#"></a></li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-8 col-lg-8 post-content position-relative">
                <h1 class="text-center mb-3 mt-3 post-title text-uppercase service-name"></h1>
                <p class="font-italic"><strong>Ngày đăng: <span class="service-update"></span></strong></p>

                <div class="service-post-content" style="max-width: 100%">
                    <div class="company-address"></div>
                    <h6 class="mt-2 mb-2">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</h6>
                    <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP. HCM</p>
                    <p>Hotline: 0935 671 886</p>
                    <p>Email: xaydungnhadep@gmail.com</p>
                    <p>Website: nhadep.asia</p>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 col-lg-4 recommed-box ">
                <div class="wrapper-feature-news mt-3 mb-1 h-100">
                    <div class="sticky-top" style="z-index: 1; top:80px">
                        <div class="feature-news-header">
                            <p class="text-uppercase main-color"><i class="fa-solid fa-caret-right mr-2">
                            </i> bạn có thể quan tâm</p>
                        </div>
                        <ul class="feature-news-list">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--end content-->
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script>
    let id = window.location.href.substring(window.location.href.lastIndexOf('/'))
    console.log(id)
    $.ajax({
        url: '/api/post/services' + id,
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            let service = data.data;
            document.title = service.name
            $('.service-name').text(service.name)
            $('.service-update').text(service.updatedAt)
        }
    })
    $.ajax({
        url: '/api/post/services/' + id + '/post',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            let post = data.data;
            $('.service-post-content').html(post.content + $('.service-post-content').html())
        }
    })
    $.ajax({
        url: '/api/post/services/' + id + '/suggest',
        dataType: 'json',
        type: 'GET',
        success: function (data) {
            let suggestServices = data.data;
            console.log(suggestServices)

            let suggestServiceHtml = ''
            suggestServices.forEach(service => {
                suggestServiceHtml += `
 <li class="feature-news-items mb-2">
                                                    <a href="post/services/\${service.id}"
                                                       class="feature-news-items-link d-flex row"
                                                       role="link">
                                                        <div class="feature-news-items-img d-block hover-image col-5 pr-0">
                                                            <img src="\${service.avatar}" alt="">
                                                        </div>
                                                        <div class="feature-news-items-info col-6 pl-0">
                                                            <div class="feature-news-items-info-title text-uppercase">
                                                                    \${service.name}
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
               `
            })
            $('.feature-news-list').html(suggestServiceHtml)
        }
    })
</script>
</body>
</html>