// Add active class to the current button (highlight it)
let header = document.getElementById("navbarSupportedContent-555");
let btns = header.getElementsByClassName("nav-menuItem");
for (let i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        let current = document.getElementById("nav-menuItem-active");
        current.removeAttribute('id');
        this.setAttribute('id', 'nav-menuItem-active');
    });
}


function myFunction(x) {
    if (x.matches) {
        let drBtns = document.querySelectorAll(".nav-dropdownItem");

        for (let i = 0; i < drBtns.length; i++) {
            drBtns[i].addEventListener("click", function () { console.log(123)
                for (let j = 0; j < drBtns.length; j++) {
                    if (drBtns[j].children[2].classList.contains("d-block")) {
                        drBtns[j].children[2].classList.remove("d-block");
                        if(drBtns[i].body===drBtns[j].body)
                            return;
                    };
                }
                    drBtns[i].children[2].classList.add("d-block");
            });
        }
    }
}

var x = window.matchMedia("(max-width: 992px)")
myFunction(x) // Call listener function at run time

