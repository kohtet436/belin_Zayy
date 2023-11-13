import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/data/model/wishList_model.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/global_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class WishlistController extends GetxController {
  AppController appController = Get.find<AppController>();
  final RxBool _wishlistLoading = false.obs;
  get wishlistLoading => _wishlistLoading.value;
  set wishlistLoading(val) => _wishlistLoading.value = val;

  // Rx<Map<String, WishlistModel>> _wishlistItems = Map<String,WishlistModel>{}.obs;
  final RxMap<String, WishlistModel> _wishlistItems =
      <String, WishlistModel>{}.obs;
  Map<String, WishlistModel> get wishlistItems => _wishlistItems;
  get wishlistItemsList => wishlistItems.values.toList().reversed.toList();
  Future<void> addToWishlist({required String productId}) async {
    // final User? user = appController.loginUser;
    final _uid = appController.loginUser?.uid;
    final wishlistId = const Uuid().v4();
    try {
      _wishlistLoading.value = true;
      FirebaseFirestore.instance
          .collection(Utils.userCollection)
          .doc(_uid)
          .update({
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
      GlobalMethods.errorDialog(subtitle: error.toString());
    }
    _wishlistLoading.value = false;
    update(['wish']);
  }

  // void addRemoveProductToWishlist({required String productId}) {
  //   if (_wishlistItems.containsKey(productId)) {
  //     removeOneItem(productId);
  //   } else {
  //     _wishlistItems.putIfAbsent(
  //         productId,
  //         () => WishlistModel(
  //             id: DateTime.now().toString(), productId: productId));
  //   }
  //   notifyListeners();
  // }

  final userCollection =
      FirebaseFirestore.instance.collection(Utils.userCollection);

  Future<void> fetchWishlist() async {
    // _wishlistLoading.value = true;
    final User? user = appController.loginUser;
    if (user == null) return;

    final DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();

    print("user doc=>${userDoc.id}");
    // if (userDoc == null) {
    //   return;
    // }
    print("userdocData${userDoc.data()}");
    final leng = userDoc.get('userWish').length;
    print("length=>$leng");

    for (int i = 0; i < leng; i++) {
      _wishlistItems.putIfAbsent(
          userDoc.get('userWish')[i]['productId'],
          () => WishlistModel(
                id: userDoc.get('userWish')[i]['wishlistId'],
                productId: userDoc.get('userWish')[i]['productId'],
              ));
    }
    // _wishlistLoading.value = false;
  }

  Future<void> removeOneItem({
    required String wishlistId,
    required String productId,
  }) async {
    _wishlistLoading.value = true;
    final User? user = appController.loginUser;
    await userCollection.doc(user!.uid).update({
      'userWish': FieldValue.arrayRemove([
        {
          'wishlistId': wishlistId,
          'productId': productId,
        }
      ])
    });
    _wishlistItems.remove(productId);
    _wishlistLoading.value = false;

    await fetchWishlist();
    update(['wish']);
  }

  Future<void> clearOnlineWishlist() async {
    final User? user = appController.loginUser;
    await userCollection.doc(user!.uid).update({
      'userWish': [],
    });
    _wishlistItems.clear();
    _wishlistLoading.value = false;
  }

  void clearLocalWishlist() {
    _wishlistItems.clear();
  }

  @override
  void onInit() {
    fetchWishlist();
    // TODO: implement onInit
    print("wishlist controller init");
    super.onInit();
  }
}
