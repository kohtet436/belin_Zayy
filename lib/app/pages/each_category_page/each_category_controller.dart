import 'dart:async';

import 'package:belin_zayy/app/controllers/product_controller.dart';
import 'package:belin_zayy/app/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EachCategoryController extends GetxController {
  final ProductController productController = Get.find<ProductController>();
  final RxList<ProductModel> searchLists = <ProductModel>[].obs;
  final RxList<ProductModel> _categoryList = <ProductModel>[].obs;
  List<ProductModel> get searchList => searchLists;
  set searchList(val) => searchLists.value = val;
  List<ProductModel> get categoryList => _categoryList;
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();
  // StreamController streamController = StreamController();
  // Stream get stream => streamController.stream;
//Search
  final RxBool _isSearch = false.obs;
  get isSearch => _isSearch.value;
  void search() {
    _isSearch.value = !_isSearch.value;
  }

  @override
  void onInit() {
    // print("oninit do");
    super.onInit();
  }

  List<ProductModel> findByCategory(String catName) {
    print("find do");
    _categoryList.value = productController.productList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(catName.toLowerCase()))
        .toList();
    print("catergory=>$_categoryList");
    print("category length=>${_categoryList.length}");
    // update(['a']);
    return _categoryList;
  }

  List<ProductModel> searchQuery(String searchText) {
    searchLists.value = categoryList
        .where(
          (element) => element.title.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    print("SearchList=>$searchList");
    update(['update']);
    return searchLists;
  }
}
