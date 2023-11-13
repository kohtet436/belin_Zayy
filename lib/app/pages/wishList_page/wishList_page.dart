import 'package:belin_zayy/app/pages/wishList_page/wishList_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../global_methods.dart';
import '../../bindings/wish_list_binding.dart';
import '../empty_page/empty_page.dart';
import '../widgets/text_widget.dart';
import '../widgets/wishList_widget.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    WishlistController controller = Get.find<WishlistController>();
    // WishlistController controller = Get.put(wishlistController);
    // Get.put(() => WishlistController());
    print("wishlistitem=>${controller.wishlistItemsList}");
    return Scaffold(
        // appBar: AppBar(title: Text("Wishlist page")),
        body: Obx(
      () => controller.wishlistItems.isEmpty
          // controller.wishlistItemsList.isEmpty
          ? const EmptyScreen(
              title: 'Your Wishlist Is Empty',
              subtitle: 'Explore more and shortlist some items',
              imagePath: 'images/emptycart.json',
              buttonText: 'Add a wish',
            )
          : Scaffold(
              appBar: AppBar(
                  foregroundColor: Colors.white,
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.chevron_left)),
                  title: Text(
                    'Wishlist (${controller.wishlistItemsList.length})',
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        GlobalMethods().warningDialog(
                            title: 'Delete All wishlist?',
                            subtitle: 'Are you sure?',
                            fct: () async {
                              await controller.clearOnlineWishlist();
                              controller.clearLocalWishlist();
                            });
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ]),
              body: ListView.builder(
                itemCount: controller.wishlistItemsList.length,
                // MasonryGridView.count(
                // itemCount: controller.wishlistItemsList.length,
                // crossAxisCount: 2,
                // mainAxisSpacing: 16,
                // crossAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return WishlistWidget(
                      model: controller.wishlistItemsList, index: index);
                  // ChangeNotifierProvider.value(
                  // value: wishlistItemsList[index],
                  // child: const WishlistWidget());
                },
              )),
    ));
  }
}
