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
      popularProductsList.clear();
      //  popularProductsList.addAll();
    }
  }
}
