const validate = function (element, validator, Function = (form) => {
}, container = ".param-content") {
    $(element).validate({
            ignore: [],
            rules: validator.rules,
            messages: validator.messages,
            errorElement: "div", // Thẻ HTML sẽ hiển thị thông báo lỗi
            errorPlacement: function (error, element) {
                // Đặt vị trí hiển thị thông báo lỗi
                error.addClass("invalid-feedback");
                element.closest(container).append(error);
            },
            highlight: function (element, errorClass, validClass) {
                // Highlight lỗi
                $(element).addClass(errorClass).removeClass(validClass);
                $(element).closest(container).addClass("has-error");
            },
            unhighlight: function (element, errorClass, validClass) {
                // Xóa highlight khi hợp lệ
                $(element).removeClass(errorClass).removeClass(validClass);
                $("#" + element.id + "-error").remove();
            },
            submitHandler: function (form) {
                Function(form)
            }
        }
    )

}