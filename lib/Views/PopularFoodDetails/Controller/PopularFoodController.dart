import 'package:food_delivery_app/Models/PopularProductModel.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Repo/PopularFoodRepo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  static PopularFoodController get instance => Get.find();

  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});

  RxList<dynamic> popularProductsList = [].obs;

  Future<void> getPopularProductsList() async {
    Response response = await popularFoodRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      print('got products');
      popularProductsList.clear();
      popularProductsList.addAll(
          PopularProductModel.fromJson(response.body).productsList as Iterable);
      print(popularProductsList.length);
    }
  }
}
