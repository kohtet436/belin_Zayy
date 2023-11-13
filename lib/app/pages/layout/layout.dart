import 'dart:async';

import 'package:badges/badges.dart';
import 'package:belin_zayy/app/bindings/layout_binding.dart';
import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_controller.dart';
import 'package:belin_zayy/app/pages/cart_page.dart/cart_page.dart';
import 'package:belin_zayy/app/pages/categories_page/categories_page.dart';
import 'package:belin_zayy/app/pages/empty_page/empty_page.dart';
import 'package:belin_zayy/app/pages/home_page/home_page.dart';
import 'package:belin_zayy/app/pages/layout/layout_controller.dart';
import 'package:belin_zayy/app/pages/profile_page/profile_page.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
// import 'package:belin_zayy/app/pages/wishList_page/wishList_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import '../../utilites/utils.dart';

// List<Widget> pages = [
//   HomePage(),
//   CategoriesPage(),
//   CartPage(),
//   const ProfilePage(),
//   WishListPage()
// ];
class Layout extends GetView<LayoutController> {
  Layout({Key? key}) : super(key: key);
  CartController cartController = Get.find<CartController>();
  AppController appController = Get.find<AppController>();
  ViewRecentCotroller viewRecentCotroller = Get.find<ViewRecentCotroller>();
  Stream<String> get stream => _streamController.stream;
  final StreamController<String> _streamController = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final pop = Get.dialog<bool>(AlertDialog(
          title: Row(children: [
            Image.asset(
              'images/warning-sign.png',
              height: 20,
              width: 20,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 8,
            ),
            Text("Exit"),
          ]),
          content: Text("Are you sure to exit?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: TextWidget(
                color: Colors.cyan,
                text: 'Cancel',
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(canPop: true, result: true);
                viewRecentCotroller.clearHistroy();
              },
              child: TextWidget(
                color: Colors.red,
                text: 'OK',
                textSize: 18,
              ),
            ),
          ],
        )
            //   AlertDialog(
            //   title: const Text("Sure to exit"),
            //   actions: [
            //     ElevatedButton(
            //         onPressed: () {
            // Get.back(canPop: true, result: true);
            // viewRecentCotroller.clearHistroy();
            //         },
            //         child: const Text("Yes")),
            //     ElevatedButton(
            //         onPressed: () {
            //           Get.back();
            //         },
            //         child: const Text("No"))
            //   ],
            // )
            ).then((value) => value ?? false);

        print("pop=>${pop.runtimeType}");
        return pop;
      },
      child: SafeArea(
        child: Scaffold(
            body: StreamBuilder(
                stream: appController.stream,
                builder: (context, snapshot) {
                  print("snack data =>${snapshot.data}");
                  return Stack(children: [
                    Obx(
                      () => controller.connectionType.value == 0
                          ? const EmptyScreen(
                              imagePath: 'images/nointernet.json',
                              title: "No Internet Connetion",
                              subtitle: "Please your internet connection",
                              buttonText: "Retry")
                          : pages(controller.index),
                    ),
                    // Container(color: Colors.amber,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
                    Positioned(
                        // top: 0,
                        child: snapshot.data == true
                            ?
                            //  AlertDialog(title: Text("you are offline"),)
                            Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: Get.size.width,
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      ),
                                      Text("you are offline")
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox())
                  ]);
                }),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                  elevation: 20,
                  currentIndex: controller.index,
                  onTap: controller.changeIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_outlined,
                        ),
                        label: "Home"),
                    const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.category_outlined,
                        ),
                        label: "Categories"),
                    BottomNavigationBarItem(
                        icon: badges.Badge(
                          badgeAnimation:
                              //  BadgeAnimation.fade(),
                              const badges.BadgeAnimation.rotation(
                            animationDuration: Duration(seconds: 2),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: true,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.easeInCubic,
                          ),
                          badgeStyle: badges.BadgeStyle(
                            shape: BadgeShape.circle,
                            badgeColor: ColorManager.primaryColor,
                            padding: const EdgeInsets.all(5),
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                          ),
                          position: BadgePosition.topEnd(top: -7, end: -7),
                          badgeContent: FittedBox(
                              child: TextWidget(
                                  text: cartController.getCartItems.length
                                      .toString(),
                                  color: Colors.white,
                                  textSize: 15)),
                          child: const Icon(Icons.shopping_cart_outlined),
                        ),
                        label: "Cart"),
                    const BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person_outlined,
                        ),
                        label: "Profile"),
                    // const BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.favorite,
                    //     ),
                    //     label: "WishList"),
                  ]),
            )),
      ),
    );
  }
}

Widget pages(int pageIndex) {
  switch (pageIndex) {
    case 0:
      LayoutBinding().dependencies();
      return HomePage();
    case 1:
      LayoutBinding().dependencies();
      return CategoriesPage();
    case 2:
      LayoutBinding().dependencies();
      return CartPage();
    case 3:
      LayoutBinding().dependencies();
      return ProfilePage();
    default:
      LayoutBinding().dependencies();
      return HomePage();
  }
}
