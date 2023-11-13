import 'package:belin_zayy/app/pages/widgets/text_widget.dart';
import 'package:belin_zayy/app/utilites/utils.dart';
import 'package:belin_zayy/app/values/font_manager.dart';
import 'package:belin_zayy/app/values/style_manager.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  // final Color color;
  final Function onPressed;
  const ProfileListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    // required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: getRegularStyle(
            fontSize: FontSize.defaultFontSize, color: Colors.black87),
      ),
      subtitle: Text(
        subtitle ?? "",
        style: getMediumStyle(fontSize: FontSize.s14, color: Colors.black54),
      ),
      leading: Icon(
        icon,
        color: Colors.black87,
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black87,
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
