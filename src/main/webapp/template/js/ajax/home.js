// page on ready
import {getDownloadUrl, PROJECT} from "../firebase/uploadImage.js";
import {getServices} from "../services.js";

$(document).ready(function () {
    getServices("home", "services-container");
    $.ajax({
        url: `/api/home/data`, type: `Get`,
        success: function (data) {
            let res = JSON.parse(data);
            let slides = res[`sliders`];
            slides.forEach((x, index) => {
                let active = index === 0 ? "active" : "";
                $(`#slide-container`).append(`<div class="carousel-item ${active} w-100">
                        <img class="d-block w-100 " src="${x.avatar}"
                             alt="${x.title}">`)
            })
            let categories = res[`categories`];
            categories.forEach((x, index) => {
                $(`#category-container`).append(`<li class="category-item">
                         <button class="item-selector "
                                   role="tab" onclick="getProject(${x.id})"
                                   title="${x.name}">
                              XÂY DỰNG ${x.name}
                          </button>`)
            })
            let list = res[`projects`];
            list.forEach((x, index) => {
                drawProject(x).then((project) => {
                    $(`#project-container`).append(project);
                });
            })
        }
        ,
        error: function (data) {
        }
    })
})


 function getProject(id, notLoad = true) {
    $.ajax({
        url: `/api/home/projects/` + id,
        type: `Get`, // dataType: `json`,
        // data: {id: id},
        success: function (data) {
            let resdata = JSON.parse(data)
            let list = resdata.data
            let containter = document.getElementById(`project-container`);
            let project = "";
            containter.innerHTML = "";
            for (const x of list) {
                drawProject(x).then((project) => {
                    containter.innerHTML += project;
                });
            }

        }, error: function (data) {
        }
    })
}

function drawProject(x) {
    let project = "";
    let img = `<img src="/template/img/loading.gif" class="w-100">`;
    return new Promise((resolve, reject) => {
        getDownloadUrl(x.avatar, PROJECT).then((url) => {
            img = `<img src="${url[0]}" class="w-100">`; // Update image with fetched URL
            updateProjectCard(); // Update project card HTML
            resolve(project); // Resolve the promise with the updated HTML
        }).catch(error => {
            console.error("Error fetching image URL: ", error);
            updateProjectCard(); // Update project card even if there's an error
            reject(error); // Reject the promise in case of an error
        });

        function updateProjectCard() {
            project += `<div class="col-lg-3 col-md-4 col-sm-6 mb-4 overflow-hidden position-relative projectCard-container">` +
                `<div class="bg-image hover-image hover-zoom ripple shadow-1-strong rounded-5 w-100 d-block">`;
            if (x.isSave) {
                project += `<i class="fa-solid fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>`;
            } else {
                project += `<i class="fa-regular fa-bookmark position-absolute" onclick="like(this)" style="z-index: 1000"></i>`;
            }
            project += `<a href="/post/project/${x.id}">`;
            project += img +
                `<input type="hidden" class="project-id" value="${x.id}">` +
                `<div class="w-100 position-absolute projectCard-content">` +
                `<div class="mask justify-content-center d-flex h-100" style="background-color: rgba(48, 48, 48, 0.72);">` +
                `<div class="align-items-center flex-column d-flex w-100">` +
                `<h6 class="text-white text-center pl-2 pr-2 projectTitle-center text-uppercase">${x.title}</h6>` +
                `<p class="text-white p-0 id-project">` +
                `<strong>MDA:${x.id}</strong>` +
                `</p>` +
                `<p class="text-white p-4 vanBan">${x.description}</p>` +
                `</div>` +
                `</div></div></a></div></div>`;
        }
    });
}

window.getProject= getProject;