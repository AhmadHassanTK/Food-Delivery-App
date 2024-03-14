import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';

class MySectionTitle extends StatelessWidget {
  const MySectionTitle({
    super.key,
    required this.bigText,
    required this.smallText,
  });

  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MySizes.width30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MyBigText(text: bigText),
          SizedBox(width: MySizes.width10),
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: const MyBigText(text: '.', color: Colors.black26),
          ),
          SizedBox(width: MySizes.width10),
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: MySmallText(text: smallText),
          ),
        ],
      ),
    );
  }
}
