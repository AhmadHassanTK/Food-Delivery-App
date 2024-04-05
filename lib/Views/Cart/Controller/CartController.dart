import 'package:flutter/material.dart';
import 'package:food_delivery_app/Models/CartModel.dart';
import 'package:food_delivery_app/Models/ProductModel.dart';
import 'package:food_delivery_app/Utils/Constants/MyColors.dart';
import 'package:food_delivery_app/Views/Cart/Repo/CartRepo.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  void addItems(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      int total = 0;
      _items.update(product.id!, (value) {
        total = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if (total <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar(
          'Items',
          'You should add items to the cart !',
          backgroundColor: MyColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    update();
  }

  bool existInItems(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getProductQuantityFromCart(ProductModel product) {
    int quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    int total = 0;
    _items.forEach((key, value) {
      total += value.quantity!;
    });

    return total;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) => e.value).toList();
  }
}
