import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Utils/Widgets/MyTextAndIcon.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
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
                  borderRadius: BorderRadius.circular(MySizes.radius20),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/food0.png'),
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
                      bottomRight: Radius.circular(MySizes.radius20),
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
                        const MyBigText(
                          text: 'Nutrition fruit meal in China',
                        ),
                        SizedBox(height: MySizes.height10),
                        const MySmallText(
                          text: 'With chinese characteristics',
                        ),
                        SizedBox(height: MySizes.height10),
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
              )
            ],
          ),
        );
      },
    );
  }
}
