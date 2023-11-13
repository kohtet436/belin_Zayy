import 'dart:async';

import 'package:belin_zayy/app/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  RxList<ProductModel> _searchList = <ProductModel>[].obs;
  // ProductController productController = Get.find<ProductController>();
  // List<ProductModel> searchQueryInTotal(String searchText) {
  //   _searchList.value = productList
  //       .where(
  //         (element) => element.title.toLowerCase().contains(
  //               searchText.toLowerCase(),
  //             ),
  //       )
  //       .toList();
  //   print("searchlist=>${_searchList}");
  //   update(['updateTotal']);
  //   return _searchList;
  // }

  // final RxList<ProductModel> _searchList = <ProductModel>[].obs;
  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  final RxBool _loading = false.obs;
  final RxBool _isSearch = false.obs;
  final RxBool _searchInTotal = false.obs;
  get searchInTotal => _searchInTotal.value;
  void searchInTotalFun() {
    _searchInTotal.value = !_searchInTotal.value;
  }
  // final RxList<ProductModel> _categoryList=<ProductModel>[].obs;

  List<ProductModel> get productList => _productList;
  List<ProductModel> get searchList => _searchList;
  bool get loading => _loading.value;
  get isSearch => _isSearch.value;

  set loading(val) => _loading.value = val;

  ProductModel findProdById(String productId) =>
      _productList.firstWhere((element) => element.id == productId);
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    fetchProducts();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   scrollController.jumpTo(PageStorage.of(context as BuildContext)
    //           .readState(context as BuildContext) ??
    //       0.0);
    // });
    super.onInit();
  }

  Future<QuerySnapshot<Map<String, dynamic>>?> fetchProducts() async {
    _loading.value = false;
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> productSnapshot) {
      if (productSnapshot.docs.isEmpty) {
        return _productList.clear();
      }
      _productList.value = productSnapshot.docs
          .map((e) => ProductModel.fromJson(doc: e.id, json: e.data()))
          .toList();
      // _productsList = [];
      // _productsList.clear();
      // productSnapshot.docs.forEach((element) {
      // _productList.insert(
      //     0,
      //     ProductModel(
      //       id: element.get('id'),
      //       title: element.get('title'),
      //       imageUrl: element.get('imageUrl'),
      //       productCategoryName: element.get('productCategoryName'),
      //       price: double.parse(
      //         element.get('price'),
      //       ),
      //       salePrice: element.get('salePrice'),
      //       isOnSale: element.get('isOnSale'),
      //       isPiece: element.get('isPiece'),
      //     ));
    });
    print("productlist=>${productList}");
    _loading.value = true;
    print("loading=> ${_loading.value}");
    return null;
  }

  void search() {
    _isSearch.value = !_isSearch.value;
  }

  List<ProductModel> searchQueryInTotal(String searchText) {
    _searchList.value = productList
        .where(
          (element) => element.title.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    _searchList.forEach((element) {
      element.title;
      print("all=>${element.title}");
    });
    print("searchlist=>${_searchList.value.length}");
    update(['updateTotal']);
    return _searchList;
  }
}
