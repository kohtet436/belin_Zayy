import 'package:belin_zayy/app/controllers/home_controller.dart';
import 'package:belin_zayy/app/controllers/order_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/controllers/profile_controller.dart';
import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/each_category_page/each_category_controller.dart';
import 'package:belin_zayy/app/pages/layout/layout_controller.dart';
import 'package:get/get.dart';

import '../pages/wishList_page/wishList_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LayoutController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => WishlistController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => ViewRecentCotroller());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EachCategoryController());
    // Get.lazyPut(() => HomeController());
  }
}
