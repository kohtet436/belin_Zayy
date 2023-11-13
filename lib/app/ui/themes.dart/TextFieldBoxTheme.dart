import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:flutter/material.dart';

abstract class TextFieldBoxThemes {
  static InputDecoration inputDecoration = InputDecoration(
    hintText: "959*****",
    hintStyle:
        getRegularStyle(fontSize: FontSize.defaultFontSize, color: Colors.grey),
    isDense: true,
    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.primaryColor,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.primaryColor,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorManager.primaryColor,
      ),
    ),
  );

  static final List<String> offerImages = [
    'images/offres/Offer1.jpg',
    'images/offres/Offer2.jpg',
    'images/offres/Offer3.jpg',
    'images/offres/Offer4.jpg'
  ];
  static List<String> authImagesPaths = [
    'images/landing/buy-on-laptop.jpg',
    'images/landing/buy-through.png',
    'images/landing/buyfood.jpg',
    'images/landing/grocery-cart.jpg',
    'images/landing/grocery-cart.jpg',
    'images/landing/store.jpg',
    'images/landing/vergtablebg.jpg',
  ];
}
