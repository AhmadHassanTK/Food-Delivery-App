import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MyRoutesHelper.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyAppIcon.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Utils/Widgets/MyTextAndIcon.dart';
import 'package:food_delivery_app/Views/Cart/Cart.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/ExtendableText.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/PopularFoodDetailsBottomBar.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularFoodDetails extends StatelessWidget {
  int pageId;
  PopularFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    final product =
        Get.find<PopularFoodController>().popularProductsList[pageId];
    Get.find<PopularFoodController>().initProduct(product);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: PopularFoodDetailsBottomBar(product: product),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MySizes.foodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '${MyAppConstants.baseUrl}/uploads/${product.img!}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: MySizes.width20,
            right: MySizes.width20,
            top: MySizes.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(MyRoutesHelper.getInitial()),
                  child: const MyAppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularFoodController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(const CartPage()),
                          child: const MyAppIcon(
                              icon: Icons.shopping_cart_outlined),
                        ),
                        controller.totalCartItems >= 1
                            ? const Positioned(
                                right: 0,
                                top: 0,
                                child: MyAppIcon(
                                  icon: Icons.circle,
                                  size: 20,
                                  iconColor: Colors.transparent,
                                  backgroundColor: MyColors.mainColor,
                                ),
                              )
                            : Container(),
                        controller.totalCartItems >= 1
                            ? Positioned(
                                right: 6,
                                top: 2,
                                child: MyBigText(
                                  text: controller.totalCartItems.toString(),
                                  size: 12,
                                  color: Colors.white,
                                ))
                            : Container()
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: MySizes.foodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: MySizes.width20,
                right: MySizes.width20,
                top: MySizes.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySizes.radius20),
                  topRight: Radius.circular(MySizes.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyBigText(text: product.name!, size: MySizes.font26),
                      SizedBox(height: MySizes.height10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              product.stars!,
                              (index) => const Icon(
                                Icons.star,
                                color: MyColors.mainColor,
                                size: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: MySizes.width10),
                          const MySmallText(text: '4.5'),
                          SizedBox(width: MySizes.width10),
                          const MySmallText(text: '1287 comments'),
                        ],
                      ),
                      SizedBox(height: MySizes.height15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTextAndIcon(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: MyColors.iconColor1,
                          ),
                          MyTextAndIcon(
                            icon: Icons.location_on,
                            text: '1.7Km',
                            iconColor: MyColors.mainColor,
                          ),
                          MyTextAndIcon(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: MyColors.iconColor2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MySizes.height20),
                  const MyBigText(text: 'Introduce'),
                  SizedBox(height: MySizes.height15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExtendableText(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
