import {initializeApp} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-analytics.js";
import {
    getStorage,
    ref,
    uploadBytesResumable,
    getDownloadURL,
    deleteObject
} from "https://www.gstatic.com/firebasejs/10.12.3/firebase-storage.js";

export const AVATAR = 'avatar';
export const PROJECT = 'project';
export const GALLERY = 'gallery';
export const ORDER= 'order';
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


export const upload = (files, place) => {
    const metadata = {
        contentType: 'image/jpeg'
    };

    const uploadPromises = files.map((file) => {
        return new Promise((resolve, reject) => {
            const storageRef = ref(storage, `${place}/${file.file.name}`);
            const uploadTask = uploadBytesResumable(storageRef, file.file, metadata);

            uploadTask.on('state_changed',
                (snapshot) => {
                    const progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
                    console.log(`Upload is ${progress}% done`);
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
                    console.log("Error uploading file:", error);
                    reject(error);
                },
                () => {
                    getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
                        console.log('File available at', downloadURL);
                    })
                    resolve(file.file.name);
                }
            );
        });
    });

    return Promise.all(uploadPromises);
};
// export const upload = (file, place) => {
//     var urls = []
//     file.forEach((e, i) => {
//         var uploadTask = uploadBytesResumable(ref(storageRef, place + '/' + e.file.name), e.file);
//         uploadTask.on('state_changed',
//             (snapshot) => {
//                 console.log('totalBytes for upload ', snapshot.totalBytes)
//                 var progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
//                 console.log('Upload is ' + progress.toString() + '% done');
//                 switch (snapshot.state) {
//                     case 'paused':
//                         console.log('Upload is paused');
//                         break;
//                     case 'running':
//                         console.log('Upload is running');
//                         break;
//                 }
//             },
//             (error) => {
//                 errorAlert("Xin vui lòng thực hiện lại sau 5p")
//             },
//             () => {
//                 getDownloadURL(uploadTask.snapshot.ref).then((downloadURL) => {
//                     console.log('File available at', downloadURL);
//                 });
//                 urls.push(e.file.name)
//             }
//         );
//     })
//     return urls
// }

export const deleteImage = async (refFiles, place, repeat = 0) => {
    if (repeat > 3) {
        return false;
    }

    const files = refFiles.split(',');

    const deletePromises = files.map(fileName => {
        const fileRef = ref(storage, `${place}/${fileName}`);

        const attemptDelete = (retries) => {
            return deleteObject(fileRef)
                .then(() => true)
                .catch((error) => {
                    console.error(`Error deleting ${fileName}:`, error);
                    if (retries < 3) {
                        return attemptDelete(retries + 1);
                    } else {
                        return false;
                    }
                });
        };

        return attemptDelete(0);
    });

    // Wait for all delete promises to resolve
    const results = await Promise.all(deletePromises);

    // Check if all deletions were successful
    return results.every(result => result === true);
};