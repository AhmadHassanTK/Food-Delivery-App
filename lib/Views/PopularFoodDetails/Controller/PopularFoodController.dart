import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/CategoriesProductsModel.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Views/Cart/Controller/CartController.dart';
import 'package:food_delivery_app/Views/PopularFoodDetails/Repo/PopularFoodRepo.dart';
import 'package:get/get.dart';

class PopularFoodController extends GetxController {
  static PopularFoodController get instance => Get.find();

  final PopularFoodRepo popularFoodRepo;

  PopularFoodController({required this.popularFoodRepo});

  final List<ProductModel> _popularProductsList = [];

  List<ProductModel> get popularProductsList => _popularProductsList;

  int _quantity = 0;

  int get quantity => _quantity;

  int _cartItems = 0;

  int get cartItems => _cartItems + _quantity;

  CartController cartController = Get.find();

  @override
  void onInit() {
    getPopularProductsList();
    super.onInit();
  }

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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity += 1);
    } else {
      _quantity = checkQuantity(_quantity -= 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Items',
        'You can\'t reduce more !',
        backgroundColor: MyColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 10) {
      Get.snackbar(
        'Items',
        'You can\'t add more !',
        backgroundColor: MyColors.mainColor,
        colorText: Colors.white,
      );
      return 10;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
    _cartItems = 0;
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      cartController.addItems(product, _quantity);
    } else {
      Get.snackbar(
        'Items',
        'You should add items to the cart !',
        backgroundColor: MyColors.mainColor,
        colorText: Colors.white,
      );
    }
  }
}
