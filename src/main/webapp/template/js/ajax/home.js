
// page on ready
$(document).ready(function () {
    console.log("service page")
    getServices("home", "services-container");
    // $.ajax({
    //     url: '/api/home/data',
    //     type: 'Get',
    //     success: function (data) {
    //
    //         let slides = JSON.parse(data);
    //         let slide = document.getElementById('slide-container');
    //         slide.innerHTML = "";
    //         slides.data.forEach((x, index) => {
    //
    //             let active = index === 0 ? "active" : "";
    //             slide.innerHTML += `<div class="carousel-item ${active} w-100">
    //             <img class="d-block w-100 " src="${x.avatar}"
    //                  alt="${x.title}">`
    //         })
    //     },
    // })
    $.ajax({
        url: '/api/home/slides',
        type: 'Get',
        success: function (data) {
            console.log(data)
            let slides = JSON.parse(data);
            console.log(slides)
            slides.data.forEach((x, index) => {
                let active = index === 0 ? "active" : "";
                $('#slide-container').append(`<div class="carousel-item ${active} w-100">
                <img class="d-block w-100 " src="${x.avatar}"
                     alt="${x.title}">`)
            })
            console.log($('#slide-container').html())
        },
    })
    $.ajax({
        url: "/api/home/categories",
        type: 'Get',
        success: function (data) {
            let categories = JSON.parse(data);
            console.log(123)
            let categoryContainer = document.getElementById('category-container');
            categoryContainer.innerHTML = "";
            categories.data.forEach((x, index) => {
                let active = index === 0 ? "active" : "";
                categoryContainer.innerHTML += `<li class="category-item">
                         <button class="item-selector "
                                   role="tab" onclick="getProject(${x.id})"
                                   title="${x.name}">
                              XÂY DỰNG ${x.name}
                          </button>
               </li>`
            })
            getProject(categories.data[0].id,false)
        },
    })

})
function saveContact() {
    $.ajax({
        url: '/api/contact/save',
        type: 'Post',
        dataType: 'json',
        data: {
            fullName: $('#fullName').val(),
            email: $('#email').val(),
            address: $('#address').val(),
            phone: $('#phone').val(),
            content: $('#content').val(),
        },
        success: function (data) {
            delayNotify(1000, data.message);
            if (data.name == 'success') {
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            }
        },
        error: function (data) {
            //bắt lỗi email
            delayNotify(10000, "Vui lòng nhập đúng định dạng");
            if (data.name == 'error') {
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            }
        }

    })
}


function getProject(id, notLoad=true) {
    if(notLoad){
        popularProject(id)
    }
    $.ajax({
        url: '/api/home/projects/' + id,
        type: 'Get',
        // dataType: 'json',
        // data: {id: id},
        success: function (data) {
            resdata = JSON.parse(data)
            let list = resdata.data
            let containter = document.getElementById('project-container');
            let project = "";
            containter.innerHTML = "";
            for (const x of list) {
                project += '<div' +
                    ' class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">'
                    + '<div'
                    + ' class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">';
                if (x.isSave) project += ' <i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'
                else project += '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>';
                project += '<a href="/post/project/' + x.id + '">'
                    + '<img src="' + x.avatar + '"'
                    + ' class="w-100">'
                    + ' <input type="hidden" class="project-id" value=' + x.id + '>'
                    + ' <div class="w-100 position-absolute projectCard-content">'
                    + '  <div class="mask justify-content-center d-flex h-100"'
                    + ' style="background-color: rgba(48, 48, 48, 0.72);">'
                    + '<div class="align-items-center flex-column d-flex w-100"><h6'
                    + ' class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">'
                    + x.title + '</h6>'
                    + '<p class="text-white p-0 id-project">'
                    + '<strong>MDA:' + x.id + '</strong>'
                    + '</p>'
                    + '<p class="text-white p-4 vanBan">' + x.description + '</p>'
                    + '</div>'
                    + '</div></div></a></div></div>'
            }
            containter.innerHTML = project;
            // console.log(project);

        },
        error: function (data) {
            console.log(data);
        }
    })
}


function like(project) {
    let id = $(project).parent().find('.project-id').val();
    console.log(id);
    $.ajax({
        url: "/api/save_project/"+id,
        type: "GET",
        success: function (response) {
            console.log(response);
            let resp = JSON.parse(response);
            if (resp.name == 'save') {
                likeLoging(id,true,true)
                project.classList.replace("fa-regular", "fa-solid")
            } else if (resp.name == 'delete') {
                likeLoging(id,false)
                project.classList.replace("fa-solid", "fa-regular")
                //= "fa-solid fa-bookmark position-absolute";
                // console.log(p);
            }
        },
        error: function (response) {
            likeLoging(id,false,true)
            console.log(response.responseText)
            let resp = JSON.parse(response.responseText);
            window.location.href = resp.data;
        }
    })
}


function fetchErr(name, mess) {
    console.log(name, mess)
    switch (name) {
        case 'email':
            let email = document.getElementById('email');
            email.classList.add('border-danger');
            email.classList.add('text-danger');
            email.value = "";
            email.setAttribute('value', "");
            // email.setAttribute('placeholder', mess);
            break;
    }
}


let fullName = document.getElementById('email');
fullName.addEventListener('click', function () {
    fullName.classList.remove('border-danger');
    fullName.classList.remove('text-danger');
    fullName.setAttribute('placeholder', "Email");
})
