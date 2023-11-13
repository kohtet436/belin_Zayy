import 'dart:async';
import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/data/model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../utilites/utils.dart';

class OrderController extends GetxController {
  final RxList<OrderModel> _neworders = <OrderModel>[].obs;
  get neworders => _neworders;
  set neworders(val) => _neworders.value = val;
  // List<OrderModel> get orders => _orders;
  final RxMap<String, OrderModel> _orders = <String, OrderModel>{}.obs;
  Map<String, OrderModel> get orders => _orders;
// set getCartItems(val)  =>_cartItems.value=val;
// RxList _cartItemsList=[].obs;
  get ordersList => orders.values.toList().reversed.toList();
  AppController appController = Get.find<AppController>();
  @override
  void onInit() {
    // quantityTextController.text = '1';
    print("do orderController");
    fetchOrders();
    print("call cartController");
    print("order=> $_orders");
    print("neworders=>$neworders");
    super.onInit();
  }

  final userCollection =
      FirebaseFirestore.instance.collection(Utils.userCollection);

  Future<void> fetchOrders() async {
    print("fetch Order do");
    final User? user = appController.loginUser;
    if (user == null) return;

    final DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();

    print("user doc=>${userDoc.id}");
    // if (userDoc == null) {
    //   return;
    // }
    print("userdocData${userDoc.data()}");
    final leng = userDoc.get('orders').length;
    print("length=>$leng");

    for (int i = 0; i < leng; i++) {
      print("dataType=>${userDoc.get('orders')[i]['price'].runtimeType}");
      _neworders.add(OrderModel(
        title: userDoc.get('orders')[i]['title'].toString(),
        price: userDoc.get('orders')[i]['price'].toString(),
        imageUrl: userDoc.get('orders')[i]['imageUrl'].toString(),
        quantity: userDoc.get('orders')[i]['quantity'].toString(),
        orderDate: userDoc.get('orders')[i]['orderDate'] as Timestamp,
        // orderId: userDoc.get('orders')[i]('orderId'),
        // productId: userDoc.get('orders')[i]('productId').toString()
      ));
      print("neworder=>$_neworders");
      // await _neworders.insert(
      //   userDoc.get('orders')[i],
      //   OrderModel(
      //     // price: double.parse(userDoc.get('price').toString()),
      //     price: userDoc.get('orders').contains('price')
      //         ? userDoc.get('price')
      //         : 0.0, //String
      //     // amount: doc.data().toString().contains('amount') ? doc.get('amount') : 0,//Number
      //     // enable: doc.data().toString().contains('enable') ? doc.get('enable') : false,//Boolean
      //     // orderId: userDoc.get('orderId'),
      //     // // userId: userDoc.get('userId'),
      //     // productId: userDoc.get('productId'),
      //     // userName: userDoc.get('userName'),
      //     // price: double.parse(userDoc.get('price').toString()),
      //     // // imageUrl: userDoc.get('imageUrl'),
      //     // quantity: userDoc.get('quantity').toString(),
      //     // orderDate: userDoc.get('orderDate'),
      //   ),
      // );
    }
    print("all order=>${_neworders}");

    // _wishlistLoading.value = false;
  }
}   

  // Future<void> fetchOrders() async {
  //   await FirebaseFirestore.instance
  //       .collection('orders')
  //       .doc(appController.loginUser?.uid)
  //       .get()
  //       .then((QuerySnapshot ordersSnapshot) {
  //         _orders.clear();

  //         ordersSnapshot.docs.forEach((element) {
  //           _orders.add(
              // OrderModel(
              //   orderId: element.get('orderId'),
              //   // userId: element.get('userId'),
              //   productId: element.get('productId'),
              //   userName: element.get('userName'),
              //   price: element.get('price').toString(),
              //   // imageUrl: element.get('imageUrl'),
              //   quantity: element.get('quantity').toString(),
              //   orderDate: element.get('orderDate'),
              // ),
  //           );
  //           print("orders=>$orders");
  //         });
  //       } as FutureOr Function(DocumentSnapshot<Map<String, dynamic>> value));
  // }

