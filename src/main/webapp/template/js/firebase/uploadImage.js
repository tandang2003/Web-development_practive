import {initializeApp} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-analytics.js";
import {
    getStorage,
    ref,
    uploadBytesResumable,
    getDownloadURL
} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-storage.js";
let urls = {};
export const AVATAR = 'avatar';
export const PROJECT = 'project';
export const POST = 'post';
export const CATEGORY = 'category';
const firebaseConfig = {
    apiKey: "AIzaSyCQa7AbqqbJSjbsC-dxjM24wUgHNWFtdhk",
    authDomain: "doanweb-412120.firebaseapp.com",
    projectId: "doanweb-412120",
    storageBucket: "doanweb-412120.appspot.com",
    messagingSenderId: "766966245473",
    appId: "1:766966245473:web:f3113114ce2488749ae220",
    measurementId: "G-GBNZJVXBLT"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
export const storage = getStorage(app);
var storageRef = ref(storage);

export const upload = (file , place, swal?) => {
    var metadata = {
        contentType: 'image/jpeg'
    };
    urls = {};
    file.forEach((e, i) => {
        var uploadTask = uploadBytesResumable(ref(storageRef, place + '/' + e.file.name), e, metadata);
        uploadTask.on('state_changed',
            (snapshot) => {
                var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                console.log('Upload is ' + progress + '% done');
                switch (snapshot.state) {
                    case 'paused':
                        console.log('Upload is paused');
                        break;
                    case 'running':
                        console.log('Upload is running');
                        break;
                }
            },
            (error) => {
                errorAlert("Xin vui lòng thực hiện lại sau 5p")
            },
            () => {
                getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                    urls[e.file.name] = downloadURL;
                });
            }
        );
    })
}