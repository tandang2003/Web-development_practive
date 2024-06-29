<script src=" <c:url value="/template/lib/MDB_4_pro/js/popper.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/jquery.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/bootstrap.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/mdb.min.js"/>"></script>
<script src="jquery.validate.js"></script>
<script>
    $(document).ready(function () {
        $.ajax({
            url: '/api/layout',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                let categories = data.categories;
                categories.forEach(category => {
                    $('.series-category').append(
                        ` <a class="dropdown-item text-center text-uppercase" style="font-size: 16px"
                               href="/project?category=\${category.id}">\${category.name}</a>`
                    )
                });
                let services = data.services;
                services.forEach(service => {
                    $('.series-services').append(` <a class="dropdown-item text-center text-break text-uppercase" style="font-size: 16px"
                               href="/post/service/\${service.id}">\${service.name}</a>`)
                });
                let page = data.page
                // $('.series-category').html()
            },
            error: function (error) {
            }
        })

        url_page = window.location.pathname.substring(1);
        addBottomLineNavbar(url_page);

    });

    function addBottomLineNavbar(path) {
        switch (path){
            case 'home':
                $('.home').attr('id','nav-menuItem-active');
                break;
            case 'project' :
                $('.project').attr('id','nav-menuItem-active');
                break;
            case 'service' :
                $('.service').attr('id','nav-menuItem-active');
                break;
            case 'contact':
                $('.contact').attr('id','nav-menuItem-active');
                break;
            case 'intro':
                $('.intro').attr('id','nav-menuItem-active');
                break;
        }
        if (path.startsWith("post/service")){
            $('.service').attr('id','nav-menuItem-active');
        }
        else if (path.startsWith("post/project")){
            $('.project').attr('id','nav-menuItem-active');
        }

    }

</script>