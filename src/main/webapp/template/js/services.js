var allServices = [];

function renderServices() {
    return $.ajax({
        url: '/api/services',
        type: 'GET',
        dataType: 'json',
        success: function (result) {
            allServices = result.data;
        },
    })
}

function addService(page, idcontainer) {
    let container = document.getElementById(idcontainer);
    container.innerHTML = '';
    switch (page) {
        case 'home':
            allServices.forEach(service => {
                container.innerHTML += `
                 <a href="/post/service?id=${service.id}" class="card-home swiper-slide">
                        <div class="image-content">
                            <div class="card-image ">
                                <div href="postService.jsp"
                                     class="img-container  ">
                                    <div class="img-wrapper hover-image">
                                        <img src="${service.avatar}"
                                             alt=""
                                             class="card-img  ">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-content">
                            <h4 class="text-uppercase">${service.name}</h4>
                        </div>
                    </a>`;
            })
            break;
        case 'services':
            allServices.forEach(service => {
                container.innerHTML += `
       <div class="col-lg-4 col-md-6 mb-5">
                        <div class="card">
                            <div
                                    class="bg-image hover-overlay ripple"
                                    data-mdb-ripple-color="light">
                                <a href="#">
                                    <div
                                            class="mask"
                                            style="background-color: rgba(251, 251, 251, 0.15)"
                                    ></div>
                                    <div class="hover-img">
                                        <img
                                                src="${service.avatar}"
                                                class="img-fluid"/>
                                    </div>
                                </a>
                            </div>
                            <div class="card-body">
                                <div class="card-content">
                                    <h3 class="card-title">Dịch vụ ${service.name}</h3>
                                    <p class="card-text">
                                            ${service.description}
                                    </p>
                                </div>
                                <a href="/post/service?id=${service.id}" class="btn btn-rounded">Xem thêm</a>
                            </div>
                        </div>
                    </div>`;
            });
            break;
    }
}

function getServices(page, container) {
    $.when(renderServices()).done(function () {
        addService(page, container);
    })
}
