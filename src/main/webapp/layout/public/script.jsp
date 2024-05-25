<script src=" <c:url value="/template/lib/MDB_4_pro/js/popper.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/jquery.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/bootstrap.min.js"/>"></script>
<script src=" <c:url value="/template/lib/MDB_4_pro/js/mdb.min.js"/>"></script>
<script>
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
            // $('.series-category').html()
        }
    })


</script>