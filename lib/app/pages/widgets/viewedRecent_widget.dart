import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_methods.dart';
import '../../controllers/product_controller.dart';

class ViewedRecentlyWidget extends GetView<CartController> {
  int index;
  ViewedRecentlyWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final productProvider = Provider.of<ProductsProvider>(context);
    ProductController productController = Get.find<ProductController>();
    ViewRecentCotroller viewedProductController =
        Get.find<ViewRecentCotroller>();
    //final viewedProdModel = Provider.of<ViewedProdModel>(context);
    List productId =
        viewedProductController.viewed.entries.map((e) => e.key).toList();
    final getCurrProduct = productController.findProdById(productId[index]);
    double usedPrice = getCurrProduct.isOnSale
        ? getCurrProduct.salePrice
        : getCurrProduct.price;
    // final cartProvider = Provider.of<CartProvider>(context);
    CartController cartController = Get.find<CartController>();
    bool? _isInCart =
        cartController.getCartItems.containsKey(getCurrProduct.id);
    // Color color = Utils(context).color;
    // Size size = Utils(context).getScreenSize;
    return GestureDetector(
      onTap: () {
        // GlobalMethods.navigateTo(
        //     ctx: context, routeName: ProductDetails.routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 5,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FancyShimmerImage(
              imageUrl: getCurrProduct.imageUrl,
              boxFit: BoxFit.contain,
              height: Get.size.width * 0.25,
              width: Get.size.width * 0.25,
            ),
            // const SizedBox(
            //   width: 12,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  getCurrProduct.title,
                  style: getSemiBoldStyle(
                      fontSize: FontSize.defaultFontSize, color: Colors.black),
                ),
                WidgetUtil.spaceVertical(10),
                Text(
                  "\$${usedPrice.toStringAsFixed(2)} Ks",
                  style: getRegularStyle(
                      fontSize: FontSize.s14, color: Colors.black),
                )
                // TextWidget(
                //   text: getCurrProduct.title,
                //   color: ColorManager.primaryColor,
                //   textSize: FontSize.defaultFontSize,
                //   isTitle: true,
                // ),
                // // const SizedBox(
                // //   height: 12,
                // // ),
                // TextWidget(
                //   text: '\$${usedPrice.toStringAsFixed(2)}',
                //   color: ColorManager.primaryColor,
                //   textSize: FontSize.s14,
                //   isTitle: false,
                // ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => Material(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.primaryColor,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: cartController.getCartItems
                              .containsKey(getCurrProduct.id)

                          //  _isInCart
                          ? null
                          : () async {
                              final User? user =
                                  FirebaseAuth.instance.currentUser;

                              if (user == null) {
                                GlobalMethods.errorDialog(
                                  subtitle: 'No user found, Please login first',
                                );
                                return;
                              }
                              await cartController.addToCart(
                                productId: getCurrProduct.id,
                                quantity: 1,
                              );
                              await cartController.fetchCart();
                              // cartProvider.addProductsToCart(
                              //   productId: getCurrProduct.id,
                              //   quantity: 1,
                              // );
                            },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          // _isInCart
                          cartController.getCartItems
                                  .containsKey(getCurrProduct.id)
                              ? Icons.check
                              : Icons.shopping_cart,
                          // _isInCart ? Icons.check : Icons.add,
                          //IconlyBold.plus,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
