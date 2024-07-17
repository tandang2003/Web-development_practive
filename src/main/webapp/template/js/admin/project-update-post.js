CKEDITOR.replace('service-des');
CKEDITOR.config.width = "100%";
CKEDITOR.config.height = "800px";


$(document).ready(function () {
    initialData().then(data => {

    }).catch(error => {

    })
    $(".sidebar-btn").click(function () {
        $(".wrapper").toggleClass("mycollapse");
    });
});

function initialData() {
    return new Promise((resolve, reject) => {
        const id = window.location.href.split('/').pop();
        $.ajax({
            url: '/api/admin/project/edit/'+id,
            type: 'GET',
            success: function (data) {
                console.log(data)
                resolve(data);
            }
        });

    })

}

let cur;
for (let item of $('.sidebar-item')) {
    item.addEventListener('click', function () {
        if (cur != null) {
            cur.classList.remove('d-block');
            cur.classList.add('d-none');
        }
        if (this.children.length === 2) {
            this.children[1].classList.remove('d-none')
            this.children[1].classList.add('d-block')
            cur = this.children[1];
        }
    })
}

