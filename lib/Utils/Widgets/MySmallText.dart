import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';

class MySmallText extends StatelessWidget {
  const MySmallText({
    super.key,
    required this.text,
    this.color = MyColors.textColor,
    this.size = 12,
    this.height = 1.2,
  });

  final Color? color;
  final double size;
  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
