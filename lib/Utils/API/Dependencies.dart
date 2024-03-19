import 'package:food_delivery_app/Utils/API/APIClient.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Repo/PopularFoodRepo.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Controller/RecommenededFoodController.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Repo/RecommenededFoodRepo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => APIClient(appBaseUrl: 'http://mvs.bslmeiyu.com'));
  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodController(recommendedFoodRepo: Get.find()));
}
