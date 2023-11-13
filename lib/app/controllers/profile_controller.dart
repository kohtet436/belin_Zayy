import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// 0f:bd:83:2f:28:ef:44:fc:94:bf:aa:44:df:fc:10:fe:f5:0e:fd:75
// 0F:BD:83:2F:28:EF:44:FC:94:BF:AA:44:DF:FC:10:FE:F5:0E:FD:75
// 03:10:26:07:E5:63:48:EA:15:F7:69:58:4B:92:63:47:44:B5:74:21:AB:9A:15:76:98:68:EB:DF:29:D5:15:FD
class ProfileController extends GetxController {
  RxBool _gettingImage = false.obs;
  get gettingImage => _gettingImage.value;
  set gettingImage(val) => _gettingImage.value = val;
  void getImage(ImageSource imageSource, User? user) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      _gettingImage.value = true;
      pickedFile.path;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile')
          .child(user?.uid ?? "");
      UploadTask uploadTask = ref.putFile(
        File(pickedFile.path),
        SettableMetadata(
          contentType: pickedFile.mimeType,
        ),
      );
      uploadTask.whenComplete(() async {
        String profileLink = await ref.getDownloadURL();
        await user?.updatePhotoURL(profileLink);
        _gettingImage.value = false;
      });
    } else {
      print("No image selected");
    }
  }
}
