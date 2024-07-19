import {getDownloadUrl, PROJECT} from "../firebase/uploadImage.js";

function effectButton() {
    let pageItem = document.getElementsByClassName('page-item');
    for (let i = 0; i < pageItem.length; i++) {
        pageItem[i].addEventListener('click', function () {
            for (let j = 0; j < pageItem.length; j++) {
                if (pageItem[j].classList.contains('active')) pageItem[j].classList.remove('active');
            }
            this.classList.add('active');
        })
    }
}

effectButton();

$(document).ready(function () {
    getP(0);
    $.ajax({
        url: "/api/user/saved/pages",
        type: "GET",
        dataType: "json",
        success: (data) => {
            if (data.status == 200) {
                let sizePage = data.data;
                let containButton = document.getElementById('contain-button');
                containButton.innerHTML = "";
                let button = "";
                button += '<li class="page-item page-0 ">\n' +
                    '                                <a class="page-link " onClick="getP(0)">Trang đầu</a>\n' +
                    '                            </li>';
                for (let i = 0; i < sizePage; i++) {
                    if (i == 0) {
                        button += '<li class="page-item active page-' + i + ' ">\n' +
                            '                                        <a class="page-link " onclick="getP(' + i + ')">' + (i + 1) + ' </a></li>';
                    } else {
                        button += '<li class="page-item page-' + i + '">\n' +
                            '                                        <a class="page-link " onclick="getP(' + i + ')">' + (i + 1) + '</a></li>';
                    }
                }
                button += '<li class="page-item page-' + (sizePage - 1) + '">\n' +
                    '                                <a class="page-link" onClick="getP(' + (sizePage - 1) + ')">Trang cuối</a>\n' +
                    '                            </li>';
                containButton.innerHTML = button;
            }
        },
        error: (data) => {
            errorAlert("Lỗi kết nối server")
        }
    })
})

function getP(offset) {
    console.log(offset)
    $.ajax({
        url: "/api/user/saved",
        type: "GET",
        data: {
            action: "add",
            offset: offset
        },
        success: function (data) {
            console.log(data)
            let data1 = JSON.parse(data);
            drawProject(data1);
        },
        error: function (data) {
            errorAlert("Lỗi kết nối server")
        }
    })

}


// function drawProject(data) {
//     console.log(data);
//     let container = document.getElementById('project-container');
//     container.innerHTML = "";
//     let project = '';
//     for (const x of data) {
//         project += '<div class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">' +
//             '<div' + ' class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">';
//
//
//         if (x.isSave) project += ' <i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'
//         else
//             project += '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>';
//         project += '<a href="/post/project/' + x.id + '">' +
//             '<img src="' + x.avatar + '"' + ' class="w-100">' +
//             ' <input type="hidden" class="project-id" value=' + x.id + '>' +
//             ' <div class="w-100 position-absolute projectCard-content">' +
//             '  <div class="mask justify-content-center d-flex h-100"' + ' style="background-color: rgba(48, 48, 48, 0.72);">' +
//             '<div class="align-items-center flex-column d-flex w-100">' +
//             ' <h6 class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">' + x.title + '</h6>' +
//             '<p class="text-white p-0 id-project">' +
//             '<strong>MDA:' + x.id + '</strong>' +
//             '</p>' + '<p class="text-white p-4 vanBan">' + x.description + '</p>' +
//             '</div>' + '</div></div></a></div></div>'
//     }
//     container.innerHTML = project;
// }

function drawProject(data) {
    console.log(data)
    $('#project-container').empty()
    for (const x of data) {
        getDownloadUrl(x.avatar, PROJECT).then((url) => {
            let project = `<div class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">
                <div class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">
                    ${x.isSave ? '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>' : '<i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'}
                    <a href="/post/project/${x.id}">
                        <img src="${url[0]}" class="w-100">
                        <input type="hidden" class="project-id" value="${x.id}">
                        <div class="w-100 position-absolute projectCard-content">
                            <div class="mask justify-content-center d-flex h-100" style="background-color: rgba(48, 48, 48, 0.72);">
                                <div class="align-items-center flex-column d-flex w-100">
                                    <h6 class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">${x.title}</h6>
                                    <p class="text-white p-0 id-project"><strong>MDA:${x.id}</strong></p>
                                    <p class="text-white p-4 vanBan" >${x.description}</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>`;
            $('#project-container').append(project);
        })
    }
    // container.innerHTML = project;
}

