import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIjRD1nYrXNCHp74JmfEaIKO21w-hNhTw",
            authDomain: "app-camaron-e8cea.firebaseapp.com",
            projectId: "app-camaron-e8cea",
            storageBucket: "app-camaron-e8cea.appspot.com",
            messagingSenderId: "247968940876",
            appId: "1:247968940876:web:8b0c853b6c20a49b1185e9",
            measurementId: "G-NQ74GD5NEG"));
  } else {
    await Firebase.initializeApp();
  }
}
