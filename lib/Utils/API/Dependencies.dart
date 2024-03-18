import 'package:food_delivery_app/Utils/API/APIClient.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Controller/PopularFoodController.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Repo/PopularFoodRepo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => APIClient(appBaseUrl: 'http://mvs.bslmeiyu.com'));
  Get.lazyPut(() => PopularFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => PopularFoodController(popularFoodRepo: Get.find()));
}
