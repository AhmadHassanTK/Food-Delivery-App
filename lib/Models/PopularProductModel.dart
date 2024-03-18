import 'ProductModel.dart';

class PopularProductModel {
  int? totalSize;
  int? typeId;
  int? offset;
  late List<ProductModel> products;
  List<ProductModel>? get productsList => products;
  PopularProductModel({
    required this.totalSize,
    required this.typeId,
    required this.offset,
    required this.products,
  });

  factory PopularProductModel.fromJson(Map<String, dynamic> json) {
    return PopularProductModel(
      totalSize: json['total_size'] as int?,
      typeId: json['type_id'] as int?,
      offset: json['offset'] as int?,
      products: (json['products'] as List<dynamic>?)!
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total_size': totalSize,
        'type_id': typeId,
        'offset': offset,
        'products': products.map((e) => e.toJson()).toList(),
      };
}
