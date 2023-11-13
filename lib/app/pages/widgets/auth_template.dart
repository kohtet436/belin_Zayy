import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTemplate extends StatelessWidget {
  final bool fromSetting;
  final List<Widget> children;

  const AuthTemplate({
    Key? key,
    required this.children,
    this.fromSetting = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ///Logo
          SizedBox(
            width: context.width,
            height: 200,
            child: Stack(
              children: [
                Container(
                  width: context.width,
                  height:200,
                  margin: const EdgeInsets.all(40),
                  color: Colors.white,
                  child:
                  Image.asset(
                    'images/logo1.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  // color: Colors.red,
                  ),
                ),
                if (fromSetting)
                  Positioned(
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: Get.back,
                      icon: const Icon(Icons.chevron_left),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ...children
        ],
      ),
    );
  }
}

