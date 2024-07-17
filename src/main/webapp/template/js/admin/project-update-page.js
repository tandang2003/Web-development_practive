import {
    deleteImage,
    getDownloadUrl,
    getImageInfo,
    ORDER,
    PROJECT,
    upload
} from "../firebase/uploadImage.js";

const editor = CKEDITOR.replace('post', {
    width: "100%",
    height: "400px",
});
$('.datepicker').datepicker({
    inline: true,
    monthsFull: ['Tháng 01', 'Tháng 02', 'Tháng 03', 'Tháng 04', 'Tháng 05', 'Tháng 06', 'Tháng 07', 'Tháng 08', 'Tháng 09', 'Tháng 10',
        'Tháng 11', 'Tháng 12'],

    weekdaysFull: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
    showWeekdaysFull: true,
    today: 'Hôm nay',
    clear: 'Xóa',
    close: 'Đóng',
    regional: 'vi-VN',
    labelMonthNext: 'Tháng kế tiêp',
    labelMonthPrev: 'Tháng trước',
    labelMonthSelect: 'Chọn tháng',
    labelYearSelect: 'Chọn năm',
    format: 'yyyy-mm-dd',
}).on('change', function (ev) {
    $('#estimated_complete').blur();
});


$(document).ready(function () {
    $(".sidebar-btn").click(function () {
        $(".wrapper").toggleClass("mycollapse");
    });
});
for (let item of $('.sidebar-item')) {
    item.addEventListener('click', function () {
        if (cur != null) {
            cur.classList.remove('d-block');
            cur.classList.add('d-none');
        }
        if (this.children.length === 2) {
            this.children[1].classList.remove('d-none')
            this.children[1].classList.add('d-block')
            cur = this.children[1];
        }
    })
}


userAccepted()

function userAccepted() {
    var status = document.getElementById('status');
    if (!document.getElementById('isAccepted').checked) {
        status.classList.add('d-none');
        status.classList.remove('d-block');
    } else {
        status.classList.add('d-block');
        status.classList.remove('d-none');
    }
}

$('#isComplete').click(function () {
        $('#isComplete').prop('checked', $('#isComplete').prop('checked'));
    }
)
$('#isComplete').change(function () {
    if ($('#isComplete').prop('checked')) {
        $('#projectProgressText').addClass('d-none');
        $('#projectProgressText').removeClass('d-block');
    } else {
        $('#projectProgressText').addClass('d-block');
        $('#projectProgressText').removeClass('d-none');
    }
})

// conpleteProject()

// function conpleteProject() {
//     var projectProgressText = document.getElementById('projectProgressText');
//     if (document.getElementById('isComplete').checked) {
//         projectProgressText.classList.add('d-none');
//         projectProgressText.classList.remove('d-block');
//     } else {
//         projectProgressText.classList.add('d-block');
//         projectProgressText.classList.remove('d-none');
//     }
// }


let cur;
for (let item of $('.sidebar-item')) {
    item.addEventListener('click', function () {
        if (cur != null) {
            cur.classList.remove('d-block');
            cur.classList.add('d-none');
        }
        if (this.children.length === 2) {
            this.children[1].classList.remove('d-none')
            this.children[1].classList.add('d-block')
            cur = this.children[1];
        }
    })
}
$(document).ready(function () {
    $('.mdb-select').materialSelect();
    initialData().then((data) => {
        console.log(data)
        $('#defaultAvatar').val(data.project.avatar)
        $('#email').val(data.userEmail);
        $('#title').val(data.project.title);
        $('#description').val(data.project.description);
        data.categories.forEach((e) => {
            $('#category').append(`<option value="${e.id} " }  ${e.id === data.project.categoryId ? 'selected' : ''}> ${e.name}  </option>`)
        });
        $('#price').val(data.project.price);
        $('#acreage').val(data.project.acreage);
        data.services.forEach((e) => {
            let selected = data.servicesOfproject.includes(e.id) ? 'selected' : '';
            console.log(selected)
            $('#service').append(`<option value="${e.id} " ${selected}}  > 
   <span class="text-uppercase">${e.name}</span>
  </option>`)
        })
        console.log(data.post.content)
        $('#post').val(data.post.content);
        $('#isComplete').prop('checked', !data.isExcuting).change();
        $('#isAccepted').prop('checked', data.project.isAccepted === 1);
        $('#schedule').val(data.project.schedule);
        $('#estimated_complete').val(data.project.estimatedComplete);
        $('#province').val(data.project.address.province);
        updateDistricts(data.project.address.province).then(() => {
            $('#district').val(data.project.address.district);
            updateWard(data.project.address.district).then(() => {
                $('#ward').val(data.project.address.ward);
            }).catch((error) => {
            })
        }).catch((error) => {
        });
    }).catch((error) => {
    })
});

