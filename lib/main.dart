import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/ui/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "flutter-app-firebase",
    options: Injector.currentPlatform,
  );
  runApp(const App());
}
