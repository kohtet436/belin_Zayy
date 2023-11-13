import 'dart:async';
import 'package:belin_zayy/app/data/model/database_model.dart';
import 'package:belin_zayy/app/data/model/user_model.dart';
import 'package:belin_zayy/app/data/services/firebase_services.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum AuthState { authorized, unauthorized, checking }

class AppController extends GetxController {
  final Rx<Position> _currentPosition = Position(
          longitude: 0.0,
          latitude: 0.0,
          timestamp: DateTime.now(),
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0)
      .obs;
  final RxBool _canpop = false.obs;
  final RxString _currentAddress = "".obs;
  final Rx<AuthState> _authState = AuthState.checking.obs;
  final Rx<UserModel> _loginUser = UserModel().obs;

  AuthState get authState => _authState.value;
  User? get loginUser => _loginUser.value.user;
  String? get address => _loginUser.value.address;
  bool get canpop => _canpop.value;
  String get currentAddress => _currentAddress.value;
  Position get currentPosition => _currentPosition.value;

  Stream<String> get stream => _streamController.stream;
  final StreamController<String> _streamController = StreamController<String>();

  set currentAddress(val) => _currentAddress.value = val;
  set address(val) => _loginUser.value.address = val;
  set canpop(val) => _canpop.value = val;
  set currentPosition(val) => _currentPosition.value = val;

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();

  Future<void> usernameChange() async {
    loginUser?.updateDisplayName(nameController.text);
  }

  bool pop() {
    _canpop.value = true;
    return _canpop.value;
  }

  Future<void> userAddressChange() async {
    authService.firebaseServices.write(DatabaseModel(
        collection: Utils.userCollection,
        doc: loginUser?.uid,
        data: {
          'address':
              // currentAddress
              addressController.text
        }));
  }

  @override
  void onInit() {
    super.onInit();

    StreamSubscription<User?> authStateChange =
        authService.authStateChange().listen((User? event) {
      if (event != null) {
        _authState.value = AuthState.authorized;
        _loginUser.value = UserModel(user: event);

        StreamSubscription<User?> userStateChange =
            authService.userStateChange().listen((User? event) async {
          _loginUser.value = _loginUser.value.userUpdate(user: event);
        });
        FirebaseServices()
            .watchOnly(
                DatabaseModel(collection: Utils.userCollection, doc: event.uid))
            ?.listen((DocumentSnapshot<Map<String, dynamic>> event) {
          if (event.data() != null) {
            _loginUser.value = _loginUser.value.userInfo(event.data()!);
          }
        });
      }
      _authState.value = AuthState.unauthorized;
      return;
    });
  }

  Future<void> logout() async {
    try {
      _authState.value = AuthState.unauthorized;

      _loginUser.value = UserModel();
      await authService.auth.signOut();
      addressController.clear();
      nameController.clear();
      // Get.offNamedUntil(Routes.wrapperPage, (route) => false);
      Get.offNamedUntil(Routes.loginPage, (route) => false);
    } catch (e) {
      ///ToDo
    }
  }

  Future<void> getAddressFromLatLng(Position position) async {
    print("getaddress fun call");
    await placemarkFromCoordinates(
            _currentPosition.value.latitude, _currentPosition.value.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress.value =
          "${place.name} ${place.administrativeArea} ${place.subAdministrativeArea}";
      print("address=> ${_currentAddress.value}");
      print("name${place.name}");
      print("adminstrativearea ${place.administrativeArea}");
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getCurrentPosition() async {
    // _open.value = true;
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition.value = position;
      getAddressFromLatLng(_currentPosition.value);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("title",
          "Location services are disabled. Please enable the services");

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("title", "Location permissions are denied");

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("title",
          "Location permissions are permanently denied, we cannot request permissions.");

      return false;
    }
    return true;
  }
}
