import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/order_controller.dart';
import '../empty_page/empty_page.dart';
import '../widgets/order_widget.dart';

class OrdersPage extends GetView<OrderController> {
  static const routeName = '/OrderScreen';

  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("orders=>${controller.ordersList}");
    // final Color color = Utils(context).color;
    // Size size = Utils(context).getScreenSize;
    // final ordersProvider = Provider.of<OrdersProvider>(context);
    //OrderController orderController = Get.find<OrderController>();
    // final ordersList = ordersProvider.getOrders;
    //final ordersList = orderController.orders;
    return Obx(() => controller.neworders.isEmpty
            ? const EmptyScreen(
                title: 'You didnt place any order yet',
                subtitle: 'order something and make me happy :)',
                buttonText: 'Shop now',
                imagePath: 'images/emptycart.json',
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    "",
                    // 'Your orders (${controller.orders.length})',
                    style: getSemiBoldStyle(
                        fontSize: FontSize.defaultFontSize,
                        color: Colors.white),
                    // color: color,
                    // textSize: 24.0,
                    // isTitle: true,
                  ),
                ),
                body: ListView.builder(
                    padding: WidgetUtil.defaultAllPadding(),
                    itemCount: controller.neworders.length,
                    itemBuilder: (ctx, index) {
                      // ordersList[index].productId;
                      // return Column(
                      //   children: [
                      //     Text(controller.neworders[index].price.toString()),
                      //     Text(controller.neworders[index].quantity.toString()),
                      //     Text(
                      //         controller.neworders[index].orderDate.toString()),
                      //     Text(controller.neworders[index].imageUrl.toString()),
                      //     // Text(
                      //     //     controller.neworders[index].productId.toString()),
                      //   ],
                      // );
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 5,
                          child: ListTile(
                              subtitle: Text(
                                  // 'Paid: \$${double.parse(orderModel.price.toString()).toStringAsFixed(2)}'),
                                  'Paid: \$${double.parse(controller.neworders[index].price.toString()).toStringAsFixed(2)}'),
                              onTap: () {
                                // GlobalMethods.navigateTo(
                                // ctx: context, routeName: ProductDetails.routeName);
                              },
                              leading: FancyShimmerImage(
                                width: Get.size.width * 0.2,
                                // imageUrl: getCurrProduct.imageUrl,
                                imageUrl: controller.neworders[index].imageUrl,

                                boxFit: BoxFit.fill,
                              ),
                              title: Text(
                                '${controller.neworders[index].title}  x${controller.neworders[index].quantity}',

                                style: getRegularStyle(
                                    fontSize: FontSize.defaultFontSize,
                                    color: Colors.black),
                                // color: color,
                                // textSize: 18
                              ),
                              trailing: Text(
                                DateFormat.yMMMMEEEEd().format(
                                    // orderDateToShow,
                                    // DateTime.fromMillisecondsSinceEpoch(
                                    //         controller.neworders[index].orderDate.millisecondsSinceEpoch)
                                    //     .toString(),).toString(),
                                    controller.neworders[index].orderDate
                                        .toDate()),
                                style: getRegularStyle(
                                    fontSize: FontSize.s10,
                                    color: Colors.black),
                              )
                              // TextWidget(text: orderDateToShow, color: color, textSize: 18),
                              ),
                        ),
                      );
                      // OrderWidget(
                      //   controller.neworders[index]: controller.neworders[index],
                      // );
                    }))
        //  FutureBuilder(
        //     future: orderController.fetchOrders(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       print("orderList=>${orderController.orders}");
        //       return ordersList.isEmpty
        //           ? const EmptyScreen(
        //               title: 'You didnt place any order yet',
        //               subtitle: 'order something and make me happy :)',
        //               buttonText: 'Shop now',
        //               imagePath: 'images/emptycart.json',
        //             )
        //           : Scaffold(
        //               appBar: AppBar(
        //                 backgroundColor: ColorManager.primaryColor,
        //                 foregroundColor: Colors.white,
        //                 // leading: const BackWidget(),
        //                 leading: IconButton(
        //                     onPressed: () {
        //                       Get.back();
        //                     },
        //                     icon: const Icon(
        //                       Icons.arrow_back,
        //                       color: Colors.white,
        //                     )),
        //                 elevation: 0,
        //                 centerTitle: true,
        // title: Text(
        //   'Your orders (${ordersList.length})',
        //   style: getSemiBoldStyle(
        //       fontSize: FontSize.defaultFontSize,
        //       color: Colors.white),
        //   // color: color,
        //   // textSize: 24.0,
        //   // isTitle: true,
        // ),
        //                 // backgroundColor: Theme.of(context)
        //                 // .scaffoldBackgroundColor
        //                 // .withOpacity(0.9),
        //               ),
        //               body:
        //                   //  Center(
        //                   //   child: Text("hello"),
        //                   // )
        //   ListView.builder(
        // padding: WidgetUtil.defaultAllPadding(),
        // itemCount: ordersList.length,
        // itemBuilder: (ctx, index) {
        //   // ordersList[index].productId;
        //   return OrderWidget(
        //     orderModel: ordersList[index],
        //   );

        //                   // ChangeNotifierProvider.value(
        //                   //   value: ordersList[index],
        //                   //   child: const OrderWidget(),
        //                   // ),
        //                   // );
        //                 },
        //                 // separatorBuilder: (BuildContext context, int index) {
        //                 //   return const Divider(
        //                 //     color: ColorManager.primaryColor,
        //                 //     thickness: 1,
        //                 //   );
        //                 // },
        // ));
        // }),
        );
  }
}
