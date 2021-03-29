import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

/// Created by JB Pha Le on 3/28/21.
/// johnnycrystal9x@gmail.com

class FirebaseManager {
  static Future<void> initializeFirebase() async {
    // Requires that a Firestore emulator is running locally.
    // See https://firebase.flutter.dev/docs/firestore/usage#emulator-usage
    const bool USE_FIRESTORE_EMULATOR = false;

    // Wait for Firebase to initialize
    await Firebase.initializeApp();

    // The Firebase Emulators make it easier to fully validate your app's behavior and verify your Firebase Security Rules configurations.
    // Use the Firebase Emulators to run and automate unit tests in a local environment.
    if (USE_FIRESTORE_EMULATOR) {
      FirebaseFirestore.instance.settings = const Settings(
        host: 'localhost:8080',
        sslEnabled: false,
        persistenceEnabled: false,
      );
    }
  }
}
