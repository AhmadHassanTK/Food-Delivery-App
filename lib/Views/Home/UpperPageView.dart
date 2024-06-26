import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MyRoutesHelper.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Utils/Widgets/MyTextAndIcon.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpperPageView extends StatelessWidget {
  UpperPageView({
    super.key,
    required this.currpageindex,
    required this.scalefactor,
    required this.pageController,
    this.controller,
  });

  double currpageindex;
  PageController pageController;
  double scalefactor;
  PopularFoodController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySizes.pageView,
      child: PageView.builder(
        controller: pageController,
        itemCount: controller?.popularProductsList.length,
        itemBuilder: (context, index) {
          return buildPageItem(index, controller!.popularProductsList[index]);
        },
      ),
    );
  }

  Widget buildPageItem(int index, ProductModel product) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currpageindex.floor()) {
      double currscale = 1 - (currpageindex - index) * (1 - scalefactor);
      double currtrans = 220 * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currpageindex.floor() + 1) {
      double currscale =
          scalefactor + (currpageindex - index + 1) * (1 - scalefactor);
      double currtrans = 220 * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else if (index == currpageindex.floor() - 1) {
      double currscale = 1 - (currpageindex - index) * (1 - scalefactor);
      double currtrans = 220 * (1 - currscale) / 2;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, currtrans, 0);
    } else {
      double currscale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currscale, 1)
        ..setTranslationRaw(0, 220 * (1 - currscale) / 2, 0);
    }
    print('the height is ${Get.context!.height}');
    print('the width is ${Get.context!.width}');

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () => Get.toNamed(MyRoutesHelper.getPopularFood(index)),
        child: Stack(
          children: [
            Container(
              height: MySizes.pageViewContainer,
              margin: EdgeInsets.only(
                  left: MySizes.width10, right: MySizes.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySizes.radius30),
                image: DecorationImage(
                  image: NetworkImage(
                      '${MyAppConstants.baseUrl}/uploads/${product.img!}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MySizes.pageViewTextContainer,
                margin: EdgeInsets.only(
                  left: MySizes.width30,
                  right: MySizes.width30,
                  bottom: MySizes.height30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MySizes.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: MySizes.height15,
                    right: MySizes.width15,
                    left: MySizes.width15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyBigText(text: product.name!),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
