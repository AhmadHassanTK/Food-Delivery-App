import 'package:food_delivery_app/Models/ProductModel.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        img: json['img'] as String?,
        isExist: json['isExist'] as bool,
        quantity: json['quantity'] as int?,
        time: json['time'] as String?,
        product: ProductModel.fromJson(json['product']),
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'price': price,
  //       'img': img,
  //       'isExist': isExist,
  //       'quantity': quantity,
  //       'time': time,
  //       'product': ProductModel.
  //     };
}
