importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');

firebase.initializeApp({
    apiKey: "AIzaSyBH1xWZDVxP38IRmdSXwGrV4qLhaoYuIVU",
    authDomain: "flutter-newbie.firebaseapp.com",
    databaseURL: "https://flutter-newbie.firebaseio.com",
    projectId: "flutter-newbie",
    storageBucket: "flutter-newbie.appspot.com",
    messagingSenderId: "729664719701",
    appId: "1:729664719701:web:ba1857e74edf64678cfddc",
});

const messaging = firebase.messaging();