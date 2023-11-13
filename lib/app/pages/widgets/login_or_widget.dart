import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:flutter/material.dart';
import '../../values/font_manager.dart';
import '../../values/style_manager.dart';

class LoginOrWiget extends StatelessWidget {
  const LoginOrWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
              child: Divider(
            height: AppSize.s4,
            color: Colors.orange,
            thickness: 2,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
            child: Text(
              "OR",
              style: getSemiBoldStyle(
                color: Colors.grey,
                fontSize: FontSize.s20,
              ),
            ),
          ),
          const Expanded(
              child: Divider(
            height: AppSize.s4,
            color: Colors.orange,
            thickness: 2,
          ))
        ],
      ),
    );
  }
}
