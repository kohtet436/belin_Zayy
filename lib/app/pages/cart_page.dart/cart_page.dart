import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/order_controller.dart';
import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/empty_page/empty_page.dart';
import 'package:belin_zayy/app/pages/widgets/cart_widget.dart';
import 'package:belin_zayy/app/pages/widgets/check_out_widget.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartPage extends GetView<CartController> {
  CartPage({super.key});
  // OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    // print("cartItemsList=>${controller.cartItemsList}");
    return Obx(() => controller.cartItemsList.isEmpty
        ? const EmptyScreen(
            title: 'Your cart is empty',
            subtitle: 'Add something and make me happy :)',
            buttonText: 'Shop now',
            imagePath: 'images/emptycart.json',
          )
        : Scaffold(
            appBar: AppBar(
                foregroundColor: Colors.white,
                // automaticallyImplyLeading: false,
                // elevation: 0,
                // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text('Cart (${controller.getCartItems.length})'),
                //  TextWidget(
                //   text: 'Cart (${controller.getCartItems.length})',
                //   color: Colors.white,
                //   isTitle: true,
                //   textSize: 22,
                // ),
                actions: [
                  IconButton(
                    onPressed: () {
                      GlobalMethods().warningDialog(
                          title: "Delete",
                          subtitle: "Are you sure to delete all item?",
                          fct: () async {
                            await controller.clearOnlineCart();
                            controller.clearLocalCart();
                            Get.back();
                          });
                      // Get.defaultDialog(
                      //     title: "Are you sure to delete All item",
                      //     actions: [
                      //       ElevatedButton(
                      //           onPressed: () async {
                      // await controller.clearOnlineCart();
                      // controller.clearLocalCart();
                      //             Get.back();
                      //           },
                      //           child: const Text("ok"))
                      //     ]);
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                    ),
                  ),
                ]),
            body: Padding(
              padding: WidgetUtil.defaultHorizontalPadding(),
              child: Column(
                children: [
                  const CheckOutWidget(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartItemsList.length,
                      itemBuilder: (ctx, index) {
                        return CartWidget(
                            index: index,
                            quantity: controller.cartItemsList[index].quantity,
                            productId:
                                controller.cartItemsList[index].productId,
                            cartId: controller.cartItemsList[index].id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
  }

//   Widget checkout() {
//     Color color = Colors.red;

//     final ProductController productController = Get.find<ProductController>();
//     // double total = 0.0;
//     // controller.getCartItems.forEach((key, value) {
//     //   final getCurrProduct =
//     //       productController.findProdById(value.productId ?? "");
//     // });
//     return SizedBox(
//       width: double.infinity,
//       height: Get.size.height * 0.1,
//       // color: ,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: Row(children: [
//           Material(
//             elevation: 7,
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(10),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(10),
//               onTap: () async {
//                 User? user = Get.find<AppController>().loginUser;
//                 final orderId = const Uuid().v4();

//                 controller.getCartItems.forEach((key, value) async {
//                   try {
//                     final getCurrProduct = productController.findProdById(
//                       value.productId ?? "",
//                     );
//                     print("getCurrentProduct=>$getCurrProduct");
//                     // for (var i = 1; i < 3; i++) {
//                     // print("i=>$i");
//                     await FirebaseFirestore.instance
//                         .collection('testingCollection')
//                         .doc(orderId)
//                         .set({'id': 1});
//                     // }

//                     await FirebaseFirestore.instance
//                         .collection('orders')
//                         .doc(orderId)
//                         .set({
//                       'orderId': orderId,
//                       'userId': user!.uid,
//                       'productId': getCurrProduct.id,
//                       // value.productId,
//                       // 'price': (getCurrProduct.isOnSale
//                       // ? getCurrProduct.salePrice
//                       // : getCurrProduct.price) *
//                       // value.quantity,
//                       // 'totalPrice': total,
//                       'quantity': 1,
//                       // getCurrProduct.quantity,
//                       // value.quantity,
//                       'imageUrl': getCurrProduct.imageUrl,
//                       'userName': user.displayName,
//                       'orderDate': Timestamp.now(),
//                     });
//                     await controller.clearOnlineCart();
//                     controller.clearLocalCart();
//                     orderController.fetchOrders();
//                     await Fluttertoast.showToast(
//                       msg: "Your order has been placed",
//                       toastLength: Toast.LENGTH_SHORT,
//                       gravity: ToastGravity.CENTER,
//                     );
//                   } catch (error) {
//                     GlobalMethods.errorDialog(
//                       subtitle: error.toString(),
//                     );
//                   } finally {}
//                 });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextWidget(
//                   text: 'Order Now',
//                   textSize: 20,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           const Spacer(),
//           const FittedBox(
//               // child: TextWidget(
//               // text: 'Total: ${total.toStringAsFixed(2)}Ks',
//               // color: color,
//               // textSize: 18,
//               // isTitle: true,
//               // ),
//               ),
//         ]),
//       ),
//     );
//   }
}
