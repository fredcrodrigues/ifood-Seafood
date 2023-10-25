import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2NH0j3XgqEhAObKjoU5D-uR2mXjoWuVM",
            authDomain: "turkish-shop.firebaseapp.com",
            projectId: "turkish-shop",
            storageBucket: "turkish-shop.appspot.com",
            messagingSenderId: "59964437078",
            appId: "1:59964437078:web:fd9e9f767201982e2c41f7"));
  } else {
    await Firebase.initializeApp();
  }
}