function initialData() {
    return new Promise((resolve, reject) => {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/project/edit/' + id,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                if (data.status === 200)
                    resolve(data.data);
                else
                    reject(data)
            },
            error: function (error) {
                reject(error);
            }
        });

    })
}

//SUBMIT THÌ XÓA TRONG DEFAULT
$('#btn-av-upload').on('click', function () {
        let img = $('#defaultAvatar').val();
        if (img !== '') {
            getImageInfo($('#defaultAvatar').val(), PROJECT).then((data) => {
                Swal.fire({
                    title: 'Chọn ảnh',
                    html: `<input type="file" id="'file_input" class="filepond" name="filepond" multiple>`,
                    didRender: () => {
                        const filepond = FilePond.create(document.querySelector('.filepond'), {
                            required: true,
                            // allowMultiple: true,
                            maxFiles: 5,
                            labelIdle: 'Kéo thả hình ảnh vào đây(tối đã 5 ảnh)',
                            maxFileSize: '5MB',
                            acceptedFileTypes: ['image/*'],
                            files: [
                                {
                                    source: data[0],
                                    options: {
                                        type: 'local',
                                        file: {
                                            name: data[0].name,
                                            type: 'image/jpeg',
                                            size: data[0].size
                                        },
                                        metadata: {
                                            poster: data[1]
                                        }
                                    }
                                }
                            ]
                            // options: {
                            //     type: 'local'
                            // }
                        });
                    },
                    willClose: () => {
                        //get file name form filepond
                        if ($('#uploadAvatar').val() != '') {
                            deleteImage($('#uploadAvatar').val(), PROJECT).then(result => {
                                if (result) {
                                    console.log('delete success')
                                } else {
                                    errorAlert("Xin vui lòng thực hiện lại sau 5p")
                                    return;
                                }
                            })
                                .catch(error => {
                                    console.error('Error during file deletion process:', error);
                                });
                        }
                        const files = FilePond.find(document.querySelector('.filepond')).getFiles();
                        upload(FilePond.find(document.querySelector('.filepond')).getFiles(), PROJECT).then((data) => {
                            // console.log(data)
                            $('#uploadAvatar').val(data)
                        }).catch(error => {
                            errorAlert("Xin vui lòng thực hiện lại sau 5p")
                        })
                    },
                    didDestroy: () => {
                        console.log('destroy')
                    }
                })
            })
        } else
            Swal.fire({
                title: 'Chọn ảnh',
                html: `<input type="file" id="'file_input" class="filepond" name="filepond" multiple>`,
                didRender: () => {
                    const filepond = FilePond.create(document.querySelector('.filepond'), {
                        required: true,
                        allowMultiple: true,
                        maxFiles: 5,
                        labelIdle: 'Kéo thả hình ảnh vào đây(tối đã 5 ảnh)',
                        maxFileSize: '5MB',
                        acceptedFileTypes: ['image/*'],
                    });
                },
                willClose: () => {
                    if ($('#uploadAvatar').val() != '') {
                        deleteImage($('#uploadAvatar').val(), PROJECT).then(result => {
                            if (result) {
                                console.log('delete success')
                            } else {
                                errorAlert("Xin vui lòng thực hiện lại sau 5p")
                                return;
                            }
                        })
                            .catch(error => {
                                console.error('Error during file deletion process:', error);
                            });
                    }
                    const files = FilePond.find(document.querySelector('.filepond')).getFiles();
                    upload(FilePond.find(document.querySelector('.filepond')).getFiles(), PROJECT).then((data) => {
                        // console.log(data)
                        $('#uploadAvatar').val(data)
                    }).catch(error => {
                        errorAlert("Xin vui lòng thực hiện lại sau 5p")
                    })
                },
                didDestroy: () => {
                    console.log('destroy')
                }
            })

    }
)
('#btn-ga-upload').on('click', function () {

})