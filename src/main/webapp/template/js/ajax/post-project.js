import {deleteImage, ORDER, PROJECT, storage, upload} from "../firebase/uploadImage.js";

$(document).ready(function () {
        let id = window.location.pathname.substring(window.location.pathname.lastIndexOf('/') + 1)
        $.ajax({
            //thông tin dự án
            url: '/api/post/project/' + id,
            dataType: 'json',
            type: 'GET',
            success: function (data) {
                let project = data.data
                console.log(project)
                document.title = project.title
                let iconLike = `<i class="fa-regular fa-bookmark position-relative" onclick="like(this, ${project.id})"></i>`
                if (project.isSave)
                    iconLike = `<i class="fa-solid fa-bookmark position-relative" onclick="like(this,${project.id})"></i>`;
                //add icon like
                $('.project-title').text(project.title)
                $('.post-title').html(function (index, current) {
                    return iconLike + current
                })
                $('.project-updatedAt').text(project.updatedAt)
                $('.project-category').text(project.category)
                $('.project-id').text(project.id)
            },
        })
        $.ajax({
            url: '/api/post/project/' + id + '/order',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                data = JSON.parse(data.data)
                console.log(data)
                let project = data.project
                let setUp = data.setUp
                let services = data.services
                for (const upKey of setUp.categories) {
                    let html = `<option value="${upKey.id}">${upKey.name}</option>`
                    if (upKey.id == project.categoryId)
                        html = `<option value="${upKey.id}" selected>${upKey.name}</option>`
                    $('#category').append(html)
                }
                for (const upElement of setUp.services) {
                    console.log(upElement)
                    let html = `<option value="${upElement.id}">${upElement.name}</option>`
                    if (services.includes(upElement.id)) {
                        html = `<option value="${upElement.id}" selected>${upElement.name}</option>`
                        if ($('#serviceValue').val() !== '')
                            $('#serviceValue').val($('#serviceValue').val() + ',')
                        $('#serviceValue').val($('#serviceValue').val() + upElement.id)
                    }
                    $('#services').append(html)
                }
                $('#idProject').val(project.id)
                addOrderData();
            },
            error: function (e) {
                console.log(e)
                errorAlert("Hệ thống đang quá tải vui lòng thử lại sau 5p")
            }
        })

        function addOrderData() {
            console.log('addOrderData')
            $.ajax({
                url: '/api/cart/data',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    if (data.status == 200) {
                        data = JSON.parse(data.data)
                        console.log(data.address)
                        $('#email').val(data.email).change()
                        $('#province').val(`${data.address.provinceId}`)
                        updateDistricts(data.address.provinceId).then(() => {
                            $('#district').val(`${data.address.districtId}`)
                            updateWard(data.address.districtId).then(() => {
                            }).catch(error => {
                            })
                        }).catch(error => {
                        })
                        $('#ward').val(`${data.address.wardId}`)
                        $('#width').val(data.width).change()
                        $('#height').val(data.height).change()
                        data.images.forEach((e, i) => {
                            $('#uploadImg').val(e + ',')
                        })
                    }
                },
                error: function (e) {
                    console.log(e)
                }
            })
        }

        $('.mdb-select').materialSelect();

        $.ajax({
            //thông tin bài viết
            url: "/api/post/project/" + id + "/post",
            type: "GET",
            dataType: 'json',
            success: function (data) {
                let post = data.data
                $('.post-content-text').html(post.content + $('.post-content-text').html())
            },
        })
        $.ajax({
            url: "/api/post/project/" + id + "/gallery",
            type: "GET",
            dataType: 'json',
            success: function (data) {
                let gallery = data.data
                gallery.forEach((e, i) => {
                    $('.gallery').append(`<div class="img position-relative w-100 h-100 overflow-hidden ">
                    <img class="" src="${e}" alt="Image">
                    </div>`)
                })
                console.log($('.gallery').html())
            },
        })
        $.ajax({
            url: "/api/post/project/" + id + "/services",
            type: "GET",
            dataType: 'json',
            success: function (data) {
                let services = data.data
                services.forEach((e, i) => {
                    $('.project-services').append(`${e.name}`)
                    if (i != services.length - 1)
                        $('.project-services').append(`, `)
                })
            },
        })
        $.ajax({
            url: '/api/post/project/' + id + '/suggest',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                let suggestProjects = data.data
                console.log(suggestProjects)
                suggestProjects.forEach((e, i) => {
                    $('.project-suggest').append(`<li class="feature-news-items mb-2">
                                        <a href="/post/project/${e.id}"
                                           class="feature-news-items-link d-flex row"
                                           role="link">
                                            <div class="feature-news-items-img d-block hover-image col-5 pr-0">
                                                <img src="${e.avatar}" alt="">
                                            </div>
                                            <div class="feature-news-items-info col-6 pl-0">
                                                <div class="feature-news-items-info-title text-uppercase">
                                                        ${e.title}
                                                </div>
                                                <div class="feature-news-items-info-date">
                                                    <i class="fa-solid fa-calendar-alt mr-2"></i>
                                                        ${e.updatedAt}
                                                </div>
                                            </div>
                                        </a>
                                    </li>`)
                })
            }
        })
    }
)
$('#btn-op-upload').on('click', function () {
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
            //get file name form filepond
            if ($('#uploadImg').val() != '') {
                deleteImage($('#uploadImg').val(), ORDER).then(result => {
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
            upload(FilePond.find(document.querySelector('.filepond')).getFiles(), ORDER).then((data) => {
                // console.log(data)
                $('#uploadImg').val(data)
            }).catch(error => {
                errorAlert("Xin vui lòng thực hiện lại sau 5p")
            })
        },
        didDestroy: () => {
            console.log('destroy')
        }
    })
});

$(document).ready(function () {
    $('select#services').change(function () {
        $('#serviceValue').val('')
        $('select#services').val().forEach((e, i) => {
            $('#serviceValue').val($('#serviceValue').val() + e)
            if (i != $('select#services').val().length - 1)
                $('#serviceValue').val($('#serviceValue').val() + ',')
        })
        // $('#serviceValue').change(function () {
        // })
    })
//
});

