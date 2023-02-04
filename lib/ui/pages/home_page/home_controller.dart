import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/model/route_info.dart';
import 'package:flutter_app_firebase/ui/pages/login_page/login_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late LoginController loginController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    try {
      loginController = Get.find<LoginController>();
    } catch (e) {
      Get.offNamed(Injector.splashName);
    }
    super.onInit();
  }

  Future<List<RouteInfo>> getRoutes() async {
    try {
      QuerySnapshot result = await _firestore.collection('route_info').get();
      List<RouteInfo> routesInfo = [];
      for (var element in result.docs) {
        routesInfo.add(
          RouteInfo.fromJson(element.data() as Map<String, dynamic>),
        );
      }
      return routesInfo;
    } catch (e) {
      print("Error: ${e.toString()}");
      return [];
    }
  }

  String get getPersonPhone {
    return loginController.currentUser?.phone ?? "Lorem Ipsum";
  }
}
