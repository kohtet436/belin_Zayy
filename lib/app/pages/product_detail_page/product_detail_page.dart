import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/widgets/heart_btn.dart';
import 'package:belin_zayy/app/pages/widgets/quantity_control_box.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/pages/wishList_page/wishList_controller.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utilites/utils.dart';
import '../../values/value_manager.dart';

class ProductDetailPage extends GetView<ProductController> {
// int? index;
  const ProductDetailPage({
    Key? key,
  }) : super(key: key);

  // final _quantityTextController = TextEditingController(text: '1');

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   _quantityTextController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Size size = Utils(context).getScreenSize;
    Color color = Colors.red;

    // final cartProvider = Provider.of<CartProvider>(context);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    // final productId = ModalRoute.of(context)!.settings.arguments as String;
    // final productProvider = Provider.of<ProductsProvider>(context);
    // final getCurrProduct = productProvider.findProdById(productId);

    // double usedPrice = getCurrProduct.isOnSale
    //     ? getCurrProduct.salePrice
    //     : getCurrProduct.price;
    // double totalPrice = usedPrice * int.parse(_quantityTextController.text);
    // bool? _isInCart = cartProvider.getCartItems.containsKey(getCurrProduct.id);
    CartController cartController = Get.find<CartController>();
    AppController appController = Get.find<AppController>();
    ViewRecentCotroller viewRecentCotroller = Get.find<ViewRecentCotroller>();
    WishlistController wishlistController = Get.find<WishlistController>();
    // bool? _isInWishlist =
    //     wishlistProvider.getWishlistItems.containsKey(getCurrProduct.id);

