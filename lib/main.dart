import 'package:flutter/material.dart';
import 'package:food_delivery_app/Views/Home/HomePage.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Controller/RecommenededFoodController.dart';
import 'package:get/get.dart';
import 'utils/API/Dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PopularFoodController.instance.getPopularProductsList();
    RecommendedFoodController.instance.getRecommendedProductsList();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
