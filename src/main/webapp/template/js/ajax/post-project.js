$(document).ready(function () {
    $('.mdb-select').materialSelect();


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
        let iconLike = `<i class="fa-regular fa-bookmark position-relative" onclick="like(this)"></i>`
        if (project.isSave)
            iconLike = `<i class="fa-solid fa-bookmark position-relative" onclick="like(this)"></i>`;
        //add icon like
        $('.project-title').text(project.title)
        $('.title-page').html(function(index,current){
            return iconLike+ current
        })
        console.log("checking title")
        console.log($('.title-page').html())
        console.log($('.title-page').html())
        console.log($('.project-title').html())
        $('.project-updatedAt').text(project.updatedAt)
        $('.project-category').text(project.category)
        $('.project-id').text(project.id)

    },
})
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
    // thông tin gallery
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

});

let allFiles = [];
let form = document.getElementsByClassName("form-img");
let input = document.getElementById("file_input");
let container = document.getElementsByClassName("img-container");
if (input.files.length != 0) {
    container[0].parentElement.classList.add('d-block')
    container[0].parentElement.classList.remove('d-none')
} else {
    container[0].parentElement.classList.add('d-none')
    container[0].parentElement.classList.remove('d-block')
}
input.addEventListener('change', function () {
    let files = this.files;
    for (let i = 0; i < files.length; i++) {
        allFiles.push(files[i])
    }
    showImage();
})
const showImage = () => {
    if (input.files.length != 0) {
        container[0].parentElement.classList.add('d-block')
        container[0].parentElement.classList.remove('d-none')
    } else {
        container[0].parentElement.classList.add('d-none')
        container[0].parentElement.classList.remove('d-block')
    }
    let images = ' ';
    allFiles.forEach((e, i) => {
        images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
            '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
    })
    container[0].innerHTML = images
}
let dt = new DataTransfer();
const delImage = index => {
    let dt = new DataTransfer();
    for (let i = 0; i < input.files.length; i++) {
        if (index !== i)
            dt.items.add(input.files[i]) // here you exclude the file. thus removing it.
    }
    input.files = dt.files
    allFiles = Array.from(input.files)
    showImage()
}


$('#save').click(function () {
    let form = new FormData;
    form.append('email', $('#form-email').val())
    form.append('address', $('#address').val())
    form.append('representProjectId', $('#itProject').val())
    form.append('category', $('#category').val())
    form.append('width', $('#area-width').val())
    form.append("representProjectId", $('#representProjectId').val())
    form.append('width', $('#area-width').val())
    form.append('height', $('#area-length').val())
    form.append('services', $('#services').val())
    for (const x of $("#file_input").prop('files')) {
        form.append('image', x)
    }

    $.ajax({
        url: '/api/cart',
        type: 'post',
        data: form,
        dataType: 'json',
        processData: false,
        contentType: false,
        success: function (data) {
            console.log("save")
            alert(data[0].message)
            console.log(data)
        },
        error: function (e) {
            // console.log("false")
            console.log(e.responseText)
            let err = JSON.parse(e.responseText);
            for (let key of err) {
                console.log(key.name, key.message)
                fetchErr(key.name, key.message)
            }
        }
    })

})
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


function like(project) {
    $.ajax({
        url: "/api/save_project"+id,
        type: "GET",
        success: function (response) {
            console.log(response);
            let resp = JSON.parse(response);
            if (resp.name == 'save') {
                project.classList.replace("fa-regular", "fa-solid")
            } else if (resp.name == 'delete')
                project.classList.replace("fa-solid", "fa-regular")
            //= "fa-solid fa-bookmark position-absolute";
            // console.log(p);
        },
        error: function (response) {
            let resp = JSON.parse(response.responseText);
            window.location.href = resp.data;
        }
    })
}


function fetchErr(name, mess) {
    switch (name) {
        case'email':
            let email = document.getElementById('form-email')
            email.classList.add('border-danger');
            email.classList.add('text-danger');
            email.value = "";
            email.setAttribute('value', "");
            break;
        case'address':
            let address = document.getElementById('address')
            address.classList.add('border-danger');
            address.classList.add('text-danger');
            address.value = "";
            address.setAttribute('value', "");
            address.setAttribute('placeholder', mess);
            break;
        case'category':
            let category = document.getElementById('category')
            category.classList.add('border-danger');
            category.classList.add('text-danger');
            category.value = "";
            category.setAttribute('value', "");
            category.setAttribute('placeholder', mess);
            break;
        case'width':
            let width = document.getElementById('area-width')
            width.classList.add('border-danger');
            width.classList.add('text-danger');
            width.value = "";
            width.setAttribute('value', "");
            width.setAttribute('placeholder', mess);
            break;
        case'height':
            let height = document.getElementById('area-length')
            height.classList.add('border-danger');
            height.classList.add('text-danger');
            height.value = "";
            height.setAttribute('value', "");
            height.setAttribute('placeholder', mess);
            break;
        case'services':
            let services = document.getElementById('services')
            services.classList.add('border-danger');
            services.classList.add('text-danger');
            services.value = "";
            services.setAttribute('value', "");
            services.setAttribute('placeholder', mess);
            break;
        case'itProject':
            let itProject = document.getElementById('itProject')
            itProject.classList.add('border-danger');
            itProject.classList.add('text-danger');
            itProject.value = "";
            itProject.setAttribute('value', "");
            itProject.setAttribute('placeholder', mess);
            break;
    }
}


let email = document.getElementById('form-email')
email.addEventListener('click', function () {
    email.classList.remove('border-danger');
    email.classList.remove('text-danger');
    email.setAttribute('placeholder', "");
})

let address = document.getElementById('address')
address.addEventListener('click', function () {
    address.classList.remove('border-danger');
    address.classList.remove('text-danger');
    address.setAttribute('placeholder', "");
})

let category = document.getElementById('category')
category.addEventListener('click', function () {
    category.classList.remove('border-danger');
    category.classList.remove('text-danger');
    category.setAttribute('placeholder', "");
})

let width = document.getElementById('area-width')
width.addEventListener('click', function () {
    width.classList.remove('border-danger');
    width.classList.remove('text-danger');
    width.setAttribute('placeholder', "");
})

let height = document.getElementById('area-length')
height.addEventListener('click', function () {
    height.classList.remove('border-danger');
    height.classList.remove('text-danger');
    height.setAttribute('placeholder', "");
})

let services = document.getElementById('services')
services.addEventListener('click', function () {
    services.classList.remove('border-danger');
    services.classList.remove('text-danger');
    services.setAttribute('placeholder', "");
})

let itProject = document.getElementById('itProject')
itProject.addEventListener('click', function () {
    itProject.classList.remove('border-danger');
    itProject.classList.remove('text-danger');
    itProject.setAttribute('placeholder', "");
})
