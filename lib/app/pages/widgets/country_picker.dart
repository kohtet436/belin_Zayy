import 'package:belin_zayy/app/pages/login_page/login_controller.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_country_picker/country_picker.dart';

class CountryPicker extends GetView<LoginController> {
  final bool fromSetting;
  const CountryPicker({Key? key, required this.fromSetting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final Country? _country = await countryPicker(
            context,
            width: context.width - 40,
            selectedColor: ColorManager.primaryColor,
            unSelectedColor: Colors.black,
            barrierDismissible: false,
            barrierColor: Colors.black54,
          );
          if (_country != null) {
            controller.selectedCountry = _country;
          }
        },
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.primaryColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p10, vertical: AppPadding.p14),
            child: Text(
                controller.selectedCountry.dialCode.isEmpty
                    ? "choose"
                    : "${controller.selectedCountry.dialCode} ${controller.selectedCountry.flag}",
                style: getSemiBoldStyle(
                    fontSize: FontSize.defaultFontSize,
                    color: ColorManager.primaryColor)),
          ),
        ));
  }
}
