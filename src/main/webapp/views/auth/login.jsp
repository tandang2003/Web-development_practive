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
        <%--        form đăng ký--%>
        <form id="sign-up">
            <h1>Tạo tài khoản</h1>
            <span>Thông tin đăng nhập</span>
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
                    <%--                <c:forEach items="${provinces}" var="province">--%>
                    <%--                    <option value="${province.name}">${province.name}</option>--%>
                    <%--                </c:forEach>--%>
                </select>
            </div>
            <div class="param-content">

                <select class="mdb-select md-form" name="district" id="district" searchable="Search here..">
                    <option value="" disabled selected>Quận / huyện</option>
                    <%--                <c:forEach items="${districts}" var="district">--%>
                    <%--                    <option value="${district.name}">${district.name}</option>--%>
                    <%--                </c:forEach>--%>
                </select></div>
            <div class="param-content">
                <select class="mdb-select md-form" name="ward" id="ward" searchable="Search here..">
                    <option value="" disabled selected>Phường / xã</option>
                    <%--                <c:forEach items="${wards}" var="district">--%>
                    <%--                    <option value="${ward.name}">${ward.name}</option>--%>
                    <%--                </c:forEach>--%>
                </select>
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
            <input type="hidden" name="action" value="login"/>
            <h1>Đăng Nhập</h1>
            <div class="social-icons">
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:8080/other-login/google&response_type=code
    &client_id=766966245473-e2eo1ucq62m5pngngo2qu1e7s1d6doea.apps.googleusercontent.com&approval_prompt=force"
                   class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
            </div>
            <span>Đã có tài khoản</span>
            <div class="param-content">
                <input name="email" type="email" placeholder="Email" id="email-signin"></div>
            <div class="param-content">
                <input name=password type="password" placeholder="Mật khẩu" id="password-signin">
            </div>
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
<script src="<c:url value="/template/js/validation/validator.js"/>"></script>
<script src="<c:url value="/template/js/validation/validateFunction.js"/>"></script>
<script src="<c:url value='/template/js/dataAddress.js'/>"></script>

<%--<script src="<c:url value="/template/js/admin-modal-notify.js"/>"></script>--%>
<script>
    if (${error!=null}) {
        alert('${error}')
    }
</script>
<script>

    $(document).ready(function () {
        validate("#forget-password", forgetPasswordValidator, function (form) {
            $.ajax({
                url: '/api/reset-password',
                type: 'POST',
                data: $(form).serializeArray(),
                // contentType: 'application/json',
                success: function (result) {
                    // if (result == 'success') {
                    //     window.location.href = '/RealEstateWeb_war_exploded/home';
                    // } else {
                    //     $('#error-message-signin').text(result);
                    //     $('#error-message-signin').css('display', 'block');
                },
                error: function (error) {

                }
            })
        })
        validate("#sign-up", signUpValidator, function (form) {
            $.ajax({
                url: '/api/register',
                type: 'POST',
                data: $(form).serializeArray(),
                dataType: 'json',
                // contentType: 'application/json',
                success: function (result) {
                    if (result.name === 'success') {
                        autoCloseAlertWithFunction(mes = result.message, icon = swal2Icon.SUCCESS, function () {
                                window.location.href = result.data;
                            }
                        );
                    } else {
                        autoCloseAlert(mes = result.message, icon = swal2Icon.ERROR);
                    }
                },
                error: function (error) {
                    errorAlert("Hệ thống đang gặp sự cố vui lòng thực hiện lại sau")
                }
            });
        });
    });
    validate('#login-form', loginValidator, function (form) {
        $.ajax({
            url: '/api/login',
            type: 'POST',
            data: $(form).serializeArray(),
            dataType: 'json',
            success: function (result) {

                if (result.status === 200) {
                    autoCloseAlertWithFunction(mes = result.message, icon = swal2Icon.SUCCESS, function () {
                            window.location.href = result.redirect;
                        }
                    );
                } else {
                    autoCloseAlert(mes = result.message, icon = swal2Icon.ERROR);
                }
            },
            error: function (error) {
                errorAlert("Hệ thống đang gặp sự cố vui lòng thực hiện lại sau")
            }
        });
    })

    // $('#request-button').click(function () {
    //     let data = {
    //         email: $('#email-forgot').val()
    //     }
    //     $.ajax({
    //         url: '/api/reset-password',
    //         type: 'POST',
    //         data: data,
    //         // contentType: 'application/json',
    //         success: function (result) {
    //             console.log("success")
    //             console.log(result);
    //             // if (result == 'success') {
    //             //     window.location.href = '/RealEstateWeb_war_exploded/home';
    //             // } else {
    //             //     $('#error-message-signin').text(result);
    //             //     $('#error-message-signin').css('display', 'block');
    //         },
    //         error: function (error) {
    //             console.log("error")
    //             console.log(error);
    //
    //         }
    //     })
    // })
</script>
<script>
    // $('#sign-up-button').click(function () {
    //     let data = {
    //         fullname: $('#fullname').val(),
    //         birthday: $('#birthday').val(),
    //         isMale: $('#isMale').is(':checked'),
    //         isFemale: $('#isFemale').is(':checked'),
    //         province: $('#province').val(),
    //         district: $('#district').val(),
    //         ward: $('#ward').val(),
    //         phone: $('#phone-sigup').val(),
    //         email: $('#email-signup').val(),
    //         password: $('#pasword-signup').val(),
    //         verifypassword: $('#verifypassword-sigup').val()
    //     }
    //     $.ajax({
    //         url: '/api/register',
    //         type: 'POST',
    //         data: data,
    //         dataType: 'json',
    //         success: function (result) {
    //             console.log("success")
    //             console.log(result);
    //             obj = JSON.parse(result.name);
    //
    //             if (obj.name === 'success' || obj.name === 'sys') {
    //             }
    //         },
    //         error: function (error) {
    //             console.log("error")
    //
    //             console.log(error);
    //             // let obj = JSON.parse(error.responseText);
    //             // for (let i of obj) {
    //             //     fetchErr(i.name, i.message)
    //             // }
    //
    //             // delayNotify(2000, 'abv');
    //         }
    //     })
    // })
</script>

</body>
</html>