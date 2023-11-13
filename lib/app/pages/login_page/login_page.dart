import 'package:belin_zayy/app/pages/login_page/login_controller.dart';
import 'package:belin_zayy/app/pages/test_page.dart';
import 'package:belin_zayy/app/pages/widgets/country_picker.dart';
import 'package:belin_zayy/app/pages/widgets/login_or_widget.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/ui/themes.dart/TextFieldBoxTheme.dart';
import 'package:belin_zayy/app/ui/themes.dart/app_text.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/string_manager.dart';

class LoginPage extends GetView<LoginController> {
  final bool fromSettingPage;
  const LoginPage({Key? key, this.fromSettingPage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginFrameWidget(
      isLogin: true,
      title: AppStrings.signIn,
      subtitle: AppStrings.signInSubtitle,
      // fromSetting: fromSettingPage,
      children: [
        // const SizedBox(
        //   height: 50,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p36),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryPicker(
                fromSetting: fromSettingPage,
              ),
              WidgetUtil.spaceHorizontal(AppSize.s10),
              Expanded(
                child: Form(
                  key: controller.loginForm,
                  child: TextFormField(
                    focusNode: controller.loginFoucsNode,
                    onEditingComplete: controller.login,
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) => _?.isEmpty == true
                        ? "Requried"
                        : int.tryParse(_!) == null
                            ? "Num Only"
                            : null,
                    cursorColor: Colors.red,
                    decoration: TextFieldBoxThemes.inputDecoration,
                  ),
                ),
              ),
            ],
          ),
        ),

        ElevatedButton(
            style: elevatedButtonStyle(),
            onPressed: () async {
              // await controller.verify();
              await controller.login();
            },
            child: Obx(
              () => controller.loginLoading
                  ? const CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Colors.white,
                    )
                  : const Text(
                      "Login",
                      // "အကောင့်ဝင်မည်",
                      style: AppTextTheme.textInBtn,
                    ),
            )),

        const LoginOrWiget(),

        ElevatedButton(
          style: elevatedButtonStyle(),
          onPressed: () {
            Get.offNamedUntil(Routes.layout, (route) => false);
          },
          child: const Text(
            "Continue as Guest",
            style: AppTextTheme.textInBtn,
          ),
        ),
      ],
    );
  }
}
