<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/layout/common.jsp" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <%@ include file="/layout/public/link.jsp" %>
    <link href=" <c:url value="/template/css/contact.css"/>" rel="stylesheet">
    <title>Liên hệ</title>
</head>
<body>
<%@include file="/layout/public/header.jsp" %>
<!--start content-->
<!--start content-->
<!--        Start breadcrumb -->
<div class="container">
    <div id="section-1" class="bc-icons-2 container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white small" style="">
                <li class="breadcrumb-item">
                    <a class="black-text breadcrumb-size hover-red" href="/">
                        <i class="fas fa-home"></i>
                    </a>
                </li>
                <li>
                    <i class="fas fa-caret-right mx-2 black-brown-text" aria-hidden="true"></i>
                </li>
                <li class="breadcrumb-item active breadcrumb-size">
                    <a class="text-uppercase font-weight-bolder black-text" href="#">LIÊN HỆ</a>
                </li>
            </ol>
        </nav>
    </div>
</div>
<!--    end breadcrumb-->
<div id="card">
    <div>
        <h5 class="section-heading h1 pt-4 text-center bottom redbockdoor font-weight-bold">Gửi thư đến chúng
            tôi</h5>
    </div>
    <div class="bg-light">
        <div class="row d-flex flex-wrap container">
            <div class="item col-lg-6 col-md-12 col-sm-12 w-100">
                <img class="w-100"
                     src="https://cms.luatvietnam.vn/uploaded/Images/Original/2020/01/17/gia-nhan-cong-xay-dung_1701151934.jpg">
            </div>
            <div class="item col-lg-6 col-md-10 col-sm-12 w-100 container">
                <div>
                    <p class="text-uppercase text-center font-weight-bold p-lg-4">thông tin liên hệ</p>
                </div>
                <div class="bg-white listContent">
                    <ul class="align-content-lg-start p-0">
                        <li class="text-center">
                            <p class="font-weight-bold">CÔNG TY XÂY DỰNG TMĐT NHÀ XINH</p>
                            <p>Địa chỉ: 254/5/41 Lê Văn Thọ, P.11, Q. Gò Vấp, TP HCM</p>
                            <p>Số Điện Thoại: 0935 671 886 </p>
                            <p>Email: xaydungnhaxinh72@gmail.com</p>
                            <p>Website: nhaxinh.asia</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--    end wraper contact-->
<div id="section-3" class="container">
    <div id="modal"></div>
    <!--Section: Contact v.1-->
    <section class="section pb-4 pt-5">
        <!--Section heading-->

        <!--Section description-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-5 mb-4">
                <!--Form with header-->
                <form class="card" action="" method="post">
                    <div class="card-body">
                        <!--Header-->
                        <!--Body-->
                        <div class="md-form">
                            <i class="fas fa-user prefix grey-text"></i>
                            <input type="text" id="fullName" class="form-control">
                            <label for="fullName">Họ và tên</label>
                        </div>
                        <div class="md-form">
                            <i class="fas fa-envelope prefix grey-text"></i>
                            <input type="text" id="email" class="form-control">
                            <label for="email">Địa chỉ email</label>
                        </div>
                        <div class="md-form">
                            <i class="fa-solid fa-map-location prefix grey-text"></i>
                            <input type="text" id="address" class="form-control">
                            <label for="address">Địa chỉ(tỉnh/thành phố)</label>
                        </div>
                        <div class="md-form">
                            <i class="fa-solid  fa-phone prefix grey-text"></i>
                            <input type="text" id="phone" class="form-control">
                            <label for="phone">Số điện thoại</label>
                        </div>
                        <%--                            <div class="row">--%>
                        <%--                                <div class=" black-brown-text font-weight-bold text-uppercase text-lg-center col-6 flex-center">--%>
                        <%--                                    <!--                            <label>Chủ đề</label>-->--%>
                        <%--                                    <select id="categoryId" class="browser-default custom-select mb-4">--%>
                        <%--                                        <option value="" disabled="">Loại dự án</option>--%>
                        <%--                                        <c:forEach var="category" items="${categories}">--%>
                        <%--                                            <option value="${category.id}">${category.name}</option>--%>
                        <%--                                        </c:forEach>--%>
                        <%--                                    </select>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="form-outline col-6">--%>
                        <%--                                    <input type="text" id="projectId" class="form-control" placeholder="Mã dự án">--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>

                        <!-- Message -->
                        <div class="form-group">
                                <textarea class="form-control rounded-0" id="content" rows="3"
                                          placeholder="Lời nhắn" style="height: 250px"></textarea>
                        </div>
                        <div class="text-center mt-4">
                            <button class="btn btn-red waves-effect waves-light" onclick="saveContact()"
                                    type="button">Gửi ngay
                            </button>
                        </div>
                    </div>
                </form>
                <!--Form with header-->

            </div>

            <div class="col-lg-7 mb-4">

                <!--Google map-->
                <div id="map-container-google-11" class="z-depth-1-half map-container-6 h-100"
                     style="height: 453px">
                    <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4247.872564543886!2d106.79040908333542!3d10.870529759247004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1695713054142!5m2!1svi!2s"
                            width="200" height="150" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">

                    </iframe>
                </div>

                <br>
                <!--Buttons-->

            </div>
        </div>
    </section>
    <!--Section: Contact v.1-->
</div>
<!--    end main contact-->
<!--end content-->
<!--end content-->
<%@include file="/layout/public/footer.jsp" %>
<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/main.js"/>"></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
    function saveContact() {
        $.ajax({
            url: '/api/contact/save',
            type: 'Post',
            dataType: 'json',
            data: {
                fullName: $('#fullName').val(),
                email: $('#email').val(),
                address: $('#address').val(),
                phone: $('#phone').val(),
                content: $('#content').val(),
            },
            success: function (data) {
                // let resp = JSON.parse(data);
                // if (resp.status === 200) {
                //     alert(resp.message);
                //     window.location.reload();
                // } else {
                //     alert(resp.message);
                // }
                delayNotify(1000, data.message);
                if(data.name == "success"){
                    setTimeout(()=>{
                        window.location.reload();
                    }, 1000);
                }

            },
            error: function (data) {
                //bắt lỗi email
                console.log(data);
                var e = JSON.parse(data.responseText);
                console.log(e.name, e.message)
                fetchErr(e.name, e.message);

            }

        })
    }
</script>
<script>
    function fetchErr(name, mess) {
        console.log(name, mess)
        switch (name) {
            // case 'fullName':
            //     let fullName = document.getElementById('fullName');
            //     fullName.classList.add('border-danger');
            //     fullName.classList.add('text-danger');
            //     fullName.value = "";
            //     fullName.setAttribute('value', "");
            //     fullName.setAttribute('placeholder', mess);
            //     break;
            case 'email':
                let email = document.getElementById('email');
                email.classList.add('border-danger');
                email.classList.add('text-danger');
                email.value = "";
                email.setAttribute('value', "");
                // email.setAttribute('placeholder', mess);
                break;
            // case 'address':
            //     let address = document.getElementById('address');
            //     address.classList.add('border-danger');
            //     address.classList.add('text-danger');
            //     address.value = "";
            //     address.setAttribute('value', " ");
            //     address.setAttribute('placeholder', mess);
            //     break;

        }
    }
</script>
<script>
    let fullName = document.getElementById('email');
    fullName.addEventListener('click', function () {
        fullName.classList.remove('border-danger');
        fullName.classList.remove('text-danger');
        fullName.setAttribute('placeholder', "Email");
    })
</script>
</body>
</html>