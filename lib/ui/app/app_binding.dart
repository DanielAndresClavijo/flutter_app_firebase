import 'package:flutter_app_firebase/ui/app/app_controller.dart';
import 'package:flutter_app_firebase/ui/app/auth_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AppController>(AppController(), permanent: true);
  }
}
