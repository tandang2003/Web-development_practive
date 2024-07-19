import {deleteImage, GALLERY, getImageInfo, PROJECT, upload} from "../firebase/uploadImage.js";

validate('#form-edit-project', adminEditProjectValidator, function (form) {
    updateAvatar().then(() => {
        updateGallery().then(() => {
            const data = {
                id: $('#id').val(),
                title: $('#title').val(),
                description: $('#description').val(),
                categoryId: $('#category').val(),
                price: $('#price').val(),
                acreage: $('#acreage').val(),
                status: $('#status').val(),
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
                url: '/api/admin/project/edit/' + $('#id').val(),
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
                    errorAlert("Xin vui lòng thực hiện lại sau 5p")
                }
            });
        })

    })
})
    function updateAvatar() {
        return new Promise((resolve, reject) => {
            const fileToUpload = FilePond.find($('#file_input_avatar')[0]).getFiles().filter(e => e.file.name !== $('#defaultAvatar').val());
            if (fileToUpload.length !== 0 && $('uploadAvatar').val() !== '') {
                upload(fileToUpload, 'project').then((data) => {
                    $('#uploadAvatar').val(fileToUpload.map(e => e.file.name).join(','))
                    deleteImage($('#defaultAvatar').val(), 'project');
                })
                resolve(true);
                return;
            }

            resolve(true)
        }).catch((error) => {
            reject(error)
        })
    }

    function updateGallery() {
        return new Promise((resolve, reject) => {
            const uploadFile = FilePond.find($('#file_input_gallery')[0]).getFiles().map(e => e.file.name);
            const listUpload = FilePond.find($('#file_input_gallery')[0]).getFiles().map(e => e.file.name);
            const fileDelete = $('#defaultGallery').val().split(',').filter(e => !listUpload.includes(e));
            console.log('fileDelete.toString()')
            console.log(fileDelete.toString())
            console.log(listUpload.toString())
            if ((fileDelete.length !== 0 || listUpload.length !== 0) && uploadFile.length !== 0) {
                deleteImage(fileDelete.toString(), `${GALLERY}/${$('#id').val()}`).then((data) => {
                    const fileToUpload = FilePond.find($('#file_input_gallery')[0]).getFiles().filter(e => !$('#defaultGallery').val().split(',').includes(e.file.name));
                    // const fileToUpload = FilePond.find(document.querySelector('.filepond')).getFiles().filter(e => !$('#defaultGallery').val().split(',').includes(e.file.name));
                    upload(fileToUpload, GALLERY + `/${$('#id').val()}`).then((data) => {
                        $('#uploadGallery').val(fileToUpload.map(e => e.file.name).join(','))
                    })
                })
                resolve(true)
                return;
            }
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


// userAccepted()
//
// function userAccepted() {
//     var status = document.getElementById('status');
//     if (!document.getElementById('isAccepted').checked) {
//         status.classList.add('d-none');
//         status.classList.remove('d-block');
//     } else {
//         status.classList.add('d-block');
//         status.classList.remove('d-none');
//     }
// }
    $('#isAccepted').on('change', function () {
        $('#status').toggleClass('d-none');
    })
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
            // console.log(await getFilesForFilePondProperties([data.project.avatar], 'test')[0])
            $('#id').val(data.project.id);
            $('#defaultAvatar').val(data.project.avatar)
            $('#defaultGallery').val(data.groupImages)
            getFilesForFilePondProperties([data.project.avatar], 'project').then((data) => {
                filepondAvatar.addFiles(data)
            })
            getFilesForFilePondProperties(data.groupImages, `${GALLERY}/${data.project.id}`).then((data) => {
                filepondGallery.addFiles(data)
            })
            $('#email').val(data.userEmail);
            $('#title').val(data.project.title);
            $('#description').val(data.project.description);
            data.categories.forEach((e) => {
                $('#category').append(`<option value="${e.id} " }  ${e.id === data.project.categoryId ? 'selected' : ''}> ${e.name}  </option>`)
            });
            $('#price').val(data.project.price);
            $('#acreage').val(data.project.acreage);
            data.services.forEach((e) => {
                let selected = data.servicesOfproject.some(s => s.id == e.id) ? 'selected' : '';
                console.log(selected)
                $('#service').append(`<option value="${e.id} " ${selected}  > 
   <span class="text-uppercase">${e.name}</span>
  </option>`)
            })
            CKEDITOR.instances.post.setData(data.post.content);
            $('#isComplete').prop('checked', !data.isExcuting).change();
            $('#isAccepted').prop('checked', data.project.isAccepted === 1);
            $('#schedule').val(data.project.schedule);
            $('#estimated_complete').val(data.project.estimatedComplete);
            $('#province').val(data.address.provinceId);
            updateDistricts(data.address.provinceId).then(() => {
                $('#district').val(data.address.districtId);
            }).then(() => {
                updateWard(data.address.districtId).then(() => {
                    $('#ward').val(data.address.wardId);
                }).catch((error) => {
                })
            }).catch((error) => {
            });
        }).catch((error) => {
        })
    })
    ;

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