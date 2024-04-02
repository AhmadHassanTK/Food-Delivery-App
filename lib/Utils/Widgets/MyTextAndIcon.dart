import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';

class MyTextAndIcon extends StatelessWidget {
  const MyTextAndIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: MySizes.iconsize24),
        SizedBox(width: MySizes.width3),
        MySmallText(text: text)
      ],
    );
  }
}
