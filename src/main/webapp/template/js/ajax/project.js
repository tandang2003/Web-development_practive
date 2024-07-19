import {getDownloadUrl, PROJECT} from "../firebase/uploadImage.js";

$(document).ready(function () {
    $.ajax({
        url: "/api/project",
        type: "GET",
        dataType: "json",
        success: function (response) {
            console.log('project');
            console.log(response);
            let data = response;
            data = JSON.parse(data.data);
            let tag = '';
            for (let s of data.services) {
                tag += '<option value="' + s.id + '">' + s.name + '</option>';
            }
            $('#serviceId').append(tag);
            tag = '';
            for (let c of data.categories) {
                tag += '<option value="' + c.id + '">' + c.name + '</option>';
            }
            $('#categoryId').append(tag);
            tag = '';
            for (let p of data.provinces) {
                tag += '<option value="' + p.id + '">' + p.name + '</option>';
            }
            $('#provinceId').append(tag);
            tag = '';
            for (let p of data.prices) {
                tag += '<option value="' + p.amount + '">' + p.strType + '</option>';
            }
            $('#price').append(tag);
            tag = '';
            for (let a of data.acreages) {
                tag += '<option value="' + a + '">' + a + '</option>';
            }
            $('#area').append(tag);

        },
    })
})


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

// function getProject(i) {
//     $.ajax({
//         url: "/api/project/search",
//         type: "POST",
//         // dataType: "json",
//         data: i,
//         success: function (response) {
//             console.log('project');
//             console.log(response);
//             let data = JSON.parse(response);
//             console.log(data)
//             drawProject(data);
//             return false;
//         },
//         error: function (response) {
//             console.log('error');
//             console.log(response);
//         }
//     })
// }


function searching() {
    console.log("searching");
    let data = {
        "categoryId": $('#categoryId').val(),
        "provinceId": $('#provinceId').val(),
        "serviceId": $('#serviceId').val(),
        "price": $('#price').val(),
        "area": $('#area').val(),
    }
    if (data.categoryId === "") {
        delete data.categoryId;
    }
    if (data.provinceId === "") {
        delete data.provinceId;
    }

    if (data.serviceId === "") {
        delete data.serviceId;
    }
    if (data.price === "") {
        delete data.price;
    }
    if (data.area === "") {
        delete data.area;
    }
    getSize(data);
    getProject($.param(data), 0);
}

function getSize(data) {
    let fdata = data;
    if (fdata == null) {
        fdata = {
            "categoryId": $('#categoryId').val(),
            "provinceId": $('#provinceId').val(),
            "serviceId": $('#serviceId').val(),
            "price": $('#price').val(),
            "area": $('#area').val(),
        }
        if (fdata.categoryId === "") {
            delete fdata.categoryId;
        }
        if (fdata.provinceId === "") {
            delete fdata.provinceId;
        }

        if (fdata.serviceId === "") {
            delete fdata.serviceId;
        }
        if (fdata.price === "") {
            delete fdata.price;
        }
        if (fdata.area === "") {
            delete fdata.area;
        }
    }
    $.ajax({
        url: "/api/project/search/length",
        type: "POST",
        data: fdata,
        success: function (response) {
            let data = response;
            console.log(data)
            drawButton($.param(fdata), response);
            window.history.replaceState(null, null, "/project?" + $.param(fdata));
            return false;
        },
        error: function (response) {
            console.log(response);
        }
    })
}

function getProject(data, i) {
    if (data == null) {
        data = 'offset=' + i;
    } else data += "&offset=" + i;
    $.ajax({
        url: "api/project/search",
        type: "POST",
        // dataType: "json",
        data: data,
        success: function (response) {
            console.log('project');
            console.log(response);
            let data = JSON.parse(response);
            drawProject(data);
            return false;
        },
        error: function (response) {
            console.log(response);
        }
    })
}


function drawButton(fdata, size) {
    console.log(size)
    let data = fdata != null && fdata !== "" ? fdata : 'null';
    let container = document.getElementById('container-button');
    let page = '';
    page +=
        ' <li class="page-item page-0 " >' +
        '  <a class="page-link " onClick="getProject(\'' + data +
        '\',0)" >Trang đầu</a>' +
        '</li>'

    for (let i = 0; i < size; i++) {
        if (i === 0) {
            page +=
                '<li class="page-item active page-' + i + '">' +
                '<a class="page-link " onclick="getProject(\'' + data + '\',' + i + ')">' + (i + 1) + '</a></li>'

        } else
            page += '<li class="page-item page-' + i + '">' +
                '<a class="page-link" onclick="getProject(\'' + data + '\',' + i + ')">' + (i + 1) + '</a></li>'
    }
    page +=
        ' <li class="page-item page-' + (size - 1) + '" >' +
        '  <a class="page-link" onClick="getProject(\'' + data + '\',' + (size - 1) + ')" >Trang cuối</a>' +
        '    </li>'
    container.innerHTML = page;
    effectButton();
}


function drawProject(data) {
    console.log(data)
    // $('#project-container').innerHTML = "";
    $('#project-container').empty()
    for (const x of data) {
        getDownloadUrl(x.avatar, PROJECT).then((url) => {
            let project = `<div class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">
                <div class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">
                    ${x.isSave ? '<i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>' : '<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>'}
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


window.onload = searching();
window.searching= searching;
window.getProject = getProject
window.drawProject = drawProject
