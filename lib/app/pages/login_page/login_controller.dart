// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/routes/routes.dart';
import 'package:belin_zayy/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:starlight_country_picker/country_picker.dart';

class LoginController extends GetxController {
  final RxBool _loginLoading = false.obs;

  bool get loginLoading => _loginLoading.value;
  set loginLoading(bool val) => _loginLoading.value = val;
  final RxBool _verifyLoading = false.obs;

  bool get verifyLoading => _verifyLoading.value;
  set verifyLoading(bool val) => _verifyLoading.value = val;
  String? verificationId;

  final Rx<Country> _selectedCountry =
      const Country(dialCode: '+95', name: 'Myanmar', flag: '🇲🇲').obs;
  Country get selectedCountry => _selectedCountry.value;
  set selectedCountry(Country country) => _selectedCountry.value = country;

  final List<TextEditingController> verfiyController = [];
  final List<FocusNode> focusNode = [];
  final List<FocusNode> rawFocusNode = [];

  final TextEditingController phoneController = TextEditingController();
  final FocusNode loginFoucsNode = FocusNode();

  GlobalKey<FormState>? loginForm = GlobalKey<FormState>();
  GlobalKey<FormState>? verifyForm = GlobalKey<FormState>();
  GlobalKey<FormState>? userInfoForm = GlobalKey<FormState>();

  String get _verifyCode {
    String veirfyCode = '';
    for (TextEditingController editing in verfiyController) {
      veirfyCode += editing.text;
    }

    return veirfyCode;
  }

  void init() {
    for (var i = 0; i < 6; i++) {
      verfiyController.add(TextEditingController());
      focusNode.add(FocusNode());
      rawFocusNode.add(FocusNode());
    }
  }

  void clear() {
    for (int i = 0; i < 6; i++) {
      verfiyController[i].clear();
      focusNode[i].unfocus();
      rawFocusNode[i].unfocus();
    }
  }

  void reset() {
    loginForm = null;
    verifyForm = null;
    userInfoForm = null;
    loginForm = GlobalKey<FormState>();
    verifyForm = GlobalKey<FormState>();
    userInfoForm = GlobalKey<FormState>();
    phoneController.clear();

    loginFoucsNode.unfocus();
    for (var i = 0; i < 6; i++) {
      verfiyController[i].clear();
      focusNode[i].unfocus();
      rawFocusNode[i].unfocus();
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  AppController appController = Get.find<AppController>();
  Future<void> verify() async {
    print("id is $verificationId");
    if (verificationId == null) return;
    _verifyLoading.value = true;

    UserCredential cre = await authService.auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: _verifyCode));
    // if(appController.loginUser?.displayName==null){
    //   Get.toNamed(Routes.verifyPage);

// Get.toNamed(Routes.layout);

    Get.offNamedUntil(Routes.userInfoFilPage, (route) => false);

    print("verificaiton id =>$verificationId");
  }

  Future<void> phoneLogin() async {
    print("phone login do");
    await authService.auth
        .
        // signInWithPhoneNumber
        verifyPhoneNumber(
      phoneNumber: '${selectedCountry.dialCode}${phoneController.text}',
      verificationCompleted: (cre) {
        ///
        print("complete");
      },
      verificationFailed: (exp) {
        print("fail");
        Get.defaultDialog(
          // title: fromSetting ? "Failed to update" : "Login Failed",
          content: Text(exp.code),
          actions: [
            OutlinedButton(
              onPressed: Get.back,
              child: const Text("Ok"),
            )
          ],
        );
      },
      codeSent: (token, code) {
        print("token=>$token");
        print("code=>$code");

        ///Verify
        verificationId = token;

        Get.toNamed(Routes.verifyPage);
        _loginLoading.value = false;
        // (_) => false
        // Get.toNamed(Routers.verify);
      },
      codeAutoRetrievalTimeout: (ret) {
        print("ret=>$ret");
      },
    );
  }

  Future<void> login() async {
    //     print("number si ${selectedCountry.dialCode}${phoneController.text}",);

    if (loginForm?.currentState?.validate() == true) {
      _loginLoading.value = true;
      loginFoucsNode.unfocus();

      verificationId = null;
      print("verification id=>$verificationId");
      return phoneLogin();
    }

    // await authService.auth.verifyPhoneNumber(
    //     phoneNumber:"${selectedCountry.dialCode}${phoneController.text}",
    //     verificationCompleted: (PhoneAuthCredential credential) {
    //     },
    //     verificationFailed: (FirebaseAuthException e) {},
    //     codeSent: (String verificationId, int? resendToken) {
    //      verificationId = verificationId;
    //       Get.offNamedUntil(Routes.verifyPage,(route)=>false);
    //       print("verification =>${verificationId}=code =>${resendToken}");
    //     },
    //     codeAutoRetrievalTimeout: (String verificationId) {},
    //   );
  }
}
