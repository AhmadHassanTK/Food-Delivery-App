import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MyRoutesHelper.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyAppIcon.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/ExtendableText.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Controller/RecommenededFoodController.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetails({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    final product =
        Get.find<RecommendedFoodController>().recommenededProductsList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MySizes.width20 * 2,
              right: MySizes.width20 * 2,
              top: MySizes.height10,
              bottom: MySizes.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppIcon(
                  iconsize: MySizes.iconsize24,
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: MyColors.mainColor,
                ),
                MyBigText(
                  text: '\$${product.price} X 0',
                  color: MyColors.mainBlackColor,
                  size: MySizes.font26,
                ),
                MyAppIcon(
                  iconsize: MySizes.iconsize24,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: MyColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
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
                    child: const Icon(
                      Icons.favorite,
                      color: MyColors.mainColor,
                    )),
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
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(MyRoutesHelper.getInitial()),
                  child: const MyAppIcon(icon: Icons.clear),
                ),
                const MyAppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MySizes.radius20),
                    topRight: Radius.circular(MySizes.radius20),
                  ),
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                    child: MyBigText(
                  text: product.name!,
                  size: MySizes.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: MyColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${MyAppConstants.baseUrl}/uploads/${product.img!}',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.only(
              left: MySizes.width20,
              right: MySizes.width20,
              bottom: MySizes.height10,
            ),
            child: ExtendableText(text: product.description!),
          )),
        ],
      ),
    );
  }
}
