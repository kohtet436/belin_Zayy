import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class EmptyProductWidget extends StatelessWidget {
  const EmptyProductWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      width: Get.size.width,
                      height: Get.size.height / 2,
                      child: RiveAnimation.asset('images/riv/empty.riv'))
                  // Image.asset(
                  //   'images/box.png',
                  // ),
                  ),
              Text(text,
                  textAlign: TextAlign.center,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.s20, color: ColorManager.primaryColor)
                  //  TextStyle(
                  //     color: color,
                  //     fontSize: FontSize.defaultFontSize,
                  //     fontWeight: FontWeight.w700),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
