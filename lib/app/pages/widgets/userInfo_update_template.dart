// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserInfoUpdateTemplate extends StatelessWidget {
//   final String name;
//   final void Function() onPressed;
//   final Widget body;
//   final RxBool isLoading;

//   ///Scaffold with Loading Indicator
//   const UserInfoUpdateTemplate({
//     Key? key,
//     required this.name,
//     required this.onPressed,
//     required this.body,
//     required this.isLoading,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         leading: TextButton(
//           // style: Themes.buttonStyle.copyWith(
//           //   side: MaterialStateProperty.all(BorderSide.none),
//           // ),
//           onPressed: Get.back,
//           child: const Text("Back"),
//         ),
//         title: Text(
//           name,
//           // style: Themes.bodyTitle.copyWith(
//           //   fontWeight: FontWeight.bold,
//           //   fontSize: 14,
//           // ),
//         ),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             // style: Themes.buttonStyle.copyWith(
//             //   side: MaterialStateProperty.all(BorderSide.none),
//             // ),
//             onPressed: onPressed,
//             child: const Text("Save"),
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           body,
//           Obx(() {
//             return isLoading.value
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : const SizedBox();
//           })
//         ],
//       ),
//     );
//   }
// }
