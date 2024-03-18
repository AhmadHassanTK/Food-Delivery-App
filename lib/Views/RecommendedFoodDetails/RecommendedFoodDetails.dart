import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyAppIcon.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/ExtendableText.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                  text: '\$12.88 X 0',
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
                  child: const MyBigText(
                      text: '\$10 | Add to cart', color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyAppIcon(icon: Icons.clear),
                MyAppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
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
                  text: 'Chinese Food',
                  size: MySizes.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: MyColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
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
            child: const ExtendableText(
              text:
                  'A mobile phone (or cellphone[a]) is a portable telephone that can make and receive calls over a radio frequency link while the user is moving within a telephone service area, as opposed to a fixed-location phone (landline phone). The radio frequency link establishes a connection to the switching systems of a mobile phone operator, which provides access to the public switched telephone network (PSTN). Modern mobile telephone services use a cellular network architecture and therefore mobile telephones are called cellphones (or "cell phones") in North America. In addition to telephony, digital mobile phones support a variety of other services, such as text messaging, multimedia messaging, email, Internet access (via LTE, 5G NR or Wi-Fi), short-range wireless communications (infrared, Bluetooth), satellite access (navigation, messaging connectivity), business applications, payments (via NFC), multimedia playback and streaming (radio, television), digital photography, and video games. Mobile phones offering only basic capabilities are known as feature phones (slang: "dumbphones"); mobile phones which offer greatly advanced computing capabilities are referred to as smartphones.[1] The first handheld mobile phone was demonstrated by Martin Cooper of Motorola in New York City on 3 April 1973, using a handset weighing c. 2 kilograms (4.4 lbs).[2] In 1979, Nippon Telegraph and Telephone (NTT) launched the worlds first cellular network in Japan.[3] In 1983, the DynaTAC 8000x was the first commercially available handheld mobile phone. From 1983 to 2014, worldwide mobile phone subscriptions grew to over seven billion; enough to provide one for every person on Earth.[4] In the first quarter of 2016, the top smartphone developers worldwide were Samsung, Apple and Huawei; smartphone sales represented 78 percent of total mobile phone sales.[5] For feature phones as of 2016, the top-selling brands were Samsung, Nokia and Alcatel.[6]',
            ),
          )),
        ],
      ),
    );
  }
}
