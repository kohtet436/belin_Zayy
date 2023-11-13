import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/widgets/heart_btn.dart';
import 'package:belin_zayy/app/pages/widgets/price_widget.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wishList_page/wishList_controller.dart';
import 'text_widget.dart';

class ItemWidget extends GetView<ProductController> {
  final int index;
  final bool isSearch;
  const ItemWidget({super.key, required this.index, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistController = Get.find<WishlistController>();
    CartController cartController = Get.find<CartController>();
    AppController appController = Get.find<AppController>();
    // bool? _isInCart = cartController.getCartItems.containsKey(controller.productList[index].id);

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      elevation: 5,
      // height: 200,
      // width: 200,
      // borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          var arguments = isSearch
              ? controller.searchList[index].id
              : controller.productList[index].id;
          print("id=>${controller.productList[index].id}");
          Get.toNamed(Routes.productDetailPage, arguments: arguments);
        },
        borderRadius: BorderRadius.circular(12),
        child: Obx(
          () => Hero(
            tag: isSearch
                ? controller.searchList[index].id
                : controller.productList[index].id,
            child: Column(children: [
              Expanded(
                child: FancyShimmerImage(
                  shimmerBackColor: Colors.green,
                  imageUrl: isSearch
                      ? controller.searchList[index].imageUrl
                      : controller.productList[index].imageUrl,
                  // "images/logo1.png",
                  //  productModel.imageUrl,
                  // height: Get.width * 0.51,
                  // width: Get.width * 0.4,
                  boxFit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: TextWidget(
                        text: isSearch
                            ? controller.searchList[index].title
                            : controller.productList[index].title.toString(),
                        //  productModel.title,
                        color: ColorManager.primaryColor,
                        maxLines: 1,
                        textSize: FontSize.defaultFontSize,
                        isTitle: true,
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: HeartBTN(
                          productId: isSearch
                              ? controller.searchList[index].id
                              : controller.productList[index].id.toString(),
                          isInWishlist: isSearch
                              ? wishlistController.wishlistItems
                                  .containsKey(controller.searchList[index].id)
                              : wishlistController.wishlistItems.containsKey(
                                  controller.productList[index].id),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child:
                          //  Text(wishlistController.wishlistItems
                          //     .containsKey(controller.productList[index].id)
                          //     .toString())
                          PriceWidget(
                        salePrice: isSearch
                            ? controller.searchList[index].salePrice
                            : controller.productList[index].salePrice,
                        price: isSearch
                            ? controller.searchList[index].price
                            : controller.productList[index].price,
                        // textPrice: _quantityTextController.text,
                        // isOnSale: productModel.isOnSale,
                      ),
                    ),
                    // Flexible(
                    //   child: Row(
                    //     children: [
                    //       Flexible(
                    //         flex: 6,
                    //         child: FittedBox(
                    //           child: TextWidget(
                    //             text:  'Piece' ,
                    //             color: Colors.red,
                    //             textSize: 20,
                    //             isTitle: true,
                    //           ),
                    //         ),
                    //       ),
                    //       // const SizedBox(
                    //       //   width: 5,
                    //       // ),
                    //       // Flexible(
                    //       //     flex: 2,
                    //       //     // TextField can be used also instead of the textFormField
                    //       //     child: TextFormField(
                    //       //       controller: _quantityTextController,
                    //       //       key: const ValueKey('10'),
                    //       //       style: TextStyle(color: color, fontSize: 18),
                    //       //       keyboardType: TextInputType.number,
                    //       //       maxLines: 1,
                    //       //       enabled: true,
                    //       //       onChanged: (valueee) {
                    //       //         setState(() {});
                    //       //       },
                    //       //       inputFormatters: [
                    //       //         FilteringTextInputFormatter.allow(
                    //       //           RegExp('[0-9.]'),
                    //       //         ),
                    //       //       ],
                    //       //     ))
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed:
                        // print("incart=>${cartController.getCartItems.containsKey(controller.productList[index].id)}");
                        cartController.getCartItems.containsKey(isSearch
                                ? controller.searchList[index].id
                                : controller.productList[index].id)
                            ? null
                            : () async {
                                // if (_isInCart) {
                                //   return;
                                // }
                                final User? user = appController.loginUser;
                                print("user=>$user");
                                if (user == null) {
                                  GlobalMethods().warningDialog(
                                      title: 'Not Found User',
                                      subtitle: ' Please login first',
                                      fct: () {
                                        Get.toNamed(Routes.loginPage);
                                        // Get.back();
                                      });

                                  return;
                                }
                                await cartController.addToCart(
                                    productId: isSearch
                                        ? controller.searchList[index].id
                                        : controller.productList[index].id,
                                    quantity: 1
                                    //  int.parse(
                                    //     controller.quantityTextController.text),
                                    );
                                print("once");
                                // await cartController.fetchCart();
                                await cartController.addProductsToCart(
                                    productId: isSearch
                                        ? controller.searchList[index].id
                                        : controller.productList[index].id,
                                    quantity: 1
                                    // int.parse(
                                    //     controller.quantityTextController.text)
                                    );
                              },
                    style: ButtonStyle(
                        backgroundColor:
                            // MaterialStateProperty.all(Theme.of(context).cardColor),
                            MaterialStateProperty.all(
                                const Color.fromARGB(255, 255, 87, 34)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                        )),
                    child: Text(
                      cartController.getCartItems.containsKey(isSearch
                              ? controller.searchList[index].id
                              : controller.productList[index].id)
                          ? 'In Cart'
                          : 'Add to Cart',
                      style: getRegularStyle(
                          fontSize: FontSize.defaultFontSize,
                          color: Colors.white),
                    )
                    // TextWidget(
                    //   text: cartController.getCartItems
                    //           .containsKey(controller.productList[index].id)
                    //       ? 'In cart'
                    //       : 'Add to cart',
                    //   maxLines: 1,
                    //   color: ColorManager.primaryColor,
                    //   textSize: 20,
                    // ),
                    ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
