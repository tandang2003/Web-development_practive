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

