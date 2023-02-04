import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_firebase/injector.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController();

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) Get.offAllNamed(Injector.loginName);
    });
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;
}
