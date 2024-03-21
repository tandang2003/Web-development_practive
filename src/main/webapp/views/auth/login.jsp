<%@include file="/layout/common.jsp" %>
<%--<%@ page isELIgnored="false" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%--    <%@ include file="/layout/link.jsp" %>--%>
    <link href="<c:url value="/template/lib/fontawesome-free-6.4.2-web/css/all.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/template/css/login.css"/> ">
    <title>Đăng nhập</title>
</head>
<body>

<div class="container" id="container">
    <div class="form-container sign-up">
        <a class="icon-arrow arrow-sign-up" href="home"><i
                class="fa-solid fa-arrow-left"></i></a>
        <form id="sign-up">
            <h1>Tạo tài khoản</h1>
            <span>Thông tin đăng nhập</span>
            <input type="text" name="name" id="fullname" placeholder="Tên">
            <div style="display: flex;width: 100%">
                <input class="birth" name="birthday" id="birthday" type="date" placeholder="Ngày sinh">
                <label style="display: flex;margin-left: 7%;">
                    <input name="isMale" id="isMale" type="checkbox" checked>
                    <p style="margin: auto; padding: 6%; top:6%; font-size: 16px">Nam</p>
                </label>
                <label style="display: flex;margin-left: 7%;">
                    <input name="isFemale" id="isFemale" type="checkbox">
                    <p style="margin: auto; padding: 6%; top:6%; font-size: 16px">Nữ</p>
                </label>
            </div>
            <!--            <input type="address" placeholder="Địa chỉ">-->
            <select class="mdb-select md-form" name="address" id="mdb-select" searchable="Search here..">
                <option value="" disabled selected>Chọn tỉnh thành</option>
                <c:forEach items="${provinces}" var="province">
                    <option value="${province.name}">${province.name}</option>
                </c:forEach>
            </select>
            <input type="email" name="email" id="email-signup" placeholder="Tên tài khoản / Email">
            <input type="password" name="password" id="pasword-signup" placeholder="Mật khẩu">
            <input type="password" name="verifypassword" id="verifypassword-sigup" placeholder="Xác nhận mật khẩu">
            <input type="text" name="verifypassword" id="phone-sigup" placeholder="Số điện thoại">
            <p id="error-message-signup" style="color: red;"></p>
            <button type="button" id="sign-up-button">Đăng kí</button>
        </form>
    </div>
    <div class="form-container forgot-password">
        <div class="arrow-container">
            <a class="icon-arrow" href="home"><i
                    class="fa-solid fa-arrow-left"></i></a>
        </div>
        <form id="forget-password">
            <h1>Quên mật khẩu</h1>
            <span>Nhập email để đặt lại mật khẩu</span>
            <input id="email-forgot" name="email-forgot" type="email" placeholder="Email">
            <a id="showSignInForm" href="#">Đăng nhập ?</a>
            <p id="error-message-forgot" style="color: red; display: none"></p>
            <button type="button" id="request-button">Gửi yêu cầu đặt lại mật khẩu</button>
        </form>
    </div>
    <div class="form-container sign-in">
        <div class="arrow-container">
            <a class="icon-arrow" href="home"><i
                    class="fa-solid fa-arrow-left"></i></a>
        </div>
        <form action="/login" method="post" id="sign-in">
            <input type="hidden" name="action" value="login"/>
            <h1>Đăng Nhập</h1>
            <div class="social-icons">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/other-login/google&response_type=code
    &client_id=766966245473-e2eo1ucq62m5pngngo2qu1e7s1d6doea.apps.googleusercontent.com&approval_prompt=force"
                   class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
            </div>
            <span>Đã có tài khoản</span>
            <input name="email" type="email" placeholder="Email" id="email-signin">
            <input name=password type="password" placeholder="Mật khẩu" id="password-signin">
            <a id="showForgotPassword" href="#">Quên mật khẩu?</a>
            <p id="error-message-signin" style="color: red; display: none"></p>
            <button id="login-button" type="submit">Đăng Nhập</button>
        </form>
    </div>
    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <div class="arrow-container">
                    <a class="icon-arrow" href="home"><i
                            class="fa-solid fa-arrow-left"></i></a>
                </div>
                <h1>Chào mừng quay trở lại!</h1>
                <p>Đăng nhập với thông tin cá nhân của bạn</p>
                <button class="hidden" id="showSignIn">Đăng nhập</button>
                <!--                <button class="hidden" id="login">Đăng nhập</button>-->
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Xin chào!</h1>
                <p>Đăng ký với thông tin cá nhân của bạn</p>
                <button class="hidden" id="showSignUp">Đăng kí</button>
                <!--                <button class="hidden" id="register">Đăng kí</button>-->
            </div>
        </div>
    </div>
</div>