    // final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    String arguments = Get.arguments.toString();
    print("argument =>$arguments");
    var current = Get.find<ProductController>().findProdById(arguments);
    bool isWishlist = wishlistController.wishlistItems.containsKey(current.id);
    // bool _isInCart=cartController.getCartItems.containsKey(current.id);
    // print("${_isInCart}");
// double totalPrice=current.price * double.parse(controller.quantityTextController.text);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          print("will pop do");
          viewRecentCotroller.addToHistory(
              productId: controller.findProdById(arguments).id);
          print("view=>${viewRecentCotroller.viewedProdItemsList}");
          return true;
        },
        child: Obx(
          () => Scaffold(
            backgroundColor: ColorManager.primaryColor,
            floatingActionButton:
                // GetBuilder<CartController>(
                // builder: (cartController) =>
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: ColorManager.primaryColor,
                        minimumSize: const Size(150, 45),
                        // padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppSize.s10)))),
                    onPressed: cartController.getCartItems
                            .containsKey(controller.findProdById(arguments).id)
                        ? () {}
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
                                productId:
                                    // isSearch
                                    // ? controller.searchList[index].id
                                    // :
                                    controller.findProdById(arguments).id,
                                quantity: 1
                                //  int.parse(
                                //     controller.quantityTextController.text),
                                );
                            print("once");
                            // await cartController.fetchCart();
                            await cartController.addProductsToCart(
                                productId:
                                    // isSearch
                                    // ? controller.searchList[index].id
                                    // :
                                    controller.findProdById(arguments).id,
                                // current.id,
                                quantity: 1
                                // int.parse(
                                //     controller.quantityTextController.text)
                                );
                          },
                    child: Text(
                        cartController.getCartItems.containsKey(
                                // isSearch
                                // ? controller.searchList[index].id
                                // :
                                controller.findProdById(arguments).id)
                            ? 'In Cart'
                            : 'Add to Cart',
                        // "Add To Cart",
                        style: getRegularStyle(
                            color: Colors.white,
                            fontSize: FontSize.defaultFontSize))),
            // ),
            body: Stack(children: [
              Container(
                padding: WidgetUtil.defaultAllPadding(),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorManager.primaryColor,
                    Colors.orange,
                    ColorManager.primaryColor
                  ],
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          viewRecentCotroller.addToHistory(
                              productId: controller.findProdById(arguments).id);
                          print(
                              "view=>${viewRecentCotroller.viewedProdItemsList}");
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Text(
                      current.title.toString(),
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s30, color: Colors.white),
                    ),
                    WidgetUtil.spaceVertical(AppSize.s12),
                    Text(
                      " * 4.5",
                      style: getRegularStyle(
                          fontSize: FontSize.defaultFontSize,
                          color: Colors.white),
                    ),
                    WidgetUtil.spaceVertical(AppSize.s56),
                    Text(
                      "\$${current.price} Ks",
                      style: getRegularStyle(
                          fontSize: FontSize.s22, color: Colors.white),
                    ),
                    WidgetUtil.spaceVertical(AppSize.s56),
                    Text(
                      "Red ",
                      style: getRegularStyle(
                          fontSize: FontSize.defaultFontSize,
                          color: Colors.white),
                    ),
                    Text(
                      "Size 12 cm",
                      style: getRegularStyle(
                          fontSize: FontSize.defaultFontSize,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 350,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: AppPadding.defaultPadding,
                        right: AppPadding.defaultPadding,
                        top: AppPadding.p24),
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppRadius.defaultCardRadius),
                          topRight: Radius.circular(AppPadding.defaultPadding)),
                    ),
                    child: Flex(direction: Axis.vertical, children: [
                      Expanded(
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: getSemiBoldStyle(
                                  fontSize: FontSize.s20, color: Colors.black),
                            ),
                            WidgetUtil.spaceVertical(AppSize.s10),
                            Text(
                              "change languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apichange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apichange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /api",
                              style: getLightStyle(
                                  fontSize: FontSize.s16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ]),
                  )),
              Positioned(
                  top: 330,
                  left: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: HeartBTN(
                      productId: current.id,
                      isInWishlist: wishlistController.wishlistItems
                          .containsKey(current.id),
                    ),
                  )),
              // Positioned(
              //   top: 200,
              // child: Hero(
              //   tag: current.id,
              //   child: FancyShimmerImage(
              //     imageUrl: current.imageUrl,
              //     // "current product imageurl",
              //     //  getCurrProduct.imageUrl,
              //     boxFit: BoxFit.scaleDown,
              //     width: double.infinity,
              //     // height: screenHeight * .4,
              //   ),
              // ),
              // )
              Positioned(
                right: 0,
                top: 160,
                child: Hero(
                  tag: current.id,
                  child: FancyShimmerImage(
                      imageUrl: current.imageUrl,
                      boxFit: BoxFit.contain,
                      // boxFit: BoxFit.contain,
                      // "current product imageurl",
                      //  getCurrProduct.imageUrl,
                      // /  boxFit: BoxFit.scaleDown,
                      width: 200,
                      height: 300),
                ),
              )
            ]),

            // appBar: AppBar(
            //     leading: InkWell(
            //       borderRadius: BorderRadius.circular(12),
            //       onTap: () => Get.back(),
            //       child: const Icon(
            //         Icons.arrow_back,
            //         color: Colors.red,
            //         size: 24,
            //       ),
            //     ),
            //     elevation: 0,
            //     backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            // body: ListView(children: [
            // Hero(
            //   tag: current.id,
            //   child: FancyShimmerImage(
            //     imageUrl: current.imageUrl,
            //     // "current product imageurl",
            //     //  getCurrProduct.imageUrl,
            //     boxFit: BoxFit.scaleDown,
            //     width: double.infinity,
            //     // height: screenHeight * .4,
            //   ),
            //   ),
            //   Container(
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).cardColor,
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(40),
            //         topRight: Radius.circular(40),
            //       ),
            //     ),
            //     child: Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding:
            //                 const EdgeInsets.only(top: 20, left: 30, right: 30),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Flexible(
            //                     child: Text(
            //                   current.title.toString(),
            //                   style: getSemiBoldStyle(
            //                       fontSize: FontSize.defaultFontSize,
            //                       color: ColorManager.primaryColor),
            //                 )
            //                     // TextWidget(
            //                     //   text: current.title,
            //                     //   // getCurrProduct.title,
            //                     //   color: color,
            //                     //   textSize: FontSize.,
            //                     //   isTitle: true,
            //                     // ),
            //                     ),
            //                 HeartBTN(
            //                     productId: 'get current product id',
            //                     // getCurrProduct.id,
            //                     isInWishlist: false
            //                     //  _isInWishlist,
            //                     )
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: WidgetUtil.defaultAllPadding(),
            //             child: Text(
            //               'change languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apichange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apichange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apchange languagesetstorage and getstorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /apiorage icchange upper case and other just like RouteApiServices to rmsadd to uri detail /api',
            //               style: getRegularStyle(
            //                   fontSize: FontSize.s16, color: Colors.black87),
            //             ),
            //           ),

            // Padding(
            //   padding:
            //       const EdgeInsets.only(top: 20, left: 30, right: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         current.price.toString(),
            //         style: getRegularStyle(
            //             fontSize: FontSize.s16,
            //             color: ColorManager.primaryColor),
            //       ),
            //       // TextWidget(
            //       //   text: "${current.price.toString()} KS",
            //       //   //  '\$${usedPrice.toStringAsFixed(2)}',
            //       //   color: Colors.green,
            //       //   textSize: 22,
            //       //   isTitle: true,
            //       // ),

            //       //   text:"piece",
            //       //   // getCurrProduct.isPiece ? '/Piece' : '/Kg',
            //       //   color: color,
            //       //   textSize: 12,
            //       //   isTitle: false,
            //       // ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Visibility(
            //         visible: false,
            //         // getCurrProduct.isOnSale ? true : false,
            //         child: Text(
            //           current.price.toString(),
            //           // '\$${getCurrProduct.price.toStringAsFixed(2)}',
            //           style: TextStyle(
            //               fontSize: 15,
            //               color: color,
            //               decoration: TextDecoration.lineThrough),
            //         ),
            //       ),
            //       // const Spacer(),

            //       QuantityControlBox(
            //         color: Colors.red,
            //         onTap: () {
            //           if (cartController.quantityTextController.text ==
            //               '1') {
            //             return;
            //           } else {
            //             // cartController.decrease();
            //           }
            //           //  (int.parse(_quantityTextController.text) + 1)
            //           // .toString();
            //           print(
            //               "+=>${cartController.quantityTextController.text}");
            //         },
            //         icon: Icons.remove,
            //       ),
            //       // QuantityControlBox(
            //       //   onTap: () {
            //       // if (controller.quantityTextController.text ==
            //       //     '1') {
            //       //   return;
            //       // } else {
            //       //       controller.quantityTextController.text =
            //       //           (int.parse(controller
            //       //                       .quantityTextController.text) -
            //       //                   1)
            //       //               .toString();

            //       //       //   _quantityTextController.text =
            //       //       // (int.parse(controller.quantityTextController.text) - 1)
            //       //       //     .toString();
            //       //       // });
            //       //     }
            //       //   },
            //       //   icon: Icons.remove,
            //       //   color: Colors.red,
            //       // ),
            //       const SizedBox(
            //         width: 5,
            //       ),
            //       Flexible(
            //         flex: 1,
            //         child: TextField(
            //           controller: cartController.quantityTextController,
            //           key: const ValueKey('quantity'),
            //           keyboardType: TextInputType.number,
            //           maxLines: 1,
            //           decoration: const InputDecoration(
            //             border: UnderlineInputBorder(),
            //           ),
            //           textAlign: TextAlign.center,
            //           cursorColor: Colors.green,
            //           enabled: true,
            //           inputFormatters: [
            //             FilteringTextInputFormatter.allow(
            //                 RegExp('[0-9]')),
            //           ],
            //           onChanged: (value) {
            //             if (value.isEmpty) {
            //               cartController.quantityTextController.text =
            //                   '1';
            //             } else {}
            //           },
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 5,
            //       ),

            //       QuantityControlBox(
            //         color: ColorManager.primaryColor,
            //         onTap: () {
            //           cartController.increase();
            //           //  (int.parse(_quantityTextController.text) + 1)
            //           // .toString();
            //           print(
            //               "+=>${cartController.quantityTextController.text}");
            //         },
            //         icon: Icons.add,
            //       ),

            //       // quantityControl(
            //       //   fct: () {
            //       // setState(() {
            //       //   _quantityTextController.text =
            //       //       (int.parse(_quantityTextController.text) + 1)
            //       //           .toString();
            //       // });
            //       // },
            //       //   icon: Icons.add,
            //       //   color: Colors.green,
            //       // ),
            //       // Container(
            //       //   padding: const EdgeInsets.symmetric(
            //       //       vertical: 4, horizontal: 8),
            //       //   decoration: BoxDecoration(
            //       //       color: const Color.fromRGBO(63, 200, 101, 1),
            //       //       borderRadius: BorderRadius.circular(5)),
            //       //   child: TextWidget(
            //       //     text: 'Free delivery',
            //       //     color: Colors.white,
            //       //     textSize: 20,
            //       //     isTitle: true,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

            // const SizedBox(
            //   height: 30,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     quantityControl(
            //       fct: () {
            //         if (_quantityTextController.text == '1') {
            //           return;
            //         } else {
            //           setState(() {
            //             _quantityTextController.text =
            //                 (int.parse(_quantityTextController.text) - 1)
            //                     .toString();
            //           });
            //         }
            //       },
            //       icon:Icons.remove,
            //       color: Colors.red,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Flexible(
            //       flex: 1,
            //       child: TextField(
            //         controller: _quantityTextController,
            //         key: const ValueKey('quantity'),
            //         keyboardType: TextInputType.number,
            //         maxLines: 1,
            //         decoration: const InputDecoration(
            //           border: UnderlineInputBorder(),
            //         ),
            //         textAlign: TextAlign.center,
            //         cursorColor: Colors.green,
            //         enabled: true,
            //         inputFormatters: [
            //           FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            //         ],
            //         onChanged: (value) {
            //           setState(() {
            //             if (value.isEmpty) {
            //               _quantityTextController.text = '1';
            //             } else {}
            //           });
            //         },
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     quantityControl(
            //       fct: () {
            //         setState(() {
            //           _quantityTextController.text =
            //               (int.parse(_quantityTextController.text) + 1)
            //                   .toString();
            //         });
            //       },
            //       icon: Icons.add,
            //       color: Colors.green,
            //     ),
            //   ],
            // ),
            // const Spacer(),
            // Container(
            //   width: double.infinity,
            //   padding:
            //       const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).colorScheme.secondary,
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(20),
            //       topRight: Radius.circular(20),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Flexible(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Total",
            //               style: getRegularStyle(
            //                   fontSize: FontSize.defaultFontSize,
            //                   color: Colors.white),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             GetBuilder<CartController>(
            //               id: 'ok',
            //               builder: (GetxController controller) => FittedBox(
            //                 child: Row(
            //                   children: [
            //                     TextWidget(
            //                       text: (current.price *
            //                               double.parse(cartController
            //                                   .quantityTextController.text))
            //                           .toStringAsFixed(2),
            //                       // '\$${totalPrice.toStringAsFixed(2)}/',
            //                       color: Colors.white,
            //                       textSize: 20,
            //                       isTitle: true,
            //                     ),
            //                     TextWidget(
            //                       text:
            //                           '/${cartController.quantityTextController.text}Kg',
            //                       color: Colors.yellow,
            //                       textSize: 16,
            //                       isTitle: false,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 8,
            //       ),
            //       Flexible(
            //         child: Material(
            //           color: Colors.green,
            //           borderRadius: BorderRadius.circular(10),
            //           child: InkWell(
            //               onTap:
            //                   // print("start");
            //                   // print("current id =>$current");
            //                   //  _isInCart
            //                   cartController.getCartItems
            //                           .containsKey(current.id)
            //                       ? null
            //                       : () async {
            //                           // if (_isInCart) {
            //                           //   return;
            //                           // }
            //                           final User? user =
            //                               appController.loginUser;

            //                           if (user == null) {
            //                             GlobalMethods.errorDialog(
            //                               subtitle:
            //                                   'No user found, Please login first',
            //                             );
            //                             return;
            //                           }
            //                           print("user ok");
            //                           await cartController.addToCart(
            //                             productId: current.id,
            //                             quantity: int.parse(cartController
            //                                 .quantityTextController.text),
            //                           );
            //                           print("done add to cart");
            //                           await cartController.fetchCart();
            //                           cartController.addProductsToCart(
            //                               productId: current.id,
            //                               quantity: int.parse(cartController
            //                                   .quantityTextController
            //                                   .text));
            //                           print("end");
            //                         },
            //               borderRadius: BorderRadius.circular(10),
            //               child: Obx(
            //                 () => Padding(
            //                   padding: const EdgeInsets.all(12.0),
            //                   child: TextWidget(
            //                       text: cartController.getCartItems
            //                               .containsKey(current.id)
            //                           ? 'In cart'
            //                           : 'Add to cart',
            //                       color: Colors.white,
            //                       textSize: 18),
            //                 ),
            //               )),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //         ],
            //       ),
            //     ),
            //   )
            // ]),
          ),
        ),
      ),
    );
  }
}
