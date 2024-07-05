import {PROJECT, storage, upload} from "../firebase/uploadImage.js";

$(document).ready(function () {
    let id = window.location.href.substring(window.location.href.lastIndexOf('/'))
    $.ajax({
        //thông tin dự án
        url: '/api/post/project' + id,
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
            console.log(services)
            for (const upKey of setUp.categories) {
                let html = `<option value="${upKey.id}">${upKey.name}</option>`
                if (upKey.id == project.categoryId)
                    html = `<option value="${upKey.id}" selected>${upKey.name}</option>`
                $('#category').append(html)
            }
            for (const upElement of setUp.services) {
                console.log(upElement)
                let html = `<option value="${upElement.id}">${upElement.name}</option>`
                if (services.includes(upElement.id))
                    html = `<option value="${upElement.id}" selected>${upElement.name}</option>`
                $('#services').append(html)
            }
            $('#idProject').val(project.id)
        },
        error: function (e) {
            console.log(e)
            errorAlert("Hệ thống đang quá tải vui lòng thử lại sau 5p")
        }
    })
    $('.mdb-select').materialSelect();

    $.ajax({
        //thông tin bài viết
        url: "/api/post/project" + id + "/post",
        type: "GET",
        dataType: 'json',
        success: function (data) {
            let post = data.data
            $('.post-content-text').html(post.content + $('.post-content-text').html())
        },
    })
    $.ajax({
        url: "/api/post/project" + id + "/gallery",
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
        url: "/api/post/project" + id + "/services",
        type: "GET",
        dataType: 'json',
        success: function (data) {
            let services = data.data
            console.log(services)
            services.forEach((e, i) => {
                $('.project-services').append(`${e.name}`)
                if (i != services.length - 1)
                    $('.project-services').append(`, `)
            })
        },
    })
    $.ajax({
        url: '/api/post/project' + id + '/suggest',
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
    })
});

$(document).ready(function () {
    $.fn.filepond.registerPlugin(FilePondPluginImagePreview);
})
$('#btn-op-upload').on('click', function () {
    Swal.fire({
        title: 'Chọn ảnh',
        // input: 'file',
        // inputAttributes: {
        //     'accept': 'image/*',
        //     'multiple': 'multiple'
        // }
        html: `<input type="file" id="'file_input" class="filepond" name="filepond" multiple>`,
        didRender: () => {
            // $('.filepond').filepond('allowMultiple', true)
            // $('.filepond').on('FilePond:addfile', function (e) {
            //     console.log('file added event', e)
            // })
            const filepond = FilePond.create(document.querySelector('.filepond'), {
                allowMultiple: true,
                maxFiles: 5,
                maxFileSize: '5MB',
                acceptedFileTypes: ['image/*'],
            });
        },
        willClose: () => {
            //get file name form filepond
            const files = FilePond.find(document.querySelector('.filepond')).getFiles();
            $('#uploadImg').val(files);
            console.log('success')

            // upload(files, PROJECT, this);
            // console.log(files.map(file => file.file.name));
        },
        didDestroy: () => {
            console.log('destroy')
        }
    })
    // $.fn.filepond.registerPlugin(FilePondPluginImagePreview);

})
;
//
// let allFiles = [];
// let form = document.getElementsByClassName("form-img");
// let input = document.getElementById("file_input");
// let container = document.getElementsByClassName("img-container");
// if (input.files.length != 0) {
//     container[0].parentElement.classList.add('d-block')
//     container[0].parentElement.classList.remove('d-none')
// } else {
//     container[0].parentElement.classList.add('d-none')
//     container[0].parentElement.classList.remove('d-block')
// }
// input.addEventListener('change', function () {
//     let files = this.files;
//     for (let i = 0; i < files.length; i++) {
//         allFiles.push(files[i])
//     }
//     showImage();
// })
// const showImage = () => {
//     if (input.files.length != 0) {
//         container[0].parentElement.classList.add('d-block')
//         container[0].parentElement.classList.remove('d-none')
//     } else {
//         container[0].parentElement.classList.add('d-none')
//         container[0].parentElement.classList.remove('d-block')
//     }
//     let images = ' ';
//     allFiles.forEach((e, i) => {
//         images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
//             '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
//     })
//     container[0].innerHTML = images
// }
// let dt = new DataTransfer();
// const delImage = index => {
//     let dt = new DataTransfer();
//     for (let i = 0; i < input.files.length; i++) {
//         if (index !== i)
//             dt.items.add(input.files[i]) // here you exclude the file. thus removing it.
//     }
//     input.files = dt.files
//     allFiles = Array.from(input.files)
//     showImage()
// }


// $.ajax({
//     url: '/api/cart',
//     type: 'post',
//     data: form,
//     dataType: 'json',
//     processData: false,
//     contentType: false,
//     success: function (data) {
//         console.log("save")
//         alert(data[0].message)
//         console.log(data)
//     },
//     error: function (e) {
//         // console.log("false")
//         console.log(e.responseText)
//         let err = JSON.parse(e.responseText);
//         for (let key of err) {
//             console.log(key.name, key.message)
//             fetchErr(key.name, key.message)
//         }
//     }
// })

$(document).ready(function () {
    $('select.services').change(function () {
        let value = $(this).val().toString();
        console.log(value)
        $.ajax({
            url: '/session/cart',
            type: 'get',
            data: {
                name: 'services',
                value: value
            },
            success: function (data) {
                console.log(data)
            },
            error: function (e) {
                console.log(e)
            }
        })
    })
})
$('.form-input').blur(function () {
    let name = $(this).attr("name");
    let value = $(this).val();
    $.ajax({
        url: '/session/cart',
        type: 'get',
        data: {
            name: name,
            value: value
        },
        success: function (data) {
        },
        error: function (e) {
        }
    })

});
console.log(storage)

