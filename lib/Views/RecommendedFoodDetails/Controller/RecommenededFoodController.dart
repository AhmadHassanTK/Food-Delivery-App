import 'package:food_delivery_app/Models/CategoriesProductsModel.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Views/RecommendedFoodDetails/Repo/RecommenededFoodRepo.dart';
import 'package:get/get.dart';

class RecommendedFoodController extends GetxController {
  static RecommendedFoodController get instance => Get.find();

  final RecommendedFoodRepo recommendedFoodRepo;

  RecommendedFoodController({required this.recommendedFoodRepo});

  List<ProductModel> _recommendedProductsList = [];

  List<ProductModel> get recommenededProductsList => _recommendedProductsList;

  Future<void> getRecommendedProductsList() async {
    Response response = await recommendedFoodRepo.getRecommenededProductsList();
    if (response.statusCode == 200) {
      print('got products recommened');
      _recommendedProductsList.clear();
      _recommendedProductsList.addAll(
          CategoriesProductsModel.fromJson(response.body).productsList
              as Iterable<ProductModel>);
      update();
      print(recommenededProductsList.length);
    }
  }
}
