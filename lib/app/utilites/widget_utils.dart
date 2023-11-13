import 'package:flutter/material.dart';

import '../values/value_manager.dart';

class WidgetUtil {
  static WidgetUtil? _instance;

  WidgetUtil._();

  factory WidgetUtil() {
    _instance ??= WidgetUtil._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }
  static Widget spaceHorizontal(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceVertical(double height) {
    return SizedBox(
      height: height,
    );
  }

  static EdgeInsets defaultAllPadding() {
    return const EdgeInsets.all(AppPadding.p16);
  }

  static EdgeInsets defaultHorizontalPadding() {
    return const EdgeInsets.symmetric(horizontal: AppPadding.p16);
  }

  static EdgeInsets defaultVerticalPadding() {
    return const EdgeInsets.symmetric(vertical: AppPadding.p16);
  }
}
