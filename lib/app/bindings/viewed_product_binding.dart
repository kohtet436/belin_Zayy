import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class ViewedProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewRecentCotroller());
  }
}
