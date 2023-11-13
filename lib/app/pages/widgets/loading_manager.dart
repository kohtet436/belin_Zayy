import 'package:flutter/material.dart';

// class LoadingManager extends StatelessWidget {
//   const LoadingManager({Key? key, required this.isLoading, required this.child})
//       : super(key: key);
//   final bool isLoading;
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         isLoading
//             ? Container(
//                 color: Colors.black.withOpacity(0.7),
//               )
//             : Container(),
//         isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               )
//             : Container(),
//       ],
//     );
//   }
// }
class LoadingManager extends StatelessWidget {
  final Widget child;
  final bool? isloading;
  const LoadingManager({super.key,required this.child, this.isloading
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children:[ child],
    ),);
  }
}