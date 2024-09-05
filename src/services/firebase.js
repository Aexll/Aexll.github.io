// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDL5FcfYUCBkJaHo3yvbdLum1z1F_AhP6g",
    authDomain: "axelwebsite.firebaseapp.com",
    databaseURL: "https://axelwebsite-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "axelwebsite",
    storageBucket: "axelwebsite.appspot.com",
    messagingSenderId: "567821055827",
    appId: "1:567821055827:web:a433ff421298c1ef68d3a6",
    measurementId: "G-78F6MKKBT4"
};


// Initialize Firebase
const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);
const db = getFirestore(app);
export default db;