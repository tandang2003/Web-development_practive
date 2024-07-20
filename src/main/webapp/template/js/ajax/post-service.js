import {getDownloadUrl, SERVICE} from "../firebase/uploadImage.js";

let id = window.location.href.substring(window.location.href.lastIndexOf('/'))
$.ajax({
    url: '/api/post/services' + id,
    dataType: 'json',
    type: 'GET',
    success: function (data) {
        let service = data.data;
        document.title = service.name
        $('.service-name').text(service.name)
        $('.service-update').text(service.updatedAt)
    }
})
$.ajax({
    url: '/api/post/services/' + id + '/post',
    dataType: 'json',
    type: 'GET',
    success: function (data) {
        let post = data.data;
        $('.service-post-content').html(post.content + $('.service-post-content').html())
    }
})
$.ajax({
    url: '/api/post/services/' + id + '/suggest',
    dataType: 'json',
    type: 'GET',
    success: async function (data) {
        let suggestServices = data.data;
        const downloadUrl = await getDownloadUrl(suggestServices.map(service => service.avatar).join(','), SERVICE)
        let suggestServiceHtml = ''
        suggestServices.forEach((service,index) => {
            suggestServiceHtml += `
 <li class="feature-news-items mb-2">
                                                    <a href="/post/service/${service.id}"
                                                       class="feature-news-items-link d-flex row"
                                                       role="link">
                                                        <div class="feature-news-items-img d-block hover-image col-5 pr-0">
                                                            <img src="${downloadUrl[index]}" alt="">
                                                        </div>
                                                        <div class="feature-news-items-info col-6 pl-0">
                                                            <div class="feature-news-items-info-title text-uppercase">
                                                                    ${service.name}
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
               `
        })
        $('.feature-news-list').html(suggestServiceHtml)
    }
})

