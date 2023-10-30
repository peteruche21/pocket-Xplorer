import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA9nsxd41-RbyfFaBj93MYVIFSFQ-g3Mzk",
            authDomain: "chainbase-pocketxplorer.firebaseapp.com",
            projectId: "chainbase-pocketxplorer",
            storageBucket: "chainbase-pocketxplorer.appspot.com",
            messagingSenderId: "745818222697",
            appId: "1:745818222697:web:e9c6592aac090ecd6b32f8",
            measurementId: "G-9QJK5BK3WJ"));
  } else {
    await Firebase.initializeApp();
  }
}
