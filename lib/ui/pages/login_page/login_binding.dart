import 'package:flutter_app_firebase/ui/pages/login_page/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  const LoginBinding();

  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}
