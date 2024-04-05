import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MyRoutesHelper.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyAppIcon.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Views/Cart/Controller/CartController.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Controller/RecommenededFoodController.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MySizes.height30 * 2,
            left: MySizes.width20,
            right: MySizes.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: MyAppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: MyColors.mainColor,
                    iconsize: MySizes.iconsize24,
                  ),
                ),
                SizedBox(width: MySizes.radius20 * 2),
                GestureDetector(
                  onTap: () => Get.toNamed(MyRoutesHelper.getInitial()),
                  child: MyAppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: MyColors.mainColor,
                    iconsize: MySizes.iconsize24,
                  ),
                ),
                MyAppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: MyColors.mainColor,
                  iconsize: MySizes.iconsize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: MySizes.height30 * 4,
            left: MySizes.width20,
            right: MySizes.width20,
            bottom: 0,
            child: Container(
              child: GetBuilder<CartController>(
                builder: (controller) => ListView.builder(
                  itemCount: controller.getItems.length,
                  itemBuilder: (context, index) => Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final productIndex =
                                Get.find<PopularFoodController>()
                                    .popularProductsList
                                    .indexOf(
                                        controller.getItems[index].product!);

                            if (productIndex >= 0) {
                              Get.toNamed(
                                  MyRoutesHelper.getPopularFood(productIndex));
                            } else {
                              final productIndex =
                                  Get.find<RecommendedFoodController>()
                                      .recommenededProductsList
                                      .indexOf(
                                          controller.getItems[index].product!);

                              Get.toNamed(MyRoutesHelper.getRecommendedFood(
                                  productIndex));
                            }
                          },
                          child: Container(
                            width: MySizes.width20 * 5,
                            height: MySizes.height20 * 5,
                            margin: EdgeInsets.only(bottom: MySizes.height10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${MyAppConstants.baseUrl}/uploads/${controller.getItems[index].img}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.circular(MySizes.radius20),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: MySizes.width10),
                        Expanded(
                          child: Container(
                            height: MySizes.height20 * 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyBigText(
                                  text: controller.getItems[index].name!,
                                  color: Colors.black54,
                                ),
                                const MySmallText(text: 'Spicy'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyBigText(
                                      text:
                                          '\$ ${controller.getItems[index].price}',
                                      color: Colors.redAccent,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: MySizes.width10,
                                        right: MySizes.width10,
                                        top: MySizes.height10,
                                        bottom: MySizes.height10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            MySizes.radius20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => controller.addItems(
                                                controller
                                                    .getItems[index].product!,
                                                -1),
                                            child: const Icon(Icons.remove,
                                                color: MyColors.signColor),
                                          ),
                                          SizedBox(width: MySizes.width10),
                                          MyBigText(
                                            text: controller
                                                .getItems[index].quantity
                                                .toString(),
                                          ),
                                          SizedBox(width: MySizes.width10),
                                          GestureDetector(
                                            onTap: () => controller.addItems(
                                                controller
                                                    .getItems[index].product!,
                                                1),
                                            child: const Icon(Icons.add,
                                                color: MyColors.signColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
