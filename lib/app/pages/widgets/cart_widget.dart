import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/widgets/heart_btn.dart';
import 'package:belin_zayy/app/pages/widgets/quantity_control_box.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wishList_page/wishList_controller.dart';

class CartWidget extends StatefulWidget {
  CartWidget(
      {Key? key,
      required this.index,
      required this.productId,
      required this.cartId,
      required this.quantity})
      : super(key: key);
  final String productId;
  final int index;
  int quantity;
  final String cartId;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
//   @override
  final aquantityTextController = TextEditingController();

  CartController controller = Get.find<CartController>();

  // @override
  int builds = 1;

  @override
  Widget build(BuildContext context) {
    print("card widget build=>${builds++}");

    // Color color = Colors.red;

    ProductController productController = Get.find<ProductController>();
    // CartController controller = Get.find<CartController>();

    final getCurrProduct = productController.findProdById(widget.productId);

    double usedPrice = getCurrProduct.price;

    WishlistController wishlistController = Get.find<WishlistController>();
    bool? _isInWishlist =
        wishlistController.wishlistItems.containsKey(getCurrProduct.id);
    return GestureDetector(
      onTap: () {
        // Get.offNamedUntil(Routes.productDetailPage, (route) => false,
        // arguments:getCurrProduct
        // controller.getCartItems.entries.map((e) => e.value.productId)
        // );

        ///todo
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r10)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    // color: Theme.of(context).cardColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: Get.size.width * 0.25,
                        width: Get.size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: FancyShimmerImage(
                          imageUrl: getCurrProduct.imageUrl,
                          boxFit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text:
                                // widget.quantity.toString(),
                                getCurrProduct.title,
                            color: Colors.black,
                            textSize: FontSize.defaultFontSize,
                            isTitle: true,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          SizedBox(
                            width: Get.size.width * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // IconButton(
                                //   onPressed: () {
                                //     // if (controller
                                //     //         .quantityTextController.text ==
                                //     //     '1') {
                                //     //   return;
                                //     // } else {
                                //     // cont.reduceQuantityByOne(controller
                                //     //     .getCartItems.entries
                                //     //     .map((e) => e.value.productId)
                                //     //     .toString());
                                //     // setState(() {
                                //     // cont.exitQ=aquantityTextController.text;
                                //     // cont.decrease(
                                //     //     cont.cartItemsList[index].quantity);

                                //     print(
                                //         "exitQ=>${controller.cartItemsList[widget.index].quantity}");
                                //     // });
                                //     // }
                                //   },
                                //   color: Colors.red,
                                //   icon: const Icon(Icons.remove),
                                // ),

                                // child:
                                QuantityControlBox(
                                    icon: Icons.remove,
                                    color: ColorManager.primaryColor,
                                    onTap: () {
                                      setState(() {
                                        if (controller
                                                .cartItemsList[widget.index]
                                                .quantity ==
                                            1) {
                                          return;
                                        }
                                        controller.cartItemsList[widget.index]
                                            .quantity = controller
                                                .cartItemsList[widget.index]
                                                .quantity -
                                            1;
                                      });
                                    }),

                                Text(controller
                                        .cartItemsList[widget.index]?.quantity
                                        .toString() ??
                                    '0'),

                                // Flexible(
                                //   flex: 1,
                                //   child: TextField(
                                //     controller: quantity,
                                //     keyboardType: TextInputType.number,
                                //     maxLines: 1,
                                //     decoration: const InputDecoration(
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(),
                                //       ),
                                //     ),
                                //     inputFormatters: [
                                //       FilteringTextInputFormatter.allow(
                                //         RegExp('[0-9]'),
                                //       ),
                                //     ],
                                //     onChanged: (v) {
                                //       // setState(() {
                                //       if (v.isEmpty) {
                                //         controller.quantityTextController.text =
                                //             '1';
                                //       } else {
                                //         return;
                                //       }
                                //       // });
                                //     },
                                //   ),
                                // ),
                                QuantityControlBox(
                                  onTap: () {
                                    print("start");
                                    print(
                                        "${controller.cartItemsList[widget.index].quantity}");
                                    setState(() {
                                      controller.cartItemsList[widget.index]
                                          .quantity = controller
                                              .cartItemsList[widget.index]
                                              .quantity +
                                          1;
                                    });

                                    print("end");
                                    // controller.increaseQuantityByOne(
                                    //     widget.productId);
                                    // controller.increase();
                                  },
                                  color: Colors.green,
                                  icon: Icons.add,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                print("one delete do");
                                // print("product id=>${getCurrProduct.id}");
                                // print("card id=>${controller.getCartItems.map((key, value) => key.)}");
                                await controller.removeOneItem(
                                    cartId: widget.cartId,
                                    productId: getCurrProduct.id,
                                    quantity: 1);
                                print("done one delete");
                              },
                              child: const Icon(
                                Icons.delete_outline,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HeartBTN(
                              productId: getCurrProduct.id,
                              isInWishlist: _isInWishlist,
                            ),
                            Row(
                              children: [
                                Wrap(children: [
                                  TextWidget(
                                    text:
                                        // '$usedPrice Ks',
                                        "todo",
                                    // "${getCurrProduct.price}Ks"
                                    // "*"
                                    // "${int.parse(aquantityTextController.text)}",
                                    // int.parse(controller
                                    //         .quantityTextController.text)
                                    //     .toStringAsFixed(2),
                                    color: Colors.black,
                                    textSize: 18,
                                    maxLines: 1,
                                  ),
                                ]),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   Widget _quantityController({
//     required Function fct,
//     required IconData icon,
//     required Color color,
//   }) {
//     return Flexible(
//       flex: 2,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         child: Material(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//           child: InkWell(
//             borderRadius: BorderRadius.circular(12),
//             onTap: () {
//               fct();
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Icon(
//                 icon,
//                 color: Colors.white,
//                 size: 20,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
