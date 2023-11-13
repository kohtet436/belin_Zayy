import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/data/model/wishList_model.dart';
import 'package:belin_zayy/app/pages/widgets/heart_btn.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../wishList_page/wishList_controller.dart';

class WishlistWidget extends GetView<WishlistController> {
  final List<WishlistModel> model;
  final int index;
  const WishlistWidget({Key? key, required this.index, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductsProvider>(context);
    final ProductController productController = Get.find<ProductController>();
    // final wishlistModel = Provider.of<WishlistModel>(context);
    // final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrProduct =
        productController.findProdById(model[index].productId);
    // double usedPrice = getCurrProduct.isOnSale
    //     ? getCurrProduct.salePrice
    //     : getCurrProduct.price;
    bool? _isInWishlist =
        controller.wishlistItems.containsKey(getCurrProduct.id);
    Color color = Colors.red;
    // Size size = Utils(context).getScreenSize;
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: 5, horizontal: AppPadding.defaultPadding),
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: Get.size.width * 0.25,
                width: Get.size.width * 0.25,
                child: FancyShimmerImage(
                  imageUrl: getCurrProduct.imageUrl,
                  // getCurrProduct.imageUrl,
                  boxFit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getCurrProduct.title,
                    style: getSemiBoldStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.black),
                  ),
                  // TextWidget(
                  //   text:
                  //       // "getCurrent title",
                  //       getCurrProduct.title,
                  //   color: color,
                  //   textSize: 20.0,
                  //   maxLines: 2,
                  //   isTitle: true,
                  // ),
                  WidgetUtil.spaceVertical(10),
                  Text(
                    '\$${getCurrProduct.salePrice.toStringAsFixed(2)}',
                    style: getRegularStyle(
                        fontSize: FontSize.s14, color: Colors.black87),
                  ),
                  // TextWidget(
                  //   text:
                  //       // "used price",
                  //       '\$${getCurrProduct.salePrice.toStringAsFixed(2)}',
                  //   color: color,
                  //   textSize: 18.0,
                  //   maxLines: 1,
                  //   isTitle: true,
                  // ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.badge_outlined,
                  color: color,
                ),
              ),
              HeartBTN(
                productId: getCurrProduct.id,
                isInWishlist: _isInWishlist,
              )
            ],
          ),
        )
        //  GestureDetector(
        //   onTap: () {
        //     // Navigator.pushNamed(context, ProductDetails.routeName,
        //     //   arguments: wishlistModel.productId);
        //   },
        //   child: Container(
        //     height: Get.size.height * 0.20,
        //     decoration: BoxDecoration(
        //       color: Theme.of(context).cardColor,
        //       border: Border.all(color: color, width: 1),
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //     child: Row(
        //       children: [
        //         Flexible(
        //           flex: 2,
        //           child: Container(
        //             margin: const EdgeInsets.only(left: 8),
        //             // width: size.width * 0.2,
        //             height: Get.size.width * 0.25,
        //             child: FancyShimmerImage(
        //               imageUrl: getCurrProduct.imageUrl,
        //               // getCurrProduct.imageUrl,
        //               boxFit: BoxFit.fill,
        //             ),
        //           ),
        //         ),
        //         Flexible(
        //           flex: 3,
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Flexible(
        //                 child: Row(
        //                   children: [
        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.badge_outlined,
        //     color: color,
        //   ),
        // ),
        // HeartBTN(
        //   productId: getCurrProduct.id,
        //   isInWishlist: _isInWishlist,
        // )
        //                   ],
        //                 ),
        //               ),
        // TextWidget(
        //   text:
        //       // "getCurrent title",
        //       getCurrProduct.title,
        //   color: color,
        //   textSize: 20.0,
        //   maxLines: 2,
        //   isTitle: true,
        // ),
        // const SizedBox(
        //   height: 5,
        // ),
        // TextWidget(
        //   text:
        //       // "used price",
        //       '\$${getCurrProduct.salePrice.toStringAsFixed(2)}',
        //   color: color,
        //   textSize: 18.0,
        //   maxLines: 1,
        //   isTitle: true,
        // ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),

        );
  }
}
