import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';

class PopularFoodDetailsBottomBar extends StatelessWidget {
  const PopularFoodDetailsBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MySizes.bottomHeightBar,
      padding: EdgeInsets.only(
        left: MySizes.width20,
        right: MySizes.width20,
        top: MySizes.height20,
        bottom: MySizes.height20,
      ),
      decoration: BoxDecoration(
        color: MyColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MySizes.radius20 * 2),
          topRight: Radius.circular(MySizes.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MySizes.width20,
              right: MySizes.width20,
              top: MySizes.height20,
              bottom: MySizes.height20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySizes.radius20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const Icon(Icons.remove, color: MyColors.signColor),
                SizedBox(width: MySizes.width10),
                const MyBigText(text: '0'),
                SizedBox(width: MySizes.width10),
                const Icon(Icons.add, color: MyColors.signColor)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: MySizes.width20,
              right: MySizes.width20,
              top: MySizes.height20,
              bottom: MySizes.height20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySizes.radius20),
              color: MyColors.mainColor,
            ),
            child: const MyBigText(
                text: '\$10 | Add to cart', color: Colors.white),
          ),
        ],
      ),
    );
  }
}
