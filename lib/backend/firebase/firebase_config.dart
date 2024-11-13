import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD6Lrhc6GvKtlrTPYX--fT3zOlJaQcYxrk",
            authDomain: "oportunitech-10s6u8.firebaseapp.com",
            projectId: "oportunitech-10s6u8",
            storageBucket: "oportunitech-10s6u8.firebasestorage.app",
            messagingSenderId: "279680975533",
            appId: "1:279680975533:web:9b8ad6e51c69b42b417c24"));
  } else {
    await Firebase.initializeApp();
  }
}
