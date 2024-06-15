<script src=" <c:url value="/template/lib/MDB_4_pro/js/popper.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/jquery.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/bootstrap.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/mdb.min.js"/>"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/api/layout',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                let categories = data.categories;
                categories.forEach(category => {
                    $('.series-category').append(
                        ` <a class="dropdown-item text-center text-uppercase" style="font-size: 16px"
                               href="/project?category=\${category.id}">\${category.name}</a>`
                    )
                });
                console.log($('.series-category').html())
                let services = data.services;
                services.forEach(service => {
                    $('.series-services').append(` <a class="dropdown-item text-center text-break text-uppercase" style="font-size: 16px"
                               href="/post/service/\${service.id}">\${service.name}</a>`)
                });
                console.log($('.series-services').html())
                let page = data.page


                // $('.series-category').html()
            },
            error: function (error) {
                console.log('layout error')
                console.log(error);
            }
        })

        url_page = window.location.pathname.substring(1);
        addBottomLineNavbar(url_page);

    });

    function addBottomLineNavbar(path) {
        // nav-menuItem-active
        console.log("path")
        console.log(path)
        switch (path){
            case 'home':
                $('.home').attr('id','nav-menuItem-active');
                console.log($('.home'));
                break;
            case 'project' || ' post/project':
                $('.project').attr('id','nav-menuItem-active');
                break;
            case 'service' || 'post/service':
                $('.service').attr('id','nav-menuItem-active');
                break;
            case 'contact':
                $('.contact').attr('id','nav-menuItem-active');
                break;
            case 'intro':
                $('.intro').attr('id','nav-menuItem-active');
                break;
            // case 'login':
            //     $('#login').addClass('active');
            //     break;
            // case 'register':
            //     $('#register').addClass('active');
            //     break;
            // case 'profile':
            //     $('#profile').addClass('active');
            //     break;
            // case 'admin':
            //     $('#admin
        }

    }

</script>