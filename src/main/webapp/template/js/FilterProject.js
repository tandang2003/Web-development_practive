var listImgProject = document.getElementById("imageProjects");
var listImgProject2 = document.getElementById("imageProjects2");
var listButton = document.querySelectorAll(".item-selector");
var listProjects = [
    {
        id: 1,
        title: "PHỐI CẢNH AN THIÊN",
        img: "public/img/project-img/screenshot-20230819-165117-8274.png",
        type: "villa", href: "http://localhost/RealEstateWeb/projectPost",
        price: "100.000.000",
        address: "Hà Nội",
        area: 50,
        detail: "Là một không gian làm việc đẳng cấp, tạo môi trường khuyến khích " +
            " sự sáng tạo và đổi mới."
    }, {
        id: 2,
        title: "NHÀ ANH HƯNG GÒ VẤP",
        img: "public/img/project-img/nhaanhchung-4935.jpg",
        type: "villa", href: "http://localhost/RealEstateWeb/projectPost",
        price: "100.000.000",
        address: "Hà Nội",
        area: 50,
        detail: "Nằm trong khu vực có nhiều tiện ích như trường học, " +
            "trung tâm thương mại, nhà hàng và giao thông thuận tiện."
    },
    {
        id: 3,
        title: "NHÀ ANH TIẾN Q.6",
        img: "public/img/project-img/screenshot-20230819-164028-776.png",
        type: "factory", href: "http://localhost/RealEstateWeb/projectPost",
        price: "100.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Là không gian làm việc độc đáo và đầy sáng tạo, tọa lạc tại trung tâm " +
            "Thành Phố Sài Gòn. Với thiết kế hiện đại, tiện nghi tiên tiến và không gian " +
            "mở, văn phòng này tạo nên môi trường làm việc thú vị và tràn đầy ý tưởng mới."
    },
    {
        id: 4,
        title: "NHÀ CÔ NGHỆ",
        img: "public/img/project-img/screenshot-20230819-164628-3831.png",
        type: "office", href: "http://localhost/RealEstateWeb/projectPost",
        price: "100.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Nằm trong khu vực có nhiều tiện ích như trường học, " +
            "trung tâm thương mại, nhà hàng và giao thông thuận lợi."
    },
    {
        id: 5,
        title: "NHÀ ANH DƯƠNG",
        img: "public/img/project-img/screenshot-20230819-165318-2198.png",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "200.000.000",
        address: "Hà Nội",
        area: 50,
        detail: "Khuôn viên của ngôi nhà này không quá rộng nhưng đã được sắp xếp " +
            "hợp lý. Với một khu vực sân trước có thể trồng cây cảnh, và một " +
            "khu vực sân sau làm nơi thư giãn và tiếp khách ngoài trời."
    },
    {
        id: 6,
        title: " BIỆT THỰ CHÂU ÂU",
        img: "public/img/project-img/Mau-thiet-ke-biet-thu-Chau-Au-e1672026132195.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "200.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Thiết kế biệt thự theo phong cách Châu Âu đang " +
            "khá được ưa chuộng hiện nay. Những mẫu biệt thự đẹp theo phong cách Châu Âu thể " +
            "hiện được sự quý tộc, và nguy nga trong từng đường lối thiết kế."
    },
    {
        id: 7,
        title: " BIỆT THỰ PHÁP",
        img: "public/img/project-img/thiet-ke-biet-thu-13-1-e1672026065491.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "200.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Thiết kế kiến trúc của Pháp rất phổ biến ở Châu Âu và nhiều quốc gia trên " +
            "thế giới. Những mẫu biệt thự đẹp theo phong cách kiến trúc Pháp thể hiện vẻ đẹp, sự cố kính ở mọi góc nhìn." +
            " Người nhìn bị choáng ngớp trước sự tráng lệ, nguy nga của những đường nét kiến trúc độc đáo."
    },
    {
        id: 8,
        title: " PHONG CÁCH GẦN GŨI VỚI THIÊN NHIÊN",
        img: "public/img/project-img/thiet-ke-biet-thu-20-1.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "200.000.000",
        address: "Hà Nội",
        area: 50,
        detail: "Một ý tưởng độc đáo thiết kế biệt thự đẹp và sang trọng bạn không nên bỏ " +
            "qua đó là tạo không gian sống gần gũi với thiên nhiên. Bạn chỉ cần bố trí một vài bồn hoa mini, chậu cây cảnh nhỏ để phủ xanh ngôi nhà. Cây xanh không chỉ có tác dụng điều hòa không khí " +
            "mà nó còn giúp cho cơ thể bạn cảm thấy thoải mái, giảm stress, mệt mỏi mỗi khi về nhà. "
    },
    {
        id: 9,
        title: "NHÀ PHỐ HIỆN ĐẠI",
        img: "public/img/project-img/thiet-ke-nha-3-3.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "200.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Thiết kế nhà phố vẫn luôn là xu hướng được yêu thích nhất trong những năm gần đây bởi vẻ đẹp sang trọng, hiện đại." +
            "Khác với những mẫu nhà đẹp khác, mẫu nhà nhà phố hiện đại trở nên nổi bật hơn nhờ thiết kế phóng khoáng, cởi mở tạo nên nét đặc trưng của loại nhà này. "
    },
    {
        id: 10,
        title: "THIẾT KẾ NHÀ ỐNG",
        img: "public/img/project-img/thiet-ke-nha-5-3.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "220.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Xu hướng thiết kế nhà ống vẫn luôn chiếm được cảm tình đông đảo của các gia chủ. Bởi với mẫu nhà đẹp này dù bạn có diện tích" +
            " đất nhỏ đến đâu thì vẫn có thể xây dựng được ngôi nhà mái thái hiện đại, đầy đủ tiện nghi. "
    },
    {
        id: 11,
        title: "THIẾT KẾ NHÀ ỐNG",
        img: "public/img/project-img/thiet-ke-nha-6-3.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "220.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Xu hướng thiết kế nhà ống vẫn luôn chiếm được cảm tình đông đảo của các gia chủ. Bởi với mẫu nhà đẹp này dù bạn có diện tích" +
            " đất nhỏ đến đâu thì vẫn có thể xây dựng được ngôi nhà mái thái hiện đại, đầy đủ tiện nghi. "
    },
    {
        id: 12,
        title: "THIẾT KẾ NHÀ MÁI THÁI",
        img: "public/img/project-img/thiet-ke-nha-7-2.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "250.000.000",
        address: "TP.HCM",
        area: 50,
        detail: "Thiết kế nhà mái thái đang ngày một thịnh hành ở Việt Nam. Mẫu nhà này thường được " +
            "xây dựng trên khu đất có diện tích từ 1000m2 trở lên. Vì thế với các vùng nông thôn " +
            "đất rộng kiểu nhà này được ví như làn gió mới thổi hồn vào nền kiến trúc nông thôn Việt Nam. "
    },
    {
        id: 13,
        title: "THIẾT KẾ NHÀ MÁI THÁI",
        img: "public/img/project-img/thiet-ke-nha-11-2.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "250.000.000",
        address: "Vũng Tàu",
        area: 150,
        detail: "Thiết kế nhà mái thái đang ngày một thịnh hành ở Việt Nam. Mẫu nhà này thường được " +
            "xây dựng trên khu đất có diện tích từ 1000m2 trở lên. Vì thế với các vùng nông thôn " +
            "đất rộng kiểu nhà này được ví như làn gió mới thổi hồn vào nền kiến trúc nông thôn Việt Nam. "
    },
    {
        id: 14,
        title: "THIẾT KẾ NHÀ KẾT HỢP KINH DOANH",
        img: "public/img/project-img/thiet-ke-nha-1-3.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "250.000.000",
        address: "TP.HCM",
        area: 100,
        detail: "Thiết kế nhà ở kết hợp kinh doanh đang là xu hướng nổi bật được xây dựng rất nhiều cho các lô nhà ở có vị trí trung tâm, đông người qua lại." +
            "Đối với xu hướng này, mẫu nhà ở thường được thiết kế từ 2-3 tầng trở lên. Không gian tầng 1 sẽ được tận dụng để kinh doanh bán shop quán áo, quán cafe, không gian tầng 2 trở lên sẽ là diện tích sử dụng phục vụ sinh hoạt của chủ nhà."
    },
    {
        id: 15,
        title: "NHÀ PHỐ HIỆN ĐẠI TẠI HẢI DƯƠNG",
        img: "public/img/project-img/z3904713175018_2c57fb9ac39d925179c2278269912155_1671524950.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "250.000.000",
        address: "Hà Nội",
        area: 200,
        detail: "Thiết kế kiến trúc nhà phố này không quá cầu kì, tiết kiệm chi phí nhưng vẫn tạo được điểm nhấn thu hút, tính thẩm mỹ cao. Công trình này đã làm gia chủ vô cùng hài lòng và nhận được sự đánh giá cao của nhiều người."
    },
    {
        id: 16,
        title: "biệt thự 3 tầng tân cổ điển tại Hưng Yên",
        img: "public/img/project-img/z3847844894352_7861e6b4d68f074f93d76fa303b57940_1671166352-1229x1536.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "factory",
        price: "30.000.000",
        address: "Vũng Tàu",
        area: 150,
        detail: "Sự hòa quyện giữa kiến trúc và ánh sáng giúp cho căn biệt thự thêm phần xa hoa, lộng lẫy, nổi bật. Chắc chắn sẽ thu hút tất cả ánh nhìn khi đi qua nó. Đây cũng là lúc để cho gia chủ thể hiện sự đẳng cấp và sang trọng."
    },
    {
        id: 17,
        title: "Khu đô thị Phú Mỹ Hưng",
        img: "public/img/project-img/z3847844894352_7861e6b4d68f074f93d76fa303b57940_1671166352-1229x1536.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "200.000.000",
        address: "TP.HCM",
        area: 150,
        detail: "Dự án nhà ở này mang đậm bản sắc kiến trúc hiện đại, với thiết kế đa dạng và hài hòa. Các căn hộ được trang bị tiện nghi hiện đại, phục vụ cuộc sống hàng ngày của cư dân. Khuôn viên xanh mát và tiện ích dịch vụ đa dạng đem lại không gian sống lý tưởng."
    },
    {
        id: 18,
        title: "Căn hộ Vinhomes Central Park ",
        img: "public/img/project-img/project1.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "90.000.000",
        address: "TP.HCM",
        area: 100,
        detail: "Hệ thống an ninh 24/7 và đội ngũ quản lý chuyên nghiệp mang đến sự an toàn và tiện lợi cho cư dân. Vị trí thuận lợi gần trung tâm và kết nối giao thông thuận lợi là điểm mạnh của dự án. Chất lượng xây dựng và vật liệu sử dụng cao cấp, đảm bảo tính bền vững và thẩm mỹ."
    },
    {
        id: 19,
        title: "NHÀ PHỐ HIỆN ĐẠI",
        img: "public/img/project-img/project2.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "80.000.000",
        address: "Vũng Tàu",
        area: 100,
        detail: "Dự án tập trung vào việc xây dựng cộng đồng văn minh, tạo nên một môi trường sống xanh, sạch sẽ và đẳng cấp. Các tiện ích công cộng như trường học, bệnh viện, siêu thị và khu vui chơi giải trí gần kề, mang đến tiện ích hàng ngày cho cư dân."
    },
    {
        id: 20,
        title: "NHÀ PHỐ HIỆN ĐẠI TẠI TPHCM",
        img: "public/img/project-img/project3.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "office",
        price: "80.000.000",
        address: "TP.HCM",
        area: 150,
        detail: "Dự án có mức giá hợp lý, phù hợp với đa dạng đối tượng cư dân. Các căn hộ được thiết kế thông minh, tối ưu hóa diện tích sử dụng và tạo không gian thoải mái. Dự án đặc biệt quan tâm đến môi trường và tiết kiệm năng lượng, thể hiện cam kết bảo vệ môi trường xanh."
    },
    {
        id: 21,
        title: "biệt thự 3 tầng tại Vĩnh Phúc",
        img: "public/img/project-img/project4.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "factory",
        price: "80.000.000",
        address: "TP.HCM",
        area: 200,
        detail: "Các khu vực xanh và tiện ích công cộng được quy hoạch hài hòa, mang đến không gian sống gắn kết và phát triển bền vững. Chủ đầu tư dự án đã tính toán kỹ lưỡng về các tiện ích dịch vụ, đáp ứng đầy đủ nhu cầu của cư dân. "
    },
    {
        id: 22,
        title: "biệt thự 3 tầng tại Đà Nẵng",
        img: "public/img/project-img/project5.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "office",
        price: "50.000.000",
        address: "TP.HCM",
        detail: "Dự án được xem là lựa chọn lý tưởng cho những người đang tìm kiếm một nơi an cư lâu dài với chất lượng sống cao cấp."
    },
    {
        id: 23,
        title: "NHÀ PHỐ HIỆN ĐẠI TẠI Hà Nội",
        img: "public/img/project-img/project6.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "villa",
        price: "19.000.000",
        address: "Vũng Tàu",
        area: 200,
        detail: "Dự án nhà ở này đặt trọng điểm vào không gian sống xanh, với công viên và khu vườn rộng lớn. Kiến trúc mang nét đặc trưng, thể hiện sự đa dạng và phong cách độc đáo. Các căn hộ được thiết kế linh hoạt, tối ưu diện tích và ánh sáng tự nhiên."
    },
    {
        id: 24,
        title: "NHÀ PHỐ HIỆN ĐẠI TẠI Nam Định",
        img: "public/img/project-img/project7.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "office",
        price: "180.000.000",
        address: "TP.HCM",
        area: 250,
        detail: "Hệ thống tiện ích nội khu bao gồm bể bơi, phòng tập gym và sân chơi trẻ em, tạo nên cuộc sống tiện nghi và đa dạng cho cư dân. Dự án tập trung vào việc tạo nên môi trường sống thoáng đãng, yên bình và an lành, phù hợp cho cả gia đình và người độc thân."
    },
    {
        id: 25,
        title: "THIẾT KẾ NHÀ MÁI TÔN",
        img: "public/img/project-img/project8.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "townhouse",
        price: "180.000.000",
        address: "TP.HCM",
        area: 250,
        detail: "Vị trí dự án thuận lợi, gần trung tâm thành phố và các tuyến giao thông chính, giúp cư dân di chuyển dễ dàng và tiết kiệm thời gian. Các căn hộ được xây dựng với chất liệu và thiết bị cao cấp, mang đến không gian sống đẳng cấp và lịch lãm."
    },
    {
        id: 26,
        title: "PHỐI CẢNH AN THIÊN TRÀ ĐẠO",
        img: "public/img/project-img/z3847844894352_7861e6b4d68f074f93d76fa303b57940_1671166352-1229x1536.jpg",
        href: "http://localhost/RealEstateWeb/projectPost",
        type: "factory",
        price: "40.000.000",
        address: "Vũng Tàu",
        area: 250,
        detail: "Môi trường sống xanh và bảo vệ môi trường là mục tiêu quan trọng của dự án, thể hiện tâm huyết và sự cam kết của chủ đầu tư. Dự án nhà ở này mang đến sự lựa chọn hoàn hảo cho người muốn tận hưởng cuộc sống hiện đại và tiện nghi."
    },
];

let projectFilter = listProjects;


function showList(projectFilter) {
    listImgProject.innerHTML = "";
    projectFilter.forEach(item => {
        //createCol
        let col = document.createElement("div");
        col.classList.add('col-lg-3', 'col-md-4', 'col-sm-6', 'mb-4',
            'overflow-hidden', 'position-relative', 'projectCard-container');
        //createA
        let a = document.createElement("a");
        a.classList.add('bg-image', 'position-relative', 'hover-image', 'hover-zoom'
            , 'ripple', 'shadow-1-strong', 'rounded-5', 'w-100', 'd-block');
        a.href = item.href;
        //createImage
        let newImage = new Image();
        newImage.src = item.img;
        newImage.classList.add('w-100');
        //createDiv
        let newDiv = document.createElement("div");
        newDiv.classList.add('w-100', 'position-absolute', 'projectCard-content');
        //createMask
        let mask = document.createElement("div");
        mask.classList.add('mask', 'justify-content-center', 'd-flex', 'h-100');
        mask.style.backgroundColor = "rgba(48, 48, 48, 0.72)";
        //createDiv3
        let newDiv3 = document.createElement("div");
        newDiv3.classList.add('align-items-center', 'flex-column', 'd-flex', 'w-100');
        //createH6
        let h6 = document.createElement("h6");
        h6.innerHTML = item.title;
        h6.classList.add('text-white', 'text-center', 'pt-4', 'projectTitle-center', 'text-uppercase');
        //createP
        let p = document.createElement("p");
        p.innerHTML = item.detail;
        p.classList.add('text-white', 'p-4');

        newDiv3.appendChild(h6);
        newDiv3.appendChild(p);

        mask.appendChild(newDiv3);

        newDiv.appendChild(mask);

        a.appendChild(newImage);
        a.appendChild(newDiv);

        col.appendChild(a);

        listImgProject.appendChild(col);
        listImgProject2.appendChild(col);
    });
}


// ---------------------------------------------------------------------------------------------------------------------

// let filter = document.getElementsByName('category');
//
// let select = document.getElementById('form-outline');
//
// let subProductFilter = listProjects;
//
// showList(subProductFilter);
//
// select.addEventListener('change', function (e) {
//     e.preventDefault();
//
//     let selected = e.target.elements;
//
//     subProductFilter = listProjects.filter(item => {
//         if (selected.category.value !== '') {
//             if (item.type !== selected.category.value) {
//                 return false;
//             }
//         }
//         return true;
//     });
//     showList(subProductFilter);
// });


/*----------------------------------------------------------------------------------------------------------------------*/

let categorySelect = document.getElementById('category');
let addressSelect = document.getElementById('address');
let areaSelect = document.getElementById('area');
let minInput = document.getElementById('typeNumber');
let maxInput = document.getElementById('typeNumber2');
let subProductFilter = listProjects;

showList(subProductFilter);

categorySelect.addEventListener('change', applyFilters);
addressSelect.addEventListener('change', applyFilters);
areaSelect.addEventListener('change', applyFilters);
minInput.addEventListener('input', applyFilters);
maxInput.addEventListener('input', applyFilters);

function applyFilters() {
    let selectedCategory = categorySelect.value;
    let selectedAddress = addressSelect.value;
    let selectedArea = areaSelect.value;
    let minPrice = minInput.value;
    let maxPrice = maxInput.value;
    subProductFilter = listProjects.filter(item => {
        let isCategoryMatch = selectedCategory === '' || item.type === selectedCategory;
        let isAddressMatch = selectedAddress === '' || item.address === selectedAddress;
        let isAreaMatch = selectedArea === '' || item.area === selectedArea;
        let isPriceMatch = item.price >= minPrice && item.price <= maxPrice;

        return isCategoryMatch && isAddressMatch && isPriceMatch && isAreaMatch;
    });

    showList(subProductFilter);
}
