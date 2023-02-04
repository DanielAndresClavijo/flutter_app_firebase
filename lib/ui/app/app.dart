import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/ui/app/app_binding.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Injector.themeData,
      initialBinding: const AppBinding(),
      initialRoute: Injector.splashName,
      getPages: Injector.instance.getPages,
    );
  }
}
