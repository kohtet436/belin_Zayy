import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/data/model/product_model.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/each_category_page/each_category_controller.dart';
import 'package:belin_zayy/app/pages/widgets/heart_btn.dart';
import 'package:belin_zayy/app/pages/widgets/price_widget.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../wishList_page/wishList_controller.dart';

class CategoryItemsWidget extends GetView<EachCategoryController> {
  final int index;
  final List<ProductModel> model;
  const CategoryItemsWidget(
      {super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistController = Get.find<WishlistController>();
    CartController cartController = Get.find<CartController>();
    AppController appController = Get.find<AppController>();
    // bool? _isInCart = cartController.getCartItems.containsKey(controller.categoryList[index].id);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            var arguments = controller.categoryList[index].id;
            // print("id=>${controller.categoryList[index].id}");
            Get.toNamed(Routes.productDetailPage, arguments: arguments);
            // Navigator.pushNamed(context, ProductDetails.routeName,
            //     arguments: productModel.id);
            // GlobalMethods.navigateTo(
            //     ctx: context, routeName: ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Obx(
            () => Column(children: [
              Expanded(
                child: Container(
                  // color: Colors.amber,
                  child: FancyShimmerImage(
                    shimmerBackColor: Colors.green,
                    imageUrl: model[index].imageUrl,
                    // "images/logo1.png",
                    //  productModel.imageUrl,
                    height: Get.width * 0.51,
                    width: Get.width * 0.4,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextWidget(
                          text: model[index].title.toString(),
                          //  productModel.title,
                          color: Colors.red,
                          maxLines: 1,
                          textSize: FontSize.defaultFontSize,
                          isTitle: true,
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: HeartBTN(
                            productId: model[index].id.toString(),
                            isInWishlist: wishlistController.wishlistItems
                                .containsKey(model[index].id),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                child: Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child:
                            // Text("price")
                            PriceWidget(
                          salePrice: model[index].salePrice,
                          price: model[index].price,
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
              ),
              // const Spacer(),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed:
                      // print("incart=>${cartController.getCartItems.containsKey(controller.categoryList[index].id)}");
                      cartController.getCartItems.containsKey(model[index].id)
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
                                      Get.back();
                                    });

                                return;
                              }
                              await cartController.addToCart(
                                productId: model[index].id,
                                quantity: 1,
                                // int.parse(_quantityTextController.text),
                              );
                              print("once");
                              await cartController.fetchCart();
                              // await  cartController.addProductsToCart(
                              //       productId:controller.categoryList[index].id,
                              //       quantity:1);
                              //  int.parse(_quantityTextController.text));
                            },
                  style: ButtonStyle(
                      backgroundColor:
                          // MaterialStateProperty.all(Theme.of(context).cardColor),
                          MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 87, 34)),

                      // MaterialStateProperty.all(Color.fromARGB(255, 36, 209, 27)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                        ),
                      )),
                  child: TextWidget(
                    text:
                        cartController.getCartItems.containsKey(model[index].id)
                            ? 'In cart'
                            : 'Add to cart',
                    maxLines: 1,
                    color: Colors.white,
                    textSize: FontSize.defaultFontSize,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
