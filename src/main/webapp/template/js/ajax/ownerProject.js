import {getDownloadUrl, PROJECT} from "../firebase/uploadImage.js";

$(document).ready(function () {
    $.ajax({
        url: "/api/user/project",
        type: "GET",
        dataType: "json",
        success: function (data) {
            let projects = data.projects;
            let map = data.map;
            // for (let i = 0; i < projects.length; i++) {
            //     let project = projects[i];
            //     let services = project.map;
            //     let service = "";
            //     for (let j = 0; j < services.length; j++) {
            //         service += services[j].name + " ";
            //     }
            //     map[project.id] = service;
            // }
            // for (let i = 0; i < projects.length; i++) {
            //     let project = projects[i];
            //     let serviceNames = map[project.id]; // Get service names for current project id
            //     project.services = serviceNames; // Add service names to the project object
            // }
            $("#project-container").empty();
            projects.forEach(project => {
                getDownloadUrl(project.avatar, PROJECT).then(url => {
                  let  html = `<div class="border box-project hover-image d-flex">
                        <a >
                            <img src="${url[0]}">
                        </a>
                        <div class="w-100 flex-column">
                            <div class="box-content">
                                <h4>${project.title}</h4>
                                <p><span>Chủ đầu tư: </span>${project.owner}</p>
                                <p><span>Địa chỉ: </span>${project.province}</p>
                                <p><span>Loại dự án: </span>${project.category}</p>
                                <p><span>Loại dịch vụ: </span>${map[project.id]}</p>
                                <p><span>Mã dự án: </span>${project.id}</p>
                                <p><span>Dự toán kinh phí: </span>${project.price}</p>
                                <p><span>Tiến độ công trình: </span>${project.schedule}</p>
                                <p><span>Dự kiến thời điểm hoàn thành: </span>${project.estimated_complete}</p>
                            </div>
                            <div class="box-button d-flex justify-content-around">
                                <a href="/user/own-project/demo-post/${project.id}">
                                    <button class="btn btn-blue font-weight-bold ml-0"> Xem bài viết về dự án</button>
                                </a>
                                ${project.isAccepted === 1 ? `<button class="btn btn-grey font-weight-bold ml-0"> Đã được duyệt</button> `: `<button onclick="accept(${project.id})" class="btn btn-green font-weight-bold ml-0"> Chờ duyệt</button>`}
                            </div>
                        </div>
                    </div>`;
                    $("#project-container").append(html);
                })
                });

            },
            error: function (data) {
                let value = JSON.parse(data.responseText);
                console.log(value);
            }
        })
    })

    function accept(id) {
        console.log(id)
        $.ajax({
            url: "/api/user/accepted",
            type: "POST",
            data: {
                id: id
            },
            success: function (data) {
                let value= JSON.parse(data);
                if (value.name == "success") {
                    alert("Đã cho phép đăng bài viết");
                    location.reload();}
            },
            error: function (data) {
               let value= JSON.parse(data.responseText);
                if (value.name == "error") {
                    location.href=value.data;
                }
            }
        })
}
window.getP=getP
