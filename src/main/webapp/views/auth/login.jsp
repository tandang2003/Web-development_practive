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
    <%--        <%@ include file="/layout/public/link.jsp" %>--%>
    <link href="<c:url value="/template/lib/fontawesome-free-6.4.2-web/css/all.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/template/css/login.css"/> ">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <title>Đăng nhập</title>
</head>
<body>

<div class="container" id="container">
    <div class="form-container sign-up">
        <a class="icon-arrow arrow-sign-up" href="home"><i
                class="fa-solid fa-arrow-left"></i></a>
        <%--        form đăng ký--%>
        <form id="sign-up">
            <h1>Tạo tài khoản</h1>
            <span>Thông tin đăng nhập</span>
            <div class="scrollable-container">
                <div class="param-content">
                    <input type="text" name="name" id="fullname" placeholder="Tên">
                </div>
                <div class="param-content">
                    <input type="email" name="email" id="email-signup" placeholder="Tên tài khoản / Email">
                </div>
                <div class="param-content">
                    <input type="password" name="password" id="password-signup" placeholder="Mật khẩu">
                </div>
                <div class="param-content">
                    <input type="password" name="rePassword" id="verifypassword-sigup" placeholder="Xác nhận mật khẩu">
                </div>
                <div class="param-content">
                    <input type="text" name="phone" id="phone-sigup" placeholder="Số điện thoại">
                </div>
                <div style="display: flex;width: 100%">
                    <div class="param-content">
                        <input class="birth" name="birthday" id="birthday" type="date" placeholder="Ngày sinh">
                    </div>
                    <div class="param-content" style="flex-direction: row;
    height: 100%;
    display: flex;
    align-items: center;justify-content: space-around">
                        <label style="display: flex;margin-left: 7%;">
                            <input name="gender" id="isMale" type="checkbox" value="1" checked>
                            <p style="margin: auto; padding: 6%; top:6%; font-size: 16px">Nam</p>
                        </label>
                        <label style="display: flex;margin-left: 7%;">
                            <input name="gender" id="isFemale" type="checkbox" value="0">
                            <p style="margin: auto; padding: 6%; top:6%; font-size: 16px">Nữ</p>
                        </label>
                    </div>
                </div>
                <div class="param-content">
                    <select class="mdb-select md-form" name="province" id="province" searchable="Search here..">
                        <option value="" disabled selected>Chọn tỉnh thành</option>
                    </select>
                </div>
                <div class="param-content">

                    <select class="mdb-select md-form" name="district" id="district" searchable="Search here..">
                        <option value="" disabled selected>Quận / huyện</option>
                    </select></div>
                <div class="param-content">
                    <select class="mdb-select md-form" name="ward" id="ward" searchable="Search here..">
                        <option value="" disabled selected>Phường / xã</option>
                    </select>
                </div>
            </div>
            <p id="error-message-signup" style="color: red;"></p>
            <button type="submit" id="sign-up-button">Đăng kí</button>
        </form>
    </div>
    <div class="form-container forgot-password">
        <div class="arrow-container">
            <a class="icon-arrow" href="home"><i
                    class="fa-solid fa-arrow-left"></i></a>
        </div>
        <%--        form quên mật khẩu--%>
        <form id="forget-password">
            <h1>Quên mật khẩu</h1>
            <span>Nhập email để đặt lại mật khẩu</span>
            <div class="param-content">
                <input id="email-forgot" name="email" type="email" placeholder="Email">
            </div>
            <a id="showSignInForm" href="#">Đăng nhập ?</a>
            <p id="error-message-forgot" style="color: red; display: none"></p>
            <button type="submit" id="request-button">Gửi yêu cầu đặt lại mật khẩu</button>
        </form>
    </div>
    <div class="form-container sign-in">
        <div class="arrow-container">
            <a class="icon-arrow" href="home"><i
                    class="fa-solid fa-arrow-left"></i></a>
        </div>
        <%--        form đăng nhập--%>
        <form id="login-form">
            <h1>Đăng Nhập</h1>
            <div class="social-icons">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/other-login/google&response_type=code
    &client_id=766966245473-e2eo1ucq62m5pngngo2qu1e7s1d6doea.apps.googleusercontent.com&approval_prompt=force"
                   class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                <a href="https://www.facebook.com/v11.0/dialog/oauth?client_id=883337960300752&redirect_uri=http://localhost:8080/other-login/facebook&scope=email,public_profile"
                   class="icon"><i class="fa-brands fa-facebook"></i></a>
            </div>
            <span>Đã có tài khoản</span>
            <div class="param-content">
                <input name="email" type="email" placeholder="Email" id="email-signin"></div>
            <div class="param-content">
                <input name=password type="password" placeholder="Mật khẩu" id="password-signin">
            </div>
            <a id="showForgotPassword" href="#">Quên mật khẩu?</a>
            <div class="g-recaptcha" data-sitekey="6LduXxAqAAAAAPy6T9DAjx9Q1ADdSyTd7NkKQbTX"></div>
            <button id="login-button" type="submit" value="Submit">Đăng Nhập</button>
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
                <button class="" id="showSignIn">Đăng nhập</button>
                <!--                <button class="hidden" id="login">Đăng nhập</button>-->
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Xin chào!</h1>
                <p>Đăng ký với thông tin cá nhân của bạn</p>
                <button class="" id="showSignUp">Đăng kí</button>
                <%--           <button class="hidden" id="register">Đăng kí</button>--%>
            </div>
        </div>
    </div>
