import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension BuildContextExtension on BuildContext {
  //TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
