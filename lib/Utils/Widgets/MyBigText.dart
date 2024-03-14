import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';

class MyBigText extends StatelessWidget {
  const MyBigText({
    super.key,
    required this.text,
    this.color = MyColors.mainBlackColor,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  });

  final Color? color;
  final double size;
  final String text;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? MySizes.font20 : size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
