import 'package:food_delivery_app/Utils/API/APIClient.dart';
import 'package:get/get.dart';

class PopularFoodRepo extends GetxService {
  final APIClient apiClient;

  PopularFoodRepo({required this.apiClient});

  Future<Response> getPopularProductsList() async {
    return await apiClient.getData('https://api.fooddelivery');
  }
}
