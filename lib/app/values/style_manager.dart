import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle getRegularStyle({required double fontSize, required Color color}) {
  return TextStyle(
      fontSize: fontSize, color: color, fontWeight: FontWeightManager.regular);
}

TextStyle getSemiBoldStyle({required double fontSize, required Color color}) {
  return TextStyle(
      fontSize: fontSize, color: color, fontWeight: FontWeightManager.semiBold);
}

TextStyle getMediumStyle({required double fontSize, required Color color}) {
  return TextStyle(
      fontSize: fontSize, color: color, fontWeight: FontWeightManager.medium);
}

TextStyle getLightStyle({required double fontSize, required Color color}) {
  return TextStyle(
      fontSize: fontSize, color: color, fontWeight: FontWeightManager.light);
}

ButtonStyle elevatedButtonStyle(
    // {
    // Color? backgroundColor,
    // required Color foregroundColor
    // }
    ) {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    // backgroundColor: backgroundColor ?? Colors.grey[300],
    minimumSize: const Size(double.infinity, 45),
    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
    ),
  );
}
