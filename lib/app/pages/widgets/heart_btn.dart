import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_methods.dart';
import '../../routes/routes.dart';
import '../wishList_page/wishList_controller.dart';

class HeartBTN extends GetView<WishlistController> {
  HeartBTN({Key? key, required this.productId, this.isInWishlist = false})
      : super(key: key);
  final String productId;
  final bool? isInWishlist;

  // bool wishlistLoading = false;
  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    final ProductController productController = Get.find<ProductController>();
    final currentPro = productController.findProdById(productId);
    return GestureDetector(
        onTap: () async {
          print("tap");
          // setState(() {
          // wishlistLoading = true;
          // });
          try {
            // final User? user = authInstance.currentUser;

            if (appController.loginUser == null) {
              GlobalMethods().warningDialog(
                  title: 'Not Found User',
                  subtitle: ' Please login first',
                  fct: () {
                    Get.toNamed(Routes.loginPage);
                  });
            } else {
              //   GlobalMethod.errorDialog(
              //       subtitle: 'No user found, Please login first',
              //       context: context);
              //   return;
              // }
              if (isInWishlist == false && isInWishlist != null) {
                await controller.addToWishlist(productId: productId);
                // await GlobalMethods.addToWishlist(
                //     productId: widget.productId, context: context);
              } else {
                await controller.removeOneItem(
                    wishlistId: controller.wishlistItems[currentPro.id]!.id,
                    productId: productId);
              }
              await controller.fetchWishlist();
              // setState(() {
              //   loading = false;
              // });
            }
          } catch (error) {
            // GlobalMethods.errorDialog(subtitle: '$error', context: context);
          } finally {
            // setState(() {
            // wishlistLoading = false;
            // });
          }
          // print('user id is ${user.uid}');
          // wishlistProvider.addRemoveProductToWishlist(productId: productId);
        },
        child: GetBuilder<WishlistController>(
          builder: (ctx) => ctx.wishlistLoading == true
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator()),
                )
              : isInWishlist != null && isInWishlist == true
                  ? const Icon(
                      Icons.favorite,
                      color: ColorManager.primaryColor,
                    )
                  : const Icon(
                      Icons.favorite_outline,
                      color: ColorManager.primaryColor,
                    ),
        )

        // color: widget.isInWishlist != null && widget.isInWishlist == true
        // color: Colors.red
        // : Colors.blue,

        );
  }
}
