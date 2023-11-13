import 'dart:async';

import 'package:belin_zayy/app/pages/login_page/login_controller.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/style_manager.dart';

class ResendCounter extends StatefulWidget {
  // final bool fromSetting;
  const ResendCounter({
    Key? key,
    // required this.fromSetting,
  }) : super(key: key);

  @override
  State<ResendCounter> createState() => _ResendCounterState();
}

class _ResendCounterState extends State<ResendCounter> {
  late LoginController _controller;

  late Timer _timer;

  int _counter = 60;

  @override
  void initState() {
    super.initState();
    _resendTimer();
    // if (widget.fromSetting) {
    //   _controller = Get.find<LoginController>();
    // } else {
    //   _controller = Get.find<LoginController>();
    // }
  }

  void _resendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), _callBack);
  }

  void _callBack(Timer _) {
    if (_counter == 0) {
      _timer.cancel();
    } else {
      _counter--;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_counter != 0) return;
        _counter = 60;
        _resendTimer();
        // _controller.phoneLogin();
        setState(() {});
      },
      child: Text(_counter == 0 ? "resend" : "$_counter",
          style: getLightStyle(
              color: ColorManager.primaryColor, fontSize: FontSize.s13)),
    );
  }
}
