import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyAppIcon.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Utils/Widgets/MyTextAndIcon.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/ExtendableText.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/PopularFoodDetailsBottomBar.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const PopularFoodDetailsBottomBar(),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MySizes.foodImgSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: MySizes.width20,
            right: MySizes.width20,
            top: MySizes.height45,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppIcon(icon: Icons.arrow_back_ios),
                MyAppIcon(icon: Icons.shopping_cart_outlined),
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
                      MyBigText(text: 'Chinese Side', size: MySizes.font26),
                      SizedBox(height: MySizes.height10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
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
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExtendableText(
                        text:
                            'Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion. Plants, which convert solar energy to food by photosynthesis, are the primary food source. Animals that feed on plants often serve as sources of food for other animals. To learn more about the sequence of transfers of matter and energy in the form of food from organism to organism, see food chain gathering, horticulture, pastoralism, and the development of agriculture are the primary means by which humans have adapted to their environments to feed themselves. Food has long served as a carrier of culture in human societies and has been a driving force for globalization. This was especially the case during the early phases of European trade and colonial expansion, when foods such as the hot red pepper, corn (maize), and sweet potatoes spread throughout Europe to Africa and Asia.',
                      ),
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
