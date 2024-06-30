const contactValidation = {
    rules: {
        fullName: {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        email: {
            required: true,
            email: true
        },
        phone: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 12
        },
        content: {
            required: true,
            minlength: 10
        },
        provinceValue: {
            required: true
        },
        districtValue: {
            required: true
        },
        wardValue: {
            required: true
        }
    },
    messages: {
        fullName: {
            required: "Vui lòng nhập họ và tên",
            minlength: "Họ và tên ít nhất {0} ký tự",
            maxlength: "Họ và tên tối đa {0} ký tự"
        },
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        phone: {
            required: "Vui lòng nhập số điện thoại",
            digits: "Số điện thoại chỉ được nhập số",
            minlength: "Số điện thoại ít nhất {0} số",
            maxlength: "Số điện thoại tối đa {0} số"
        },
        content: {
            required: "Vui lòng nhập nội dung lời nhắn",
            minlength: "Nội dung lời nhắn ít nhất {0} ký tự"
        },
        provinceValue: {
            required: "Vui lòng chọn tỉnh thành",
            notEqualToDefault: "Vui lòng chọn một tỉnh thành khác"
        },
        districtValue: {
            required: "Vui lòng chọn quận/huyện",
            notEqualToDefault: "Vui lòng chọn một quận/huyện khác"
        },
        wardValue: {
            required: "Vui lòng chọn phường/xã",
            notEqualToDefault: "Vui lòng chọn một phường/xã khác"
        }
    },
}
const loginValidator = {
    rules: {
        email: {
            required: true,
            email: true
        },
        password: {
            required: true,
            minlength: 6
        }
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        password: {
            required: "Vui lòng nhập mật khẩu",
            minlength: "Mật khẩu ít nhất {0} ký tự"
        }
    }
}
const signUpValidator = {
    rules: {
        email: {
            required: true,
            email: true
        },
        password: {
            required: true,
            minlength: 6
        },
        rePassword: {
            required: true,
            equalTo: "#password"
        },
        phone: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 12
        },
        fullName: {
            required: true,
            minlength: 6,
            maxlength: 50
        },
        birthday: {
            required: true
        },
        gender: {
            required: true
        },
        province: {
            required: true
        },
        district: {
            required: true
        },
        ward: {
            required: true
        },
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        password: {
            required: "Vui lòng nhập mật khẩu",
            minlength: "Mật khẩu ít nhất {0} ký tự"
        },
        rePassword: {
            required: "Vui lòng xác nhận mật khẩu",
            equalTo: "Mật khẩu không khớp"
        }
        ,
        phone: {
            required: "Vui lòng nhập số điện thoại",
            digits: "Số điện thoại chỉ được nhập số",
            minlength: "Số điện thoại ít nhất {0} số",
            maxlength: "Số điện thoại tối đa {0} số"
        },
        fullName: {
            required: "Vui lòng nhập họ và tên",
            minlength: "Họ và tên ít nhất {0} ký tự",
            maxlength: "Họ và tên tối đa {0} ký tự"
        },
        birthday: {
            required: "Vui lòng chọn ngày sinh"
        },
        gender: {
            required: "Vui lòng chọn giới tính"
        },
        province: {
            required: "Vui lòng chọn tỉnh thành"
        },
        district: {
            required: "Vui lòng chọn quận/huyện"
        },
        ward: {
            required: "Vui lòng chọn phường/xã"
        }
    }
};
const forgetPasswordValidator = {
    rules: {
        email: {
            required: true,
            email: true
        }
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        }
    }
}

