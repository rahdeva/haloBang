import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:buahtangan/app/themes/color_theme.dart';

void showSnackbar(title, subtitle, Widget icon){
  Get.snackbar(
    title,
    subtitle,
    snackPosition: SnackPosition.BOTTOM,
    icon: icon,
    backgroundColor: onSurfaceColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(20),
    colorText: onSurfaceColor,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}