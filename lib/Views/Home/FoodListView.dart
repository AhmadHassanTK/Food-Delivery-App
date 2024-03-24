import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MyRoutesHelper.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Utils/Widgets/MyTextAndIcon.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Controller/RecommenededFoodController.dart';
import 'package:get/get.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedFoodController>(
      builder: (controller) {
        return controller.recommenededProductsList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.recommenededProductsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(MyRoutesHelper.recommendedFood),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MySizes.width20,
                        right: MySizes.width20,
                        bottom: MySizes.height10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MySizes.listViewImgSize,
                            height: MySizes.listViewImgSize,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(MySizes.radius20),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${MyAppConstants.baseUrl}/uploads/${controller.recommenededProductsList[index].img!}'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MySizes.listViewTextContSize,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(MySizes.radius20),
                                  bottomRight:
                                      Radius.circular(MySizes.radius20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: MySizes.width15,
                                  left: MySizes.width15,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyBigText(
                                      text: controller
                                          .recommenededProductsList[index]
                                          .name!,
                                    ),
                                    SizedBox(height: MySizes.height10),
                                    const MySmallText(
                                      text: 'With chinese characteristics',
                                    ),
                                    SizedBox(height: MySizes.height10),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(color: MyColors.mainColor);
      },
    );
  }
}
