import 'dart:developer';

import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/order_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CheckOutWidget extends GetView<CartController> {
  const CheckOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    // OrderController orderController = Get.find<OrderController>();
    // AppController appController = Get.find<AppController>();

    // controller.getCartItems.forEach((key, value) {
    //   final getCurrProduct =
    //       productController.findProdById(value.productId ?? "");

    //   // controller.total=getCurrProduct.price;
    // });

    return SizedBox(
      width: double.infinity,
      height: Get.size.height * 0.1,
      // color: ,
      child: Row(children: [
        Material(
          elevation: 7,
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              User? user = Get.find<AppController>().loginUser;

              print("controller.getCartItem=>${controller.getCartItems}");

              controller.getCartItems.forEach((key, value) async {
                final orderId = const Uuid().v4();

                final getCurrProduct = productController.findProdById(
                  value.productId ?? "",
                );
                try {
                  print("error=>${getCurrProduct}");
                  FirebaseFirestore.instance
                      .collection('orders')
                      .doc(orderId)
                      // .doc(appController.loginUser?.uid)
                      .set({
                    'orderId': orderId,
                    'userId': user!.uid,
                    'productId': value.productId,
                    'price': getCurrProduct.price,
                    // 'price': (getCurrProduct.isOnSale
                    // ? getCurrProduct.salePrice
                    // : getCurrProduct.price) *
                    // value.quantity,
                    // 'totalPrice': controller.total,
                    'quantity': value.quantity,
                    'imageUrl': getCurrProduct.imageUrl,
                    'userName': user.displayName,
                    'orderDate': Timestamp.now(),
                  });
                  await controller.clearOnlineCart();
                  controller.clearLocalCart();
                  await FirebaseFirestore.instance
                      .collection(Utils.userCollection)
                      .doc(user.uid)
                      .update({
                    'orders': FieldValue.arrayUnion([
                      {
                        // 'orderId': orderId,
                        // 'userId': user!.uid,
                        'price': getCurrProduct.price,
                        'title': getCurrProduct.title,
                        // 'price': (getCurrProduct.isOnSale
                        // ? getCurrProduct.salePrice
                        // : getCurrProduct.price) *
                        // value.quantity,
                        // 'totalPrice': controller.total,
                        'quantity': value.quantity,
                        'imageUrl': getCurrProduct.imageUrl,
                        // 'userName': user.displayName,
                        'orderDate': Timestamp.now()
                      },
                    ])
                  });
                  // orderController.fetchOrders();
                  await Fluttertoast.showToast(
                    msg: "Your order has been placed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );
//order testing
                  // await FirebaseFirestore.instance
                  //     .collection(Utils.userCollection)
                  //     .doc(user.uid)
                  //     .update({
                  //   'orders': FieldValue.arrayUnion([
                  //     {
                  //       'orderId': orderId,
                  //       // 'userId': user!.uid,
                  //       'productId': value.productId,
                  //       'price': getCurrProduct.price,
                  //       // 'price': (getCurrProduct.isOnSale
                  //       // ? getCurrProduct.salePrice
                  //       // : getCurrProduct.price) *
                  //       // value.quantity,
                  //       // 'totalPrice': controller.total,
                  //       'quantity': value.quantity,
                  //       'imageUrl': getCurrProduct.imageUrl,
                  //       'userName': user.displayName,
                  //       'orderDate': Timestamp.now()
                  //     },
                  //   ])
                  // });
                  //order testing
                } catch (error) {
                  GlobalMethods.errorDialog(
                    subtitle: error.toString(),
                  );

                  // .doc(appController.loginUser?.uid)
                  // .set({

                  // });
                  //   await controller.clearOnlineCart();
                  //   controller.clearLocalCart();
                  //   orderController.fetchOrders();
                  //   await Fluttertoast.showToast(
                  //     msg: "Your order has been placed",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //   );
                  // } catch (error) {
                  //   GlobalMethods.errorDialog(
                  //     subtitle: error.toString(),
                  //   );
                } finally {}
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: 'Order Now',
                textSize: FontSize.defaultFontSize,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        // FittedBox(
        // child: Obx(()=>
        //  TextWidget(
        // text: 'Total: ${controller.total.toStringAsFixed(2)}Ks',
        // color: Colors.red,
        // textSize: 18,
        // isTitle: true,
        // ),
        // ),
        // ),
      ]),
    );
  }
}
