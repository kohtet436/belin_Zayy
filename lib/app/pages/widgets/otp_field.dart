import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final void Function()? onEditingComplete;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  const OtpField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        onEditingComplete: onEditingComplete,
        textAlign: TextAlign.center,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          // fillColor: Themes.buttonBgColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
            ),
          ),
        ),
      ),
    );
  }
}
