import 'package:belin_zayy/app/pages/login_page/login_controller.dart';
import 'package:belin_zayy/app/pages/test_page.dart';
import 'package:belin_zayy/app/pages/widgets/otp_field.dart';
import 'package:belin_zayy/app/pages/widgets/resend_counter.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPage extends GetView<LoginController> {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginFrameWidget(
      title: "Enter the Code",
      subtitle: "We send to your phone and fill the code ",
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p30),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Enter code from your SMS',
              // 'SMS မှ ကုဒ် ၆ လုံးအား ရိုက်ထည့်ပါ',
              style: getRegularStyle(
                  fontSize: FontSize.defaultFontSize, color: Colors.black),
            ),
          ),
        ),
        Row(
          children: List.generate(
            6,
            (index) => Expanded(
              child: RawKeyboardListener(
                onKey: (event) {
                  // event.data;
                  // event.character;
                  print("Event hascode => ${event.character.hashCode}");
                  if (event.character.hashCode == 1) {
                    if (index == 0) return;

                    controller.focusNode[index - 1].requestFocus();
                  }
                },
                focusNode: controller.rawFocusNode[index],
                child: OtpField(
                  controller: controller.verfiyController[index],
                  focusNode: controller.focusNode[index],
                  onEditingComplete: () {
                    if (index == 5) {
                      // controller.verify();
                    }
                  },
                  onChanged: (userFill) {
                    final TextEditingController _current =
                        controller.verfiyController[index];

                    if (_current.text.isEmpty) return;

                    if (_current.text == userFill) {
                      // controller.verfiyController[index].text =

                      //     userFill[userFill.length - 1];
                      print(
                          "controller.verfiyController[index].text=>${controller.verfiyController[index].text}");
                      print(
                          "userFill[userFill.length - 1]=>${userFill[userFill.length - 1]}");
                      if (index == 5) {
                        controller.focusNode[index].unfocus();
                        // controller.verify();
                      } else {
                        controller.focusNode[index + 1].requestFocus();
                      }
                      // try {
                      //   _otpRecord[index] =
                      //       controller.verfiyController[index].text;
                      // } catch (e) {
                      //   _otpRecord
                      //       .add(controller.verfiyController[index].text);
                      // }
                      return;
                    }

                    ///1  => previous
                    ///21 => current
                    // if (_current.text.length > 1) {
                    //   controller.verfiyController[index].clear();

                    //   for (var i = 0; i < userFill.length; i++) {
                    //     if (!_otpRecord.contains(userFill[i])) {
                    //       controller.verfiyController[index].text =
                    //           userFill[i];
                    //     }
                    //   }
                    // }

                    // if (index == controller.focusNode.length) {
                    //   if (index == 5) {
                    //     controller.focusNode[index].unfocus();
                    // controller.verify();
                    // }
                    // return;
                    // }
                    // if (index == 5) {
                    //   // controller.focusNode[index].unfocus();
                    //   // controller.verify();
                    // } else {
                    //   controller.focusNode[index + 1].requestFocus();
                    // }
                    // try {
                    //   _otpRecord[index] =
                    //       controller.verfiyController[index].text;
                    // } catch (e) {
                    //   _otpRecord.add(controller.verfiyController[index].text);
                    // }
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Does not receive code?",
                style:
                    getLightStyle(fontSize: FontSize.s13, color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              const ResendCounter(
                  // fromSetting: fromSetting,
                  ),
            ],
          ),
        ),
        ElevatedButton(
          style: elevatedButtonStyle(),
          onPressed: controller.verify,
          child: Obx(
            () => controller.verifyLoading
                ? const CircularProgressIndicator(
                    strokeWidth: 1,
                    color: Colors.white,
                  )
                : Text(
                    'Confirm',
                    style: getRegularStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.white),
                  ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
            controller.clear();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding.p30),
            child: Align(
              alignment: Alignment.center,
              child: Text("change phone number",
                  style: TextStyle(
                      fontSize: FontSize.s13,
                      color: Colors.blue,
                      decoration: TextDecoration.underline)
                  // getLightStyle(fontSize: FontSize.s13, color: Colors.blue),
                  ),
            ),
          ),
        )
      ],
    );
  }
}
