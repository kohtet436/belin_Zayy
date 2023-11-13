import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
