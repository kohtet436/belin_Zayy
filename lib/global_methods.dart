import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class GlobalMethods {
  // static navigateTo({required BuildContext ctx, required String routeName}) {
  //   Navigator.pushNamed(ctx, routeName);
  // }
  AppController appController = Get.find<AppController>();

  Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
  }) async {
    await Get.dialog(AlertDialog(
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
        Text(title),
      ]),
      content: Text(subtitle),
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
            fct();
          },
          child: TextWidget(
            color: Colors.red,
            text: 'OK',
            textSize: 18,
          ),
        ),
      ],
    ));
  }

  static Future<void> errorDialog({
    required String subtitle,
  }) async {
    await Get.dialog(AlertDialog(
      title: Row(children: [
        Image.asset(
          'assets/images/warning-sign.png',
          height: 20,
          width: 20,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text('An Error occured'),
      ]),
      content: Text(subtitle),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: TextWidget(
            color: Colors.cyan,
            text: 'Ok',
            textSize: 18,
          ),
        ),
      ],
    ));
  }

  ///addtocart ///todo
  Future<void> addToWishlist(
      {required String productId, required BuildContext context}) async {
    final User? user = appController.loginUser;
    final _uid = user!.uid;
    final wishlistId = const Uuid().v4();
    try {
      FirebaseFirestore.instance.collection('users').doc(_uid).update({
        'userWish': FieldValue.arrayUnion([
          {
            'wishlistId': wishlistId,
            'productId': productId,
          }
        ])
      });
      await Fluttertoast.showToast(
        msg: "Item has been added to your wishlist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } catch (error) {
      errorDialog(
        subtitle: error.toString(),
      );
    }
  }
}
