import 'dart:io';

import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/controllers/profile_controller.dart';
import 'package:belin_zayy/app/controllers/theme_controller.dart';
import 'package:belin_zayy/app/controllers/viewedProduct_controller.dart';
import 'package:belin_zayy/app/pages/widgets/loading_manager.dart';
import 'package:belin_zayy/app/pages/widgets/profile_listTile.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/pages/wishList_page/wishList_controller.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/utilites/widget_utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:belin_zayy/app/values/value_manager.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends GetView<AppController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ThemeController themeController = Get.find<ThemeController>();
    ProfileController profileController = Get.find<ProfileController>();
    AppController appController = Get.find<AppController>();
    // ViewRecentCotroller viewRecentCotroller = Get.find<ViewRecentCotroller>();
    print("photo=>${appController.loginUser?.photoURL.toString() ?? ""}");
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: WidgetUtil.defaultAllPadding(),
                  child: Obx(
                    () => Stack(children: [
                      CircleAvatar(
                        foregroundImage: CachedNetworkImageProvider(appController
                                .loginUser?.photoURL
                                .toString() ??
                            "https://cdn-icons-png.flaticon.com/128/149/149071.png"),

                        // CachedNetworkImageProvider(url)
                        // Text("hjey"),
                        // CachedNetworkImage(
                        //     width: 100,
                        //     height: 100,

                        //     fit: BoxFit.fill,
                        //     imageUrl:
                        //         //  CachedNetworkImageProvider(
                        //         appController.loginUser?.photoURL
                        //                 .toString() ??
                        //             "https://cdn-icons-png.flaticon.com/128/149/149071.png"),

                        // FileImage(File(
                        //     // appController.loginUser?.photoURL.toString() ?? ""
                        //     'https://firebasestorage.googleapis.com/v0/b/bilin-zayy-c6d36.appspot.com/o/profile%2F9zXnIeh83mXOhKy4nwVAuzw3Dnj2?alt=media&token=12a946b4-583c-460a-bc9a-e6bec64398ac'

                        //     // profileController
                        //     // .selectedImagePath.value
                        //     // .toString()
                        //     )),
                        // NetworkImage(
                        //     "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                        radius: 65,
                        // backgroundColor: ColorManager.primaryColor,
                      ),
                      Positioned(
                        // left: 50,
                        // bottom: 40,
                        child: profileController.gettingImage == true
                            ? Center(
                                child: CircularProgressIndicator(
                                    strokeWidth: 1, color: Colors.white))
                            : SizedBox(),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {
                              Get.dialog(AlertDialog(
                                title: const Text("Choose"),
                                content: const Text("Camera or Gallery"),
                                actions: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  ColorManager.primaryColor)),
                                      onPressed: () {
                                        // profileController
                                        // .selectedImagePath.value = '';
                                        profileController.getImage(
                                            ImageSource.camera,
                                            appController.loginUser);
                                        Get.back();
                                      },
                                      child: Text(
                                        "camera",
                                        style: getRegularStyle(
                                            fontSize: FontSize.defaultFontSize,
                                            color: Colors.white),
                                      )),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  ColorManager.primaryColor)),
                                      onPressed: () {
                                        // profileController
                                        // .selectedImagePath.value = '';

                                        profileController.getImage(
                                            ImageSource.gallery,
                                            appController.loginUser);
                                        Get.back();
                                      },
                                      child: Text(
                                        "gallery",
                                        style: getRegularStyle(
                                            fontSize: FontSize.defaultFontSize,
                                            color: Colors.white),
                                      ))
                                ],
                              ));
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black38,
                              size: AppSize.s28,
                            )),
                      )
                    ]),
                  ),
                ),
                Card(
                  elevation: 6,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => ProfileListTile(
                            title: 'Name',
                            subtitle: controller.loginUser?.displayName ?? "",
                            icon: Icons.person,
                            onPressed: () async {
                              // await _showAddressDialog();
                              await _showNameDialog();
                            },
                          ),
                        ),
                        Obx(
                          () => ProfileListTile(
                            title: 'Address',
                            subtitle: controller.address ?? "address",
                            icon: Icons.home,
                            onPressed: () async {
                              await _showAddressDialog();
                            },
                          ),
                        ),
                        ProfileListTile(
                          title: 'Phone',
                          subtitle:
                              controller.loginUser?.phoneNumber ?? "Empty",
                          icon: Icons.phone,
                          onPressed: () async {
                            // await _showAddressDialog(context);
                          },
                        ),
                        ProfileListTile(
                          title: 'Orders',
                          icon: Icons.badge,
                          onPressed: () {
                            Get.toNamed(Routes.orderPage);
                            // GlobalMethods.navigateTo(
                            //     ctx: context, routeName: OrdersScreen.routeName);
                          },
                        ),
                        // GestureDetector(
                        //   onTap: () async {
                        //     // getIt<LayoutBinding>().dependencies();
                        //     //Get.find<WishlistController>();
                        //     await Get.toNamed(Routes.wishListPage);
                        //     // Get.toNamed(Routes.testPage);
                        //   },
                        //   child: const ListTile(
                        //     title: Text("WishList"),
                        //     leading: Icon(Icons.favorite),
                        //   ),
                        // ),
                        ProfileListTile(
                          title: 'Wishlist',
                          icon: Icons.favorite,
                          onPressed: () {
                            Get.toNamed(Routes.wishListPage);
                            // GlobalMethods.navigateTo(
                            //     ctx: context, routeName: WishlistScreen.routeName);
                          },
                        ),
                        ProfileListTile(
                          title: 'Viewed',
                          icon: Icons.show_chart,
                          onPressed: () {
                            Get.toNamed(Routes.viewRecentPage);
                            // GlobalMethods.navigateTo(
                            //     ctx: context,
                            //     routeName: ViewedRecentlyScreen.routeName);
                          },
                        ),
                        // ProfileListTile(
                        //   title: 'Forget password',
                        //   icon: Icons.lock,
                        //   onPressed: () {
                        //     // Navigator.of(context).push(
                        //     // MaterialPageRoute(
                        //     //   builder: (context) => const ForgetPasswordScreen(),
                        //     // ),
                        //     // );
                        //   },
                        // color: Colors.red,
                        // )
                        ///To Do
                        // Obx(
                        //   () => Card(
                        //     elevation: 9,
                        //     child: SwitchListTile(
                        //       title: TextWidget(
                        //         text: themeController.theme
                        //             ? "Dark Theme"
                        //             : "Light Theme",
                        //         color: Colors.red,
                        //         textSize: 18,
                        //       ),
                        //       secondary: Icon(themeController.theme
                        //           ? Icons.dark_mode_outlined
                        //           : Icons.light_mode_outlined),
                        //       onChanged: (bool value) {
                        //         themeController.theme = value;
                        //         Get.changeTheme(themeController.theme
                        //             ? themeController.darkTheme
                        //             : themeController.lightTheme);
                        //       },
                        //       value: themeController.theme,
                        //     ),
                        //   ),
                        // ),
                        ProfileListTile(
                          title:
                              controller.loginUser == null ? 'Login' : 'Logout',
                          icon: controller.loginUser == null
                              ? Icons.login
                              : Icons.logout,
                          onPressed: () {
                            controller.loginUser == null
                                ? GlobalMethods().warningDialog(
                                    fct: () {
                                      Get.offNamedUntil(
                                          Routes.loginPage, (route) => false);
                                    },
                                    subtitle: 'Do you wanna Sign In?',
                                    title: 'Sign In',
                                  )
                                : GlobalMethods().warningDialog(
                                    fct: () {
                                      controller.logout();
                                      // Get.offNamedUntil(Routes.logout, (route) => false);
                                    },
                                    subtitle: 'Do you wanna Sign Out?',
                                    title: 'Sign out');

                            // if (user == null) {
                            //   Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //       builder: (context) => const LoginScreen(),
                            //     ),
                            //   );
                            //   return;
                            // }
                            // GlobalMethods.warningDialog(
                            //     title: 'Sign out',
                            //     subtitle: 'Do you wanna sign out?',
                            //     fct: () async {
                            //       // await authInstance.signOut();
                            //       // Navigator.of(context).push(
                            //       //   MaterialPageRoute(
                            //       //     builder: (context) => const LoginScreen(),
                            //       //   ),
                            //       // );
                            //     },
                            //     context: context);
                          },
                        ),
                        // listTileAsRow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _showAddressDialog() async {
    controller.addressController.text = controller.address.toString();
    await Get.dialog(AlertDialog(
      title: const Text("Update"),
      content: TextFormField(
        controller: controller.addressController,
        decoration: const InputDecoration(hintText: "Your address"),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              controller.userAddressChange();
              Get.back();
            },
            child: const Text("Update"))
      ],
    ));
    // await showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: const Text('Update'),
    //         content: const TextField(
    //           // onChanged: (value) {
    //           //   print('_addressTextController.text ${_addressTextController.text}');
    //           // },
    //           // controller: _addressTextController,
    //           // maxLines: 5,
    //           decoration: InputDecoration(hintText: "Your address"),
    //         ),
    //         actions: [
    //           TextButton(
    //             onPressed: () async {
    //               // String _uid = user!.uid;
    //               // try {
    //               //   await FirebaseFirestore.instance
    //               //       .collection('users')
    //               //       .doc(_uid)
    //               //       .update({
    //               //     'shipping-address': _addressTextController.text,
    //               //   });

    //               //   Navigator.pop(context);
    //               //   setState(() {
    //               //     address = _addressTextController.text;
    //               //   });
    //               // } catch (err) {
    //               //   GlobalMethods.errorDialog(
    //               //       subtitle: err.toString(), context: context);
    //               // }
    //             },
    //             child: const Text('Update'),
    //           ),
    //         ],
    //       );
    //     });
  }

  Future<void> _showNameDialog() async {
    controller.nameController.text =
        controller.loginUser?.displayName.toString() ?? "";
    // controller.nameController.toString();
    await Get.dialog(AlertDialog(
      title: const Text("Update"),
      content: TextFormField(
        controller: controller.nameController,
        // controller.addressController,
        decoration: const InputDecoration(hintText: "Your Name"),
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              // controller.userAddressChange();
              controller.usernameChange();
              Get.back();
            },
            child: const Text("Update"))
      ],
    ));
  }

  // Widget _listTiles({
  //   required String title,
  //   String? subtitle,
  //   required IconData icon,
  //   required Function onPressed,
  //   required Color color,
  // }) {
  //   return ListTile(
  //     title: TextWidget(
  //       text: title,
  //       color: color,
  //       textSize: 22,
  //       // isTitle: true,
  //     ),
  //     subtitle: TextWidget(
  //       text: subtitle == null ? "" : subtitle,
  //       color: color,
  //       textSize: 18,
  //     ),
  //     leading: Icon(icon),
  //     trailing: Icon(Icons.chevron_right),
  //     onTap: () {
  //       onPressed();
  //     },
  //   );
}

// Scaffold(
//   // backgroundColor: Themes.scaffoldBg,
//   backgroundColor: Colors.white,

//   appBar: AppBar(
//     foregroundColor: Colors.black,
//     leading: IconButton(
//       splashRadius: 20,
//       onPressed: Get.back,
//       icon: const Icon(Icons.chevron_left),
//     ),
//     title: const Text(
//       "Setting",
//       style: TextStyle(),
//     ),
//     elevation: 0,
//     backgroundColor: Colors.white,
//   ),
//   body: ListView(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const UserProfile(
//               widht: 100,
//               height: 100,
//               stoke: 5,
//             ),
//             OutlinedButton(
//               onPressed:(){},
//               //  controller.uploadProfile,
//               child: const Text(
//                 "Upload your profile picture",
//               ),
//             ),
//           ],
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       Obx(
//         () => ProfileTile(
//           title: "Name",
//           value: controller.loginUser?.displayName ?? '',
//           onTap: () {
//             // Get.toNamed(AppRoutes.usernameUpdate);
//           },
//         ),
//       ),
//       Obx(
//         () => ProfileTile(
//           title: "Phone",
//           value: controller.loginUser?.phoneNumber ?? '',
//           onTap: () {
//             // Get.toNamed(AppRoutes.phoneUpdate);
//           },
//         ),
//       ),
//       Obx(
//         () => ProfileTile(
//           title: "Birthday",
//           value:DateTime.now().toString(),
//           //  Utils.dateFormate(controller.birthday ?? DateTime.now()),
//           onTap: () {
//             Get.toNamed(Routes.birthdayUpdatePage);
//           },
//         ),
//       ),
//       Obx(
//         () => ProfileTile(
//           title: "Address",
//           value:'controller.address',
//               // controller.address.isEmpty ? "Not Set" : controller.address,
//           onTap: () {
//             Get.toNamed(Routes.addressUpdatePage);
//           },
//         ),
//       ),
//       const SizedBox(
//         height: 100,
//       ),
//       const SignOut(),
//     ],
//   ),
// );
