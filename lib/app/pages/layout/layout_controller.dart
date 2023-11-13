import 'dart:async';

import 'package:belin_zayy/app/ui/themes.dart/TextFieldBoxTheme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final RxInt _index = 0.obs;
  final connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  int get index => _index.value;
  void changeIndex(int next) {
    _index.value = next;
  }

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);

    ever(connectionType, (connection) {
      if (connection == 0) {
        // Get.dialog(AlertDialog(
        // title: Text("no internet"),
        // ));
        // while (Get.isDialogOpen!) {
        // Get.back();
        // }
      }
    });
    super.onInit();
  }

  bool isNetworkConnected() {
    return connectionType.value != 0;
  }

  Future<void> getConnectionType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        update();
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}

List<String> images = TextFieldBoxThemes.authImagesPaths;
