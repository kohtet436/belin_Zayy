import 'package:flutter/material.dart';

class QuantityControlBox extends StatelessWidget {
  void Function() onTap;
  IconData icon;
  Color color;
  QuantityControlBox(
      {super.key,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return
        //   Widget quantityControl(
        //   {required Function fct, required IconData icon, required Color color}) {
        // return
        Flexible(
      flex: 2,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: const Color.fromARGB(255, 9, 19, 168),
                size: 18,
              ),
            )),
      ),
    );
  }
}
