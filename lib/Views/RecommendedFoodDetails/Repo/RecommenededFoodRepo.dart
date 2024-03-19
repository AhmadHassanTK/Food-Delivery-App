import 'package:food_delivery_app/Utils/API/APIClient.dart';
import 'package:food_delivery_app/Utils/Constants/MyAppConstants.dart';
import 'package:get/get.dart';

class RecommendedFoodRepo extends GetxService {
  final APIClient apiClient;

  RecommendedFoodRepo({required this.apiClient});

  Future<Response> getRecommenededProductsList() async {
    return await apiClient.getData(MyAppConstants.recommendedProductsUrI);
  }
}
