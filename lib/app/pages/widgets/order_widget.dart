// import 'package:belin_zayy/app/controllers/product_controller.dart';
// import 'package:belin_zayy/app/utilites/utils.dart';
// import 'package:belin_zayy/app/utilites/widget_utils.dart';
// import 'package:belin_zayy/app/values/font_manager.dart';
// import 'package:belin_zayy/app/values/style_manager.dart';
// import 'package:belin_zayy/app/values/value_manager.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../../data/model/order_model.dart';

// class OrderWidget extends StatelessWidget {
//   OrderModel orderModel;
//   OrderWidget({Key? key, required this.orderModel}) : super(key: key);

//   // late String orderDateToShow;

//   // @override
//   @override
//   Widget build(BuildContext context) {
//     // OrderModel ordersModel = Get.find<OrderModel>();
//     // final ordersModel = Provider.of<OrderModel>(context);
//     // final Color color = Utils(context).color;
//     // Size size = Utils(context).getScreenSize;
//     // final productProvider = Provider.of<ProductsProvider>(context);
//     // ProductController productController = Get.find<ProductController>();
//     // final getCurrProduct = productController.findProdById(orderModel.productId);
//     return Padding(
//       padding: WidgetUtil.defaultHorizontalPadding(),
//       child: Card(
//         margin: EdgeInsets.zero,
//         elevation: 5,
//         child: ListTile(
//             subtitle: Text(
//                 // 'Paid: \$${double.parse(orderModel.price.toString()).toStringAsFixed(2)}'),
//                 'Paid: \$${double.parse(orderModel.price.toString()).toStringAsFixed(2)}'),
//             onTap: () {
//               // GlobalMethods.navigateTo(
//               // ctx: context, routeName: ProductDetails.routeName);
//             },
//             leading: FancyShimmerImage(
//               width: Get.size.width * 0.2,
//               // imageUrl: getCurrProduct.imageUrl,
//               imageUrl: orderModel.imageUrl,

//               boxFit: BoxFit.fill,
//             ),
//             title: Text(
//               '${orderModel.title}  x${orderModel.quantity}',

//               style: getRegularStyle(
//                   fontSize: FontSize.defaultFontSize, color: Colors.black),
//               // color: color,
//               // textSize: 18
//             ),
//             trailing: Text(
//               DateFormat.yMMMMEEEEd().format(
//                   // orderDateToShow,
//                   // DateTime.fromMillisecondsSinceEpoch(
//                   //         orderModel.orderDate.millisecondsSinceEpoch)
//                   //     .toString(),).toString(),
//                   orderModel.orderDate.toDate()),
//               style:
//                   getRegularStyle(fontSize: FontSize.s10, color: Colors.black),
//             )
//             // TextWidget(text: orderDateToShow, color: color, textSize: 18),
//             ),
//       ),
//     );
//   }
// }
