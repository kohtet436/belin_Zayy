import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel {
  // orderId,
  //  userId,
  // productId,
  // userName,
  final String imageUrl, quantity, title, price;
  final Timestamp orderDate;

  OrderModel(
      {
      // required this.orderId,
      // required this.userId,
      // required this.productId,
      // required this.userName,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      required this.title,
      required this.orderDate});
}
