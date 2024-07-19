import {deleteImage, GALLERY, getImageInfo, PROJECT, upload} from "../firebase/uploadImage.js";

validate('#form-add-project', adminAddProjectValidator, function (form) {
    updateAvatar().then(() => {
        updateGallery().then(() => {
            const data = {
                id: $('#id').val(),
                title: $('#title').val(),
                description: $('#description').val(),
                categoryId: $('#category').val(),
                price: $('#price').val(),
                status: $('#status').val(),
                acreage: $('#acreage').val(),
                service: $('#service').val(),
                content: CKEDITOR.instances.post.getData(),
                isComplete: $('#isComplete').prop('checked'),
                isAccepted: $('#isAccepted').prop('checked'),
                schedule: $('#schedule').val(),
                estimatedComplete: $('#estimated_complete').val(),
                province: $('#province').val(),
                district: $('#district').val(),
                ward: $('#ward').val(),
                avatar: FilePond.find($('#file_input_avatar')[0]).getFiles().map(e => e.file.name)[0],
                gallery: FilePond.find($('#file_input_gallery')[0]).getFiles().map(e => e.file.name).join(','),
            }
            $.ajax({
                url: '/api/admin/project/add',
                type: 'POST',
                dataType: 'json',
                // contentType: 'application/json',
                data: data,
                success: function (data) {
                    if (data.status === 200) {
                        autoCloseAlertIcon(data.message, 1500, swal2Icon.SUCCESS, data.redirect)
                    } else {
                        errorAlert(data.message)
                    }
                },
                error: function (error) {
                    console.log(123)
                    errorAlert("Xin vui lòng thực hiện lại sau 5p")
                }
            });

        })
    })
    // console.log($(form).serialize())
})

function updateAvatar() {
    return new Promise((resolve, reject) => {
        const fileToUpload = FilePond.find($('#file_input_avatar')[0]).getFiles()
        upload(fileToUpload, PROJECT).then((data) => {
            $('#uploadAvatar').val(fileToUpload.map(e => e.file.name).join(','))
        })
        resolve(true);
    }).catch((error) => {
        reject(error)
    })
}

function updateGallery() {
    return new Promise((resolve, reject) => {
        const fileToUpload = FilePond.find($('#file_input_gallery')[0]).getFiles();
        upload(fileToUpload, GALLERY + `${$('#id').val()}`).then((data) => {
            $('#uploadGallery').val(fileToUpload.map(e => e.file.name).join(','))
        })
        resolve(true)
    }).catch((error) => {
        reject(error)
    })
}

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

$('#isAccepted').on('change', function () {
    if ($('#isAccepted').prop('checked')) {
        $('#status').removeClass('d-none');
    } else {
        $('#status').addClass('d-none');
    }
})
// $('#isComplete').click(function () {
//         $('#isComplete').prop('checked', $('#isComplete').prop('checked'));
//     }
// )
$('#isComplete').change(function () {
    if ($('#isComplete').prop('checked')) {
        $('#projectProgressText').addClass('d-none');
        $('#projectProgressText').removeClass('d-block');
    } else {
        $('#projectProgressText').addClass('d-block');
        $('#projectProgressText').removeClass('d-none');
    }
})

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
    const filepondAvatar = FilePond.create(document.querySelector('#file_input_avatar'), {
        required: true,
        maxFiles: 1,
        labelIdle: 'Kéo thả hình ảnh vào đây',
        maxFileSize: '5MB',
        acceptedFileTypes: ['image/*'],
    });
    const filepondGallery = FilePond.create(document.querySelector('#file_input_gallery'), {
        required: true,
        maxFiles: 5,
        allowMultiple: true,
        labelIdle: 'Kéo thả hình ảnh vào đây(tối đa 5)',
        maxFileSize: '5MB',
        acceptedFileTypes: ['image/*'],
    });

    initialData().then(async (data) => {
        $('#id').val(data.uniqueID);
        data.categories.forEach((e) => {
            $('#category').append(`<option value="${e.id} " } > ${e.name}  </option>`)
        });
        data.services.forEach((e) => {
            $('#service').append(`<option value="${e.id} "  > 
   <span class="text-uppercase">${e.name}</span>
  </option>`)
        })
    }).catch((error) => {
    })
})
;

function initialData() {
    return new Promise((resolve, reject) => {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/project/add',
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

async function getFilesForFilePondProperties(files = [], place) {
    const r = files.map(async (e) => {
        const data = await getImageInfo(e, place)
        return {
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
    })
    return Promise.all(r);
}