// import 'package:belin_zayy/app/pages/widgets/userInfo_update_template.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UsernameAddressTemplate extends StatelessWidget {
//   final String name;
//   final void Function() onPressed;
//   final TextEditingController controller;
//   final FocusNode? focusNode;
//   final RxBool isLoading;
//   final GlobalKey<FormState>? form;
//   const UsernameAddressTemplate({
//     Key? key,
//     required this.name,
//     required this.onPressed,
//     required this.controller,
//     this.form,
//     this.focusNode,
//     required this.isLoading,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return UserInfoUpdateTemplate(
//       isLoading: isLoading,
//       name: name,
//       onPressed: onPressed,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Form(
//           key: form,
//           child: TextFormField(
//             validator: (_) => _?.isEmpty == true ? "required" : null,
//             focusNode: focusNode,
//             controller: controller,
//             onEditingComplete: onPressed,
//             decoration: InputDecoration(
//               enabledBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.black,
//                 ),
//               ),
//               hintText: name,
//               suffixIconConstraints: const BoxConstraints(
//                 maxHeight: 30,
//                 maxWidth: 30,
//               ),
//               suffixIcon: 
//               // ButtonLayer(
//                 // color: Themes.buttonLayer,
//                 GestureDetector(
//                   onTap: controller.clear,
//                   child: const Icon(
//                     Icons.close,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 // ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
