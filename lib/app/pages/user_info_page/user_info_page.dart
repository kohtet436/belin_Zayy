import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/pages/test_page.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/ui/themes.dart/TextFieldBoxTheme.dart';
import 'package:belin_zayy/app/ui/themes.dart/app_text.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/string_manager.dart';

// class UserInfoFillPage extends GetView<AppController> {
//   const UserInfoFillPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AuthTemplate(
//       children: [
//         Padding(
//           // height: 45,
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Form(
//               child: Column(
//             children: [
//               TextFormField(
//                 controller: controller.nameController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (_) => _?.isEmpty == true ? "required" : null,
//                 onEditingComplete: () {
//                   controller.addressFocusNode.requestFocus();
//                 },
//                 decoration: TextFieldBoxThemes.inputDecoration.copyWith(
//                   hintText: 'Name',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 focusNode: controller.addressFocusNode,
//                 controller: controller.addressController,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 validator: (_) => _?.isEmpty == true ? "required" : null,
//                 // onEditingComplete: () => controller.setBirthday(context),
//                 decoration: TextFieldBoxThemes.inputDecoration.copyWith(
//                   hintText: 'Shipping Address',
//                 ),
//               ),
//             ],
//           )),
//         ),
//         // GestureDetector(
//         //   onTap: () async {
//         //     userInfoController.setBirthday(context);
//         //   },
//         //   child: Container(
//         //     width: double.infinity,
//         //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         //     height: 50,
//         //     padding: const EdgeInsets.only(left: 10),
//         //     alignment: Alignment.centerLeft,
//         //     decoration: BoxDecoration(
//         //       borderRadius: BorderRadius.circular(4),
//         //       border: Border.all(
//         //         color: Colors.red,
//         //       ),
//         //     ),
//         //     child: Text("Birthday")
//         //     ),
//         //   ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           height: 45,
//           margin: const EdgeInsets.symmetric(horizontal: 20),
//           child: ElevatedButton(
//               onPressed: () {
//                 controller.usernameChange();
//                 controller.userAddressChange();
//                 controller.addressController.clear();
//                 controller.nameController.clear();

//                 Get.offNamedUntil(Routes.layout,(route)=>false);
//               },
//               child: const Text("Next", style: AppTextTheme.textInBtn)),
//         ),
//       ],
//     );
//   }
// }
class UserInfoFillPage extends GetView<AppController> {
  const UserInfoFillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginFrameWidget(
      title: AppStrings.userInfoTitle,
      subtitle: AppStrings.userInfoSubtitle,
      children: [
        const SizedBox(
          height: 70,
        ),
        Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.defaultPadding),
              child: TextFormField(
                controller: controller.nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (_) => _?.isEmpty == true ? "required" : null,
                onEditingComplete: () {
                  controller.addressFocusNode.requestFocus();
                },
                decoration: TextFieldBoxThemes.inputDecoration.copyWith(
                    hintText: AppStrings.shipName,
                    hintStyle: getRegularStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
              child:
                  // Container(child: Text("Shipping Address"),)
                  GestureDetector(
                onTap: () {
                  controller.getCurrentPosition();
                },
                child: Obx(
                  () => TextFormField(
                    focusNode: controller.addressFocusNode,
                    controller: controller.addressController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (_) => _?.isEmpty == true ? "required" : null,
                    // onEditingComplete: () => controller.setBirthday(context),
                    decoration: TextFieldBoxThemes.inputDecoration.copyWith(
                        enabled: false,
                        hintText: controller.currentAddress == ""
                            ? AppStrings.shipAddress
                            : controller.currentAddress,
                        hintStyle: getRegularStyle(
                            fontSize: FontSize.defaultFontSize,
                            color: Colors.grey)),
                  ),
                ),
              ),
            ),
          ],
        )),
        // GestureDetector(
        //   onTap: () async {
        //     userInfoController.setBirthday(context);
        //   },
        //   child: Container(
        //     width: double.infinity,
        //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //     height: 50,
        //     padding: const EdgeInsets.only(left: 10),
        //     alignment: Alignment.centerLeft,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(4),
        //       border: Border.all(
        //         color: Colors.red,
        //       ),
        //     ),
        //     child: Text("Birthday")
        //     ),
        //   ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
          child: ElevatedButton(
              style: elevatedButtonStyle(),
              onPressed: () {
                controller.usernameChange();
                controller.userAddressChange();

                Get.offNamedUntil(Routes.layout, (route) => false);
                // controller.addressController.clear();
                // controller.nameController.clear();
              },
              child: Text("Next",
                  style: getRegularStyle(
                      fontSize: FontSize.defaultFontSize,
                      color: Colors.white))),
        ),
      ],
    );
  }
}
