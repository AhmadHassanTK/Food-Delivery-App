import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MySectionTitle.dart';
import 'package:food_delivery_app/Views/Home/FoodListView.dart';
import 'package:food_delivery_app/Views/Home/UpperPageView.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double currpageindex = 0.0;
  double scalefactor = 0.8;
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currpageindex = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpperPageView(
              currpageindex: currpageindex,
              scalefactor: scalefactor,
              pageController: pageController,
            ),
            DotsIndicator(
              dotsCount: 5,
              position: currpageindex.toInt(),
              decorator: DotsDecorator(
                size: const Size.square(9),
                activeSize: const Size(18, 9),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                activeColor: MyColors.mainColor,
              ),
            ),
            SizedBox(height: MySizes.height30),
            const MySectionTitle(bigText: 'Popular', smallText: 'Food Pairing'),
            const FoodListView(),
          ],
        ),
      ),
    );
  }
}
