import 'package:food_delivery_app/Models/CategoriesProductsModel.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Repo/PopularFoodRepo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  static PopularFoodController get instance => Get.find();

  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});

  List<ProductModel> _popularProductsList = [];

  List<ProductModel> get popularProductsList => _popularProductsList;

  Future<void> getPopularProductsList() async {
    Response response = await popularFoodRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      _popularProductsList.clear();
      _popularProductsList.addAll(
          CategoriesProductsModel.fromJson(response.body).productsList
              as Iterable<ProductModel>);
      update();
    }
  }
}
