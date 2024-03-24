import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularFoodDetailsBottomBar extends StatelessWidget {
  ProductModel product;
  PopularFoodDetailsBottomBar({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularFoodController>(
      builder: (controller) {
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
                    GestureDetector(
                      onTap: () => controller.setQuantity(false),
                      child:
                          const Icon(Icons.remove, color: MyColors.signColor),
                    ),
                    SizedBox(width: MySizes.width10),
                    MyBigText(text: controller.quantity.toString()),
                    SizedBox(width: MySizes.width10),
                    GestureDetector(
                      onTap: () => controller.setQuantity(true),
                      child: const Icon(Icons.add, color: MyColors.signColor),
                    )
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
                child: MyBigText(
                    text: '\$${product.price} | Add to cart',
                    color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