<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/login.js"/> "></script>
<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>
<script>
    if (${error!=null}) {
        alert('${error}')
    }
</script>
<script>
    $('#request-button').click(function () {
        let data = {
            email: $('#email-forgot').val()
        }
        $.ajax({
            url: '/api/reset-password',
            type: 'POST',
            data: data,
            // contentType: 'application/json',
            success: function (result) {
                console.log("success")
                console.log(result);
                // if (result == 'success') {
                //     window.location.href = '/RealEstateWeb_war_exploded/home';
                // } else {
                //     $('#error-message-signin').text(result);
                //     $('#error-message-signin').css('display', 'block');
            },
            error: function (error) {
                console.log("error")
                console.log(error);

            }
        })
    })
</script>
<script>
    $('#sign-up-button').click(function () {
        let data = {
            fullname: $('#fullname').val(),
            birthday: $('#birthday').val(),
            isMale: $('#isMale').is(':checked'),
            isFemale: $('#isFemale').is(':checked'),
            province: $('#mdb-select').val(),
            phone: $('#phone-sigup').val(),
            email: $('#email-signup').val(),
            password: $('#pasword-signup').val(),
            verifypassword: $('#verifypassword-sigup').val()
        }
        $.ajax({
            url: '/api/register',
            type: 'POST',
            data: data,
            // contentType: 'application/json',
            success: function (result) {
                console.log("success")
                console.log(result);
                obj = JSON.parse(result.name);
                delayNotify(2000, obj.message);
                if (obj.name == 'success' || obj.name == 'sys') {
                    // delayNotify(2000, obj.message);
                }
                // if (result == 'success') {
                //     window.location.href = '/RealEstateWeb_war_exploded/home';
                // } else {
                //     $('#error-message-signin').text(result);
                //     $('#error-message-signin').css('display', 'block');
            },
            error: function (error) {
                console.log("error")

                console.log(error);
                let obj = JSON.parse(error.responseText);
                for (let i of obj) {
                    fetchErr(i.name, i.message)
                }

                // delayNotify(2000, 'abv');
            }
        })
    })
</script>
<script>
    function fetchErr(name, mess) {
        switch (name) {
            case 'fullname':
                let fullname = document.getElementById('fullname');
                fullname.classList.add("border-red")
                fullname.classList.add("text-red")
                fullname.value = ''
                fullname.setAttribute("placeholder", mess)
                break;
            case 'birthday':
                let birthday = document.getElementById('birthday');
                birthday.classList.add("border-red")
                birthday.classList.add("text-red")
                birthday.value = ''
                birthday.setAttribute("placeholder", mess)
                break;
            case 'province':
                let province = document.getElementById('mdb-select');
                province.classList.add("border-red")
                province.classList.add("text-red")
                province.value = ''
                province.setAttribute("placeholder", mess)
                break;
            case 'phone':
                let phone = document.getElementById('phone-sigup');
                phone.classList.add("border-red")
                phone.classList.add("text-red")
                phone.value = ''
                phone.setAttribute("placeholder", mess)
                break;
            case 'email':
                let email = document.getElementById('email-signup');
                email.classList.add("border-red")
                email.classList.add("text-red")
                email.value = ''
                email.setAttribute("placeholder", mess)
                break;
            case 'password':
                let password = document.getElementById('pasword-signup');
                password.classList.add("border-red")
                password.classList.add("text-red")
                password.value = ''
                password.setAttribute("placeholder", mess)
                break;
            case 'verifypassword':
                let verifypassword = document.getElementById('verifypassword-sigup');
                verifypassword.classList.add("border-red")
                verifypassword.classList.add("text-red")
                verifypassword.value = ''
                verifypassword.setAttribute("placeholder", mess)
                break;
        }
    }
</script>
<%--<script>--%>
<%--    $('#login-button').click(function () {--%>
<%--        let data = {--%>
<%--            email: $('#email-signin').val(),--%>
<%--            password: $('#password-signin').val()--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            url: '/api/login',--%>
<%--            type: 'POST',--%>
<%--            data: data,--%>
<%--            // contentType: 'application/json',--%>
<%--            success: function (result) {--%>
<%--                console.log("success")--%>
<%--                console.log(result);--%>
<%--                // if (result == 'success') {--%>
<%--                //     window.location.href = '/RealEstateWeb_war_exploded/home';--%>
<%--                // } else {--%>
<%--                //     $('#error-message-signin').text(result);--%>
<%--                //     $('#error-message-signin').css('display', 'block');--%>
<%--            },--%>
<%--            error: function (error) {--%>
<%--                console.log("error")--%>
<%--                console.log(error);--%>
<%--            }--%>
<%--        })--%>
<%--    })--%>
<%--</script>--%>

</body>
</html>