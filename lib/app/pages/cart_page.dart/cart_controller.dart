import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/data/model/cart_model.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  AppController appController = Get.find<AppController>();
  // final RxInt _total=0.obs;
  // get total=>_total.value;
  //  set total(value)=>_total.value=value;

  final RxMap<String, CartModel> _cartItems = <String, CartModel>{}.obs;
  Map<String, CartModel> get getCartItems => _cartItems;
// set getCartItems(val)  =>_cartItems.value=val;
// RxList _cartItemsList=[].obs;
  get cartItemsList => getCartItems.values.toList().reversed.toList();
  final Rx<TextEditingController> _quantityTextController =
      TextEditingController(text: '1').obs;
  TextEditingController get quantityTextController =>
      _quantityTextController.value;
  final Rx<TextEditingController> _newquantityTextController =
      TextEditingController().obs;
  TextEditingController get newquantityTextController =>
      _newquantityTextController.value;
  @override
  void onClose() {
    quantityTextController.dispose();
    super.onClose();
  }

  void increase() {
    quantityTextController.text =
        (int.parse(quantityTextController.text) + 1).toString();
    update(['ok']);
  }

  decrease(q) {
    q = q - 1;

    // quantityTextController.text =
    //     (int.parse(quantityTextController.text) - 1).toString();

    // update(['ok']);
  }

  Future<void> addProductsToCart({
    required String productId,
    required int quantity,
  }) async {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        id: DateTime.now().toString(),
        productId: productId,
        quantity: quantity,
      ),
    );
    print("cartItem ${_cartItems}");
  }

  @override
  void onInit() {
    // quantityTextController.text = '1';

    fetchCart();
    print("call cartController");
    super.onInit();
  }

  final userCollection =
      FirebaseFirestore.instance.collection(Utils.userCollection);
  Future<void> fetchCart() async {
    final User? user = appController.loginUser;
    if (user == null) {
      return;
    }

    final DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();
    print("userdoc=>${userDoc.get}");
    // ignore: unnecessary_null_comparison
    if (userDoc == null) {
      return;
    }
    final leng = userDoc.get('userCart').length;
    for (int i = 0; i < leng; i++) {
      _cartItems.putIfAbsent(
          userDoc.get('userCart')[i]['productId'],
          () => CartModel(
                id: userDoc.get('userCart')[i]['cartId'],
                productId: userDoc.get('userCart')[i]['productId'],
                quantity: userDoc.get('userCart')[i]['quantity'],
              ));
//               userCart
// 0
// cartId
// "8383f172-be2e-4ec1-bb32-b20aea1cd291"
// productId
// "084bfbcd-2052-4e3a-9a6a-c05c184dcc8b"
// quantity
// 1
    }
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
  }) async {
    final User? user = appController.loginUser;
    print("User =>$user");
    final _uid = user!.uid;
    final cartId = const Uuid().v4();
    try {
      print("try");
      FirebaseFirestore.instance
          .collection(Utils.userCollection)
          .doc(_uid)
          .update({
        'userCart': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': quantity,
          }
        ])
      });
      await Fluttertoast.showToast(
        msg: "Item has been added to your cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } catch (error) {
      Get.defaultDialog(title: error.toString());
    }
  }

  void reduceQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity,
      ),
    );
  }

  void increaseQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity,
      ),
    );
  }

  Future<void> removeOneItem(
      {required String cartId,
      required String productId,
      required int quantity}) async {
    print("remove fun do");
    final User? user = appController.loginUser;
    await userCollection.doc(user!.uid).update({
      'userCart': FieldValue.arrayRemove([
        {'cartId': cartId, 'productId': productId, 'quantity': quantity}
      ])
    });
    _cartItems.remove(productId);
    await fetchCart();
  }

  Future<void> clearOnlineCart() async {
    final User? user = appController.loginUser;
    await userCollection.doc(user!.uid).update({
      'userCart': [],
    });
    _cartItems.clear();
  }

  Future<void> clearLocalCart() async {
    _cartItems.clear();
    print("Local =>$_cartItems");
  }
}
