import 'dart:async';
import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../values/value_manager.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final AppController controller = Get.find<AppController>();
  @override
  void initState() {
    start();
    super.initState();
  }

  void start() {
    Future.delayed(const Duration(seconds: 1), () {
      if (controller.authState == AuthState.checking) {
        return start();
      } else if (controller.loginUser == null) {
        print("User=>${controller.loginUser}");
        Get.offNamedUntil(Routes.layout, (route) => false);
      } else {
        Get.offNamedUntil(Routes.layout, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              ImageAssets.appLogo,
              fit: BoxFit.contain,
            ),
            const CircularProgressIndicator(
              color: ColorManager.primaryColor,
            )
          ],
        ),
      )),
    );
  }
}
