$.validator.addMethod("dateFormat", function (value, element) {
    // Check the format yyyy-MM-dd
    return this.optional(element) || /^\d{4}-\d{2}-\d{2}$/.test(value);
}, "Vui lòng nhập đúng định dạng yyyy-MM-dd");

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
            equalTo: "#password-signup"
        },
        phone: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 12
        },
        name: {
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
        name: {
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
const orderValidator = {
    rules: {
        email: {
            required: true,
            email: true
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
        width: {
            required: true,
            digits: true,
            min: 1
        },
        height: {
            required: true,
            digits: true,
            min: 1
        },
        category: {
            required: true
        },
        services: {
            required: true
        },
        uploadImg: {
            required: true,
        },
        project: {
            required: true,
            digits: true
        }
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        province: {
            required: "Vui lòng chọn tỉnh thành"
        },
        district: {
            required: "Vui lòng chọn quận/huyện"
        },
        ward: {
            required: "Vui lòng chọn phường/xã"
        },
        width: {
            required: "Vui lòng nhập chiều rộng",
            digits: "Chiều rộng chỉ được nhập số",
            min: "Chiều rộng phải lớn hơn {0}"
        },
        height: {
            required: "Vui lòng nhập chiều dài",
            digits: "Chiều dài chỉ được nhập số",
            min: "Chiều dài phải lớn hơn {0}"
        },
        category: {
            required: "Vui lòng chọn loại sản phẩm"
        },
        services: {
            required: "Vui lòng chọn loại dịch vụ"
        },
        uploadImg: {
            required: "Vui lòng chọn ảnh",
        },
        project: {
            required: "Vui lòng chọn dự án",
            digits: "Mã dự án chỉ được nhập số"
        }
    }
}
const userUpdator = {
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
        repassword: {
            equalTo: "#password"
        },
        phone: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 12
        },
        birthday: {
            required: true,
            dateFormat: true
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
        fullName: {
            required: "Vui lòng nhập họ và tên",
            minlength: "Họ và tên ít nhất {0} ký tự",
            maxlength: "Họ và tên tối đa {0} ký tự"
        },
        gender: {
            required: "Vui lòng chọn giới tính"
        },
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        repassword: {
            equalTo: "Mật khẩu không khớp"
        },
        phone: {
            required: "Vui lòng nhập số điện thoại",
            digits: "Số điện thoại chỉ được nhập số",
            minlength: "Số điện thoại ít nhất {0} số",
            maxlength: "Số điện thoại tối đa {0} số"
        },
        birthday: {
            required: "Vui lòng chọn ngày sinh",
            dateFormat: "Ngày sinh không hợp lệ vui lòng nhập theo định dạng yyyy-MM-dd"
        },
        province: {
            required: "Vui lòng chọn tỉnh thành"
        },
        district: {
            required: "Vui lòng chọn quận/huyện"
        },
        ward: {
            required: "Vui lòng chọn phường/xã"
        },
    }

}
const adminAddUserValidator = {
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
        password: {
            required: true,
            minlength: 6
        },
        phone: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 12
        },
        birthday: {
            required: true,
            dateFormat: true
        },
        gender: {
            required: true
        },
        status: {
            required: true
        },
        role: {
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
        }
    }
    ,
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
        password: {
            required: "Vui lòng nhập mật khẩu",
            minlength: "Mật khẩu ít nhất {0} ký tự"
        },
        repassword: {
            equalTo: "Mật khẩu không khớp"
        },
        phone: {
            required: "Vui lòng nhập số điện thoại",
            digits: "Số điện thoại chỉ được nhập số",
            minlength: "Số điện thoại ít nhất {0} số",
            maxlength: "Số điện thoại tối đa {0} số"
        },
        birthday: {
            required: "Vui lòng chọn ngày sinh",
            dateFormat: "Ngày sinh không hợp lệ vui lòng nhập theo định dạng yyyy-MM-dd"
        },
        gender: {
            required: "Vui lòng chọn giới tính cho tài khoản người dùng"
        },
        status: {
            required: "Vui lòng chọn trạng thái tài khoản người dùng"
        },
        role: {
            required: "Vui lòng chọn phân quyền người dùng"
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
}
const adminUpdateUserValidator = {
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
        birthday: {
            required: true,
            dateFormat: true
        },
        gender: {
            required: true
        },
        status: {
            required: true
        },
        role: {
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
        }
    }
    ,
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
        repassword: {
            equalTo: "Mật khẩu không khớp"
        },
        phone: {
            required: "Vui lòng nhập số điện thoại",
            digits: "Số điện thoại chỉ được nhập số",
            minlength: "Số điện thoại ít nhất {0} số",
            maxlength: "Số điện thoại tối đa {0} số"
        },
        birthday: {
            required: "Vui lòng chọn ngày sinh",
            dateFormat: "Ngày sinh không hợp lệ vui lòng nhập theo định dạng yyyy-MM-dd"
        },
        gender: {
            required: "Vui lòng chọn giới tính cho tài khoản người dùng"
        },
        status: {
            required: "Vui lòng chọn trạng thái tài khoản người dùng"
        },
        role: {
            required: "Vui lòng chọn phân quyền người dùng"
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
}
const adminAddCategoryValidator = {
    rules: {
        name: {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        status: {
            required: true
        }
    },
    messages: {
        name: {
            required: "Vui lòng nhập tên loại sản phẩm",
            minlength: "Tên loại sản phẩm ít nhất {0} ký tự",
            maxlength: "Tên loại sản phẩm tối đa {0} ký tự"
        },
        status: {
            required: "Vui lòng chọn trạng thái"
        }
    }
}
const adminUpdateCategoryValidator = {
    rules: {
        name: {
            required: true,
            minlength: 2,
            maxlength: 50
        },
        status: {
            required: true
        }
    },
    messages: {
        name: {
            required: "Vui lòng nhập tên loại sản phẩm",
            minlength: "Tên loại sản phẩm ít nhất {0} ký tự",
            maxlength: "Tên loại sản phẩm tối đa {0} ký tự"
        },
        status: {
            required: "Vui lòng chọn trạng thái"
        }
    }
}
const adminEditProjectValidator = {
    rules: {
        email: {
            required: true,
            email: true
        },
        title: {
            required: true,
            minlength: 2,
            maxlength: 150
        },
        status: {
            required: true
        },
        category: {
            required: true
        },
        price: {
            required: true,
            digits: true
        },
        area: {
            required: true,
            digits: true
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
        description: {
            required: true,
            minlength: 10,
            maxlength: 500
        },
        service: {
            required: true
        },
        schedule: {
            required: {
                depends: function (element) {
                    return !$('#isComplete').is(':checked');
                }
            }
        },
        estimated_complete: {
            required: {
                depends: function (element) {
                    return !$('#isComplete').is(':checked');
                }
            }
        },
        post: {
            required: true,
            minlength: 100
        }
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        title: {
            required: "Vui lòng nhập tiêu đề",
            minlength: "Tiêu đề ít nhất {0} ký tự",
            maxlength: "Tiêu đề tối đa {0} ký tự"
        },
        status: {
            required: "Vui lòng chọn trạng thái"
        },
        category: {
            required: "Vui lòng chọn loại sản phẩm"
        },
        price: {
            required: "Vui lòng nhập giá",
            digits: "Giá chỉ được nhập số"
        },
        area: {
            required: "Vui lòng nhập diện tích",
            digits: "Diện tích chỉ được nhập số"
        },
        province: {
            required: "Vui lòng chọn tỉnh thành"
        },
        district: {
            required: "Vui lòng chọn quận/huyện"
        },
        ward: {
            required: "Vui lòng chọn phường/xã"
        },
        description: {
            required: "Vui lòng nhập mô tả",
            minlength: "Mô tả ít nhất {0} ký tự",
            maxlength: "Mô tả tối đa {0} ký tự"
        },
        service: {
            required: "Vui lòng chọn dịch vụ"
        },
        schedule: {
            required: "Vui lòng chọn lịch làm việc"
        },
        estimated_complete: {
            required: "Vui lòng chọn ngày hoàn thành"
        },
        post: {
            required: "Vui lòng nhập bài viết",
            minlength: "Bài viết ít nhất {0} ký tự"
        }
    }
}
const adminAddProjectValidator = {
    rules: {
        email: {
            required: true,
            email: true
        },
        title: {
            required: true,
            minlength: 2,
            maxlength: 150
        },
        status: {
            required: true
        },
        category: {
            required: true
        },
        price: {
            required: true,
            digits: true
        },
        area: {
            required: true,
            digits: true
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
        description: {
            required: true,
            minlength: 10,
            maxlength: 500
        },
        service: {
            required: true
        },
        schedule: {
            required: {
                depends: function (element) {
                    return !$('#isComplete').is(':checked');
                }
            }
        },
        estimated_complete: {
            required: {
                depends: function (element) {
                    return !$('#isComplete').is(':checked');
                }
            }
        },
        post: {
            required: true,
            minlength: 100
        }
    },
    messages: {
        email: {
            required: "Vui lòng nhập địa chỉ email",
            email: "Địa chỉ email không hợp lệ"
        },
        title: {
            required: "Vui lòng nhập tiêu đề",
            minlength: "Tiêu đề ít nhất {0} ký tự",
            maxlength: "Tiêu đề tối đa {0} ký tự"
        },
        status: {
            required: "Vui lòng chọn trạng thái"
        },
        category: {
            required: "Vui lòng chọn loại sản phẩm"
        },
        price: {
            required: "Vui lòng nhập giá",
            digits: "Giá chỉ được nhập số"
        },
        area: {
            required: "Vui lòng nhập diện tích",
            digits: "Diện tích chỉ được nhập số"
        },
        province: {
            required: "Vui lòng chọn tỉnh thành"
        },
        district: {
            required: "Vui lòng chọn quận/huyện"
        },
        ward: {
            required: "Vui lòng chọn phường/xã"
        },
        description: {
            required: "Vui lòng nhập mô tả",
            minlength: "Mô tả ít nhất {0} ký tự",
            maxlength: "Mô tả tối đa {0} ký tự"
        },
        service: {
            required: "Vui lòng chọn dịch vụ"
        },
        schedule: {
            required: "Vui lòng chọn lịch làm việc"
        },
        estimated_complete: {
            required: "Vui lòng chọn ngày hoàn thành"
        },
        post: {
            required: "Vui lòng nhập bài viết",
            minlength: "Bài viết ít nhất {0} ký tự"
        }
    }
}