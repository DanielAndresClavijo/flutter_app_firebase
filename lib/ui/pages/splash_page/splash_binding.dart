import 'package:flutter_app_firebase/ui/app/auth_controller.dart';
import 'package:flutter_app_firebase/ui/pages/splash_page/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(authController: Get.find<AuthController>()),
    );
  }
}