</div>

<%@include file="/layout/public/script.jsp" %>
<script src="<c:url value="/template/js/login.js"/> "></script>
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script src="<c:url value='/template/js/dataAddress.js'/>"></script>

<%--<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>--%>
<script>

    $(document).ready(function () {
        validate("#forget-password", forgetPasswordValidator, function (form) {
            $.ajax({
                url: '/api/reset-password',
                type: 'POST',
                data: $(form).serializeArray(),
                dataType: 'json',
                success: function (result) {
                    if (result.status === '200') {
                        autoCloseAlertWithFunction(data.message, 3000, swal2Icon.SUCCESS, () => {
                            window.location.reload();
                        })
                    } else {
                        autoCloseAlertIcon(mes = result.message, time = 3000, icon = swal2Icon.ERROR, url = null);

                    }
                },
                error: function (error) {
                }
            })
        })
        validate("#sign-up", signUpValidator, function (form) {
            $.ajax({
                url: '/api/register',
                type: 'POST',
                data: $(form).serialize(),
                dataType: 'json',
                // contentType: 'application/json',
                success: function (result) {
                    console.log(result)
                    if (result.name === 'success') {
                        autoCloseAlertWithFunction(result.message, 3000, swal2Icon.SUCCESS, () => {
                            window.location.reload();
                        })
                    } else {
                        autoCloseAlertIcon(mes = result.message, time = 3000, icon = swal2Icon.ERROR, url = null);
                    }
                },
                error: function (error) {
                    errorAlert("Hệ thống đang gặp sự cố vui lòng thực hiện lại sau")
                }
            });
        });
    });
    validate('#login-form', loginValidator, function (form) {
        var recaptchaResponse = grecaptcha.getResponse();
        if (recaptchaResponse.length === 0) {
            alert('Please verify that you are not a robot.', 'error')
            return;
        }

        $.ajax({
            url: '/api/login',
            type: 'POST',
            data: $(form).serializeArray().concat({name: 'g-recaptcha-response', value: recaptchaResponse}),
            dataType: 'json',
            success: function (result) {
                console.log(result);
                if (result.status === 200) {
                    autoCloseAlertWithFunction(result.message, 1500, swal2Icon.SUCCESS, function () {
                            window.location.href = result.redirect;
                        }
                    );
                } else {
                    autoCloseAlertIcon(mes = result.message, time = 3000, icon = swal2Icon.ERROR, url = null);
                }
            },
            error: function (error) {
                errorAlert("Hệ thống đang gặp sự cố vui lòng thực hiện lại sau");
            }
        });
    })

</script>
</body>
</html>