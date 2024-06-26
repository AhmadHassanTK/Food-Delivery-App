import 'package:food_delivery_app/Views/Cart/Cart.dart';
import 'package:food_delivery_app/Views/Home/HomePage.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Widgets/PopularFoodDetails.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Widgets/RecommendedFoodDetails.dart';
import 'package:get/get.dart';

class MyRoutesHelper {
  static const String initial = '/';
  static const String popularFood = '/popularFood';
  static const String recommendedFood = '/recommendedFood';
  static const String cartPage = '/cartpage';

  static String getInitial() => initial;

  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(
      name: popularFood,
      page: () {
        final pageId = Get.parameters['pageId'];
        return PopularFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        final pageId = Get.parameters['pageId'];
        return RecommendedFoodDetails(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
