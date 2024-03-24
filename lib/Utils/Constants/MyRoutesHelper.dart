import 'package:food_delivery_app/Views/Home/HomePage.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/PopularFoodDetails.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Widgets/RecommendedFoodDetails.dart';
import 'package:get/get.dart';

class MyRoutesHelper {
  static const String initial = '/';

  static const String popularFood = '/popularFood';

  static const String recommendedFood = '/recommendedFood';

  static String getInitial() => initial;

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        final pageId = Get.parameters['PageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        final pageId = Get.parameters['PageId'];
        return RecommendedFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
