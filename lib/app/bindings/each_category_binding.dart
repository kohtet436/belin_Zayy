import 'package:belin_zayy/app/pages/each_category_page/each_category_controller.dart';
import 'package:get/get.dart';

class  EachCategoryBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => EachCategoryController(),);
  }

}