import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/ui/pages/home_page/home_binding.dart';
import 'package:flutter_app_firebase/ui/pages/home_page/home_page.dart';
import 'package:flutter_app_firebase/ui/pages/login_page/login_binding.dart';
import 'package:flutter_app_firebase/ui/pages/login_page/login_page.dart';
import 'package:flutter_app_firebase/ui/pages/splash_page/splash_binding.dart';
import 'package:flutter_app_firebase/ui/pages/splash_page/splash_page.dart';
import 'package:get/get.dart';

class Injector {
  static final Injector instance = Injector._internal();

  factory Injector() {
    return instance;
  }

  Injector._internal();

  /// Firebase Options
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) throw UnsupportedError('Unsupported platform');
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _android;
      case TargetPlatform.fuchsia:
        throw UnsupportedError('Unsupported platform');
      case TargetPlatform.iOS:
        throw UnsupportedError('Unsupported platform');
      case TargetPlatform.linux:
        throw UnsupportedError('Unsupported platform');
      case TargetPlatform.macOS:
        throw UnsupportedError('Unsupported platform');
      case TargetPlatform.windows:
        throw UnsupportedError('Unsupported platform');
    }
  }

  static const FirebaseOptions _android = FirebaseOptions(
    apiKey: 'AIzaSyDwfQ8id6_q6ZIqgzByjurDnN2QF8n4WSM',
    appId: '1:69240593487:android:3b1a29b6933c6ebba45e3a',
    messagingSenderId: '69240593487',
    projectId: 'flutter-app-firebase-274a9',
  );

  /// Nombre de las rutas para la navegación entre paginas.
  static String get splashName => "/splash";
  static String get loginName => "/login";
  static String get homePath => "/home";

  /// Obtener lista de paginas para getX
  List<GetPage> get getPages {
    return [
      GetPage<SplashPage>(
        name: splashName,
        page: () => getSplashPage(),
        binding: const SplashBinding(),
      ),
      GetPage<LoginPage>(
        name: loginName,
        page: () => getLoginPage(),
        binding: const LoginBinding(),
      ),
      GetPage<HomePage>(
        name: homePath,
        page: () => getHomePage(),
        binding: const HomeBinding(),
      ),
    ];
  }

  /// WIDGETS

  SplashPage getSplashPage() {
    return const SplashPage();
  }

  LoginPage getLoginPage() {
    return const LoginPage();
  }

  HomePage getHomePage() {
    return const HomePage();
  }

  /// SETUP THEME
  static ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 43, 252, 95),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16.0),
          bodySmall: TextStyle(fontSize: 12.0),
        ),
      );
}
