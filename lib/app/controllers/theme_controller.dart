import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool _theme = false.obs;
  bool get theme => _theme.value;
  set theme(val) => _theme.value = val;
  ThemeData darkTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          secondary: ColorManager.primaryColor,
          primary: ColorManager.primaryColor,
          brightness: Brightness.dark));
//  ThemeData(
//     accentColor: Colors.red,
//     brightness: Brightness.dark,
//     primaryColor: Colors.amber,
//     buttonTheme: ButtonThemeData(
//       buttonColor: Colors.amber,
//       disabledColor: Colors.grey,
//     ));

  ThemeData lightTheme = ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primaryColor,
          secondary: ColorManager.primaryColor,
          primary: ColorManager.primaryColor));
}
