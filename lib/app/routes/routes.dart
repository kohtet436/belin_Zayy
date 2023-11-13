import 'package:belin_zayy/app/bindings/app_binding.dart';
import 'package:belin_zayy/app/bindings/each_category_binding.dart';
import 'package:belin_zayy/app/bindings/layout_binding.dart';
import 'package:belin_zayy/app/bindings/login_binding.dart';
import 'package:belin_zayy/app/bindings/viewed_product_binding.dart';
import 'package:belin_zayy/app/bindings/wish_list_binding.dart';
import 'package:belin_zayy/app/pages/address_update_page/address_update_page.dart';
import 'package:belin_zayy/app/pages/each_category_page/each_category_page.dart';
import 'package:belin_zayy/app/pages/layout/layout.dart';
import 'package:belin_zayy/app/pages/login_page/login_page.dart';
import 'package:belin_zayy/app/pages/orders_page/orders_page.dart';
import 'package:belin_zayy/app/pages/product_detail_page/product_detail_page.dart';
import 'package:belin_zayy/app/pages/user_info_page/user_info_page.dart';
import 'package:belin_zayy/app/pages/verify_page/verify_page.dart';
import 'package:belin_zayy/app/pages/viewed_recently/viewRecent_page.dart';
import 'package:belin_zayy/app/pages/wrapper_page/wrapper_page.dart';
import 'package:get/get.dart';

import '../bindings/order_binding.dart';
import '../pages/wishList_page/testPage.dart';
import '../pages/wishList_page/wishList_page.dart';

abstract class Routes {
  static const String layout = '/layout';
  static const String loginPage = '/loginPage';
  static const String wrapperPage = '/wrapperPage';
  static const String verifyPage = '/verifyPage';
  static const String addressUpdatePage = '/addressUpdatePage';
  static const String productDetailPage = '/productDetailPage';
  static const String wishListPage = '/wishListPage';
  static const String viewRecentPage = '/viewRecentPage';
  static const String userInfoFilPage = '/userInfoFillPage';
  static const String eachCategoryPage = '/eachCategoryPage';
  static const String orderPage = '/orderPage';
  static const String testPage = '/testPage';

  static List<GetPage> pages = [
    GetPage(name: testPage, page: () => TestPage()),
    GetPage(bindings: [
      LayoutBinding(),
      EachCategoryBinding(),
      // AppBinding()
    ], name: eachCategoryPage, page: () => const EachCategoryPage()),
    GetPage(
        bindings: [WishListBinding(), LayoutBinding(), AppBinding()],
        name: wishListPage,
        page: () => const WishListPage()),
    GetPage(bindings: [
      LayoutBinding(),
      // AppBinding()
      ViewedProductBinding()
    ], name: productDetailPage, page: () => const ProductDetailPage()),
    GetPage(name: addressUpdatePage, page: () => const AddressUpdatePage()),
    GetPage(
        bindings: [LoginBinding(), AppBinding()],
        name: userInfoFilPage,
        page: () => const UserInfoFillPage()),
    GetPage(
        bindings: [AppBinding(), LoginBinding()],
        name: wrapperPage,
        page: () => const WrapperPage()),
    GetPage(
        bindings: [LoginBinding(), AppBinding()],
        name: verifyPage,
        page: () => const VerifyPage()),
    GetPage(
        bindings: [LoginBinding(), AppBinding()],
        name: loginPage,
        page: () => const LoginPage()),
    GetPage(bindings: [
      LayoutBinding(),
      LoginBinding(),
      AppBinding(),
      ViewedProductBinding(),
      OrderBinding(),
      // WishListBinding()
    ], name: layout, page: () => Layout()),
    GetPage(
        bindings: [ViewedProductBinding(), LayoutBinding()],
        name: viewRecentPage,
        page: () => ViewedRecentlyScreen()),
    GetPage(bindings: [
      OrderBinding(),
    ], name: orderPage, page: () => const OrdersPage())
  ];
}
