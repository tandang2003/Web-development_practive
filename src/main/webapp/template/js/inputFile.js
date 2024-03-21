    let allFiles = [];
    let input = document.getElementById("avatar");
    let container = document.getElementsByClassName("img-container");
    // console.log(input.files)
    if(input.files.length!== 0|| allFiles.length!==0){
    container[0].parentElement.classList.add('d-block')
    container[0].parentElement.classList.remove('d-none')
}else{
    container[0].parentElement.classList.add('d-none')
    container[0].parentElement.classList.remove('d-block')
}

    input.addEventListener('change', function () {
    let files = this.files;allFiles=[];
    for (let i = 0; i < files.length; i++) {
    allFiles.push(files[i])
}
    showImage();
})

    const showImage = () => {
    if(input.files.length!== 0){
    container[0].parentElement.classList.add('d-block')
    container[0].parentElement.classList.remove('d-none')
}else{
    container[0].parentElement.classList.add('d-none')
    container[0].parentElement.classList.remove('d-block')
}
    let images = ' ';
    allFiles.forEach((e, i) => {
        console.log(URL.createObjectURL(e))
    images += '<div class="image position-relative border-radius"><img src="' + URL.createObjectURL(e) + '" alt="" class="border"> ' +
    '<div class="position-absolute " > <i class="fa-solid fa-xmark" onclick="delImage(' + i + ')" style=""></i></div></div>'
})
    container[0].innerHTML = images
}
    let dt = new DataTransfer();
    const delImage = index => {
    let dt = new DataTransfer();
    for (let i = 0; i < input.files.length; i++) {
    if (index !== i)
    dt.items.add( input.files[i]) // here you exclude the file. thus removing it.
}
    input.files = dt.files
    allFiles=Array.from(input.files)
    showImage()
}
// document.onload = function () {
//         if(input.files.length!== 0) {
//         input.files
//         }
// };