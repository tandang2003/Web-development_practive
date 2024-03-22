let swiper = new Swiper('#catch', {
    slidesPerView: 1,
    // spaceBetween: 30,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,

    },
    breakpoints: {
        675: {
            slidesPerView: 2
        },
        800: {
            slidesPerView: 3
        }
    }
});
let items = document.querySelectorAll('.item-selector');
let cur = document.getElementsByClassName('item-selector active')
for (const item of items) {
    item.addEventListener('click', function () {
        for (const i of items) {
            if (i != item) {
                i.classList.remove('active')
                document.getElementById(i.getAttribute('type')).classList.remove('active')
            }
        }
        item.classList.add('active')
        document.getElementById(item.getAttribute('type')).classList.add('active')
    })
}

// while click fa-regular fa-bookmark change to fa-solid fa-bookmark
$(document).ready(function () {
    $('.fa-bookmark').click(function () {
        $(this).toggleClass('fa-regular fa-bookmark fa-solid fa-bookmark');
    });
});
