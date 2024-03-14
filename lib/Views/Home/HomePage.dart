import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Utils/Constants/MySizes.dart';
import 'package:food_delivery_app/Utils/Widgets/MyBigText.dart';
import 'package:food_delivery_app/Utils/Widgets/MySmallText.dart';
import 'package:food_delivery_app/Views/Home/HomePageBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                top: MySizes.height45,
                bottom: MySizes.height15,
              ),
              padding: EdgeInsets.only(
                left: MySizes.width20,
                right: MySizes.width20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      MyBigText(
                        text: 'Egypt',
                        color: MyColors.mainColor,
                      ),
                      Row(
                        children: [
                          MySmallText(text: 'Giza'),
                          Icon(Icons.arrow_drop_down_outlined),
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: MySizes.width45,
                      height: MySizes.height45,
                      decoration: BoxDecoration(
                        color: MyColors.mainColor,
                        borderRadius: BorderRadius.circular(MySizes.radius15),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: MySizes.iconsize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          HomePageBody(),
        ],
      ),
    );
  }
}
