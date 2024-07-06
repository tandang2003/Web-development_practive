
function like(project) {
    let id = $(project).parent().find('.project-id').val();
    console.log(id);
    $.ajax({
        url: "/api/save_project/" + id, type: "GET", success: function (response) {
            let resp = JSON.parse(response);
            if (resp.name == 'save') {
                project.classList.replace("fa-regular", "fa-solid")
            } else if (resp.name == 'delete') {
                project.classList.replace("fa-solid", "fa-regular")
                //= "fa-solid fa-bookmark position-absolute";
                // console.log(p);
            }
        }, error: function (response) {
            let resp = JSON.parse(response.responseText);
            window.location.href = resp.data;
        }
    })
}
