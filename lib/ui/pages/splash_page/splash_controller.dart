import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/ui/app/auth_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController({required this.authController});

  final AuthController authController;

  final RxBool _loading = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));
    _loading(false);
    if (authController.currentUser != null) {
      await Get.offNamed(Injector.homePath);
    } else {
      Get.offNamed(Injector.loginName);
    }
  }

  bool get loading => _loading.value;
}
