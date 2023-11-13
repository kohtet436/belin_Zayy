import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../values/font_manager.dart';
import '../values/style_manager.dart';

class LoginFrameWidget extends StatelessWidget {
  final String title;
  final bool isLogin;
  final String subtitle;
  List<Widget> children;
  LoginFrameWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.children,
      this.isLogin = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: ColorManager.primaryColor,
                child: Padding(
                  padding: WidgetUtil.defaultAllPadding(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLogin
                          ? Container()
                          : IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              onPressed: Get.back,
                              icon: const Icon(Icons.arrow_back,
                                  size: 30, color: Colors.white)),
                      WidgetUtil.spaceVertical(AppSize.s20),
                      Text(title,
                          style: getSemiBoldStyle(
                              color: Colors.white, fontSize: FontSize.s25)),
                      WidgetUtil.spaceVertical(AppSize.s8),
                      Text(subtitle,
                          style: getRegularStyle(
                              fontSize: FontSize.s18, color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                top: 200,
                left: 0,
                right: 0,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppRadius.r30),
                        topRight: Radius.circular(AppRadius.r30)),
                  ),
                  child: Padding(
                    padding: WidgetUtil.defaultAllPadding(),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [...children],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
