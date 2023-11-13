import 'package:get/get.dart';

import '../pages/wishList_page/wishList_controller.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}
