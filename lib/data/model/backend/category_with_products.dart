

import 'dart:convert';

import 'package:bidder/data/model/backend/product.dart';

class CategoryWithProducts {
  final int id;
  final String name;
  final List<Product> products;

  CategoryWithProducts({
    required this.id,
    required this.name,
    required this.products
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryWithProducts.fromMap(Map<String, dynamic> map) {
    return CategoryWithProducts(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryWithProducts.fromJson(String source) => CategoryWithProducts.fromMap(json.decode(source));
}
