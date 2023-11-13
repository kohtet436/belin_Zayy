import 'package:get/get.dart';

import '../data/model/viewed_model.dart';

class ViewRecentCotroller extends GetxController {
  final RxMap<String, ViewedModel> _viewed = <String, ViewedModel>{}.obs;

  Map<String, ViewedModel> get viewed => _viewed;
  List<ViewedModel> get viewedProdItemsList =>
      _viewed.values.toList().reversed.toList();
  set viewedProdItemsList(val) => viewedProdItemsList = val;
  void addToHistory({required String productId}) {
    _viewed.putIfAbsent(productId,
        () => ViewedModel(id: DateTime.now().toString(), productId: productId));
  }

  void clearHistroy() {
    viewedProdItemsList.clear();
  }
}
