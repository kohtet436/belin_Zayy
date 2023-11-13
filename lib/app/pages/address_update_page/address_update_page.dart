import 'package:belin_zayy/app/controllers/app_controller.dart';
import 'package:belin_zayy/app/pages/widgets/username_address_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressUpdatePage extends GetView<AppController> {
  const AddressUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
    // controller.addressController.text = controller.address;

    // return UsernameAddressTemplate(
    //   isLoading: controller.isAddressUpdating,
    //   name: "Address",
    //   onPressed: controller.addressChange,
    //   focusNode: controller.addressFocusNode,
    //   form: controller.addressForm,
    //   controller: controller.addressController,
    // );
  }
}
