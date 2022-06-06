import 'dart:convert';

import 'package:bidder/data/model/backend/category.dart';
import 'package:bidder/data/model/backend/user.dart';

class Product {
  final int id;
  final String productName;
  final String productDescription;
  final int productPrice;
  final DateTime dateCreated;
  final String bidStartTime;
  final String bidEndTime;
  final Category category;
  final List<User> usersbidded;

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.dateCreated,
    required this.bidStartTime,
    required this.bidEndTime,
    required this.category,
    required this.usersbidded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'dateCreated': dateCreated.toString(),
      'bidStartTime': bidStartTime,
      'bidEndTime': bidEndTime,
      'category': category.toMap(),
      'usersbidded': usersbidded.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      productName: map['productName'] ?? '',
      productDescription: map['productDescription'] ?? '',
      productPrice: map['productPrice']?.toInt() ?? 0,
      //dateCreated: DateTime.parse(map['dateCreated']),
      dateCreated: DateTime.now(),
      bidStartTime: map['bidStartTime'] ?? '',
      bidEndTime: map['bidEndTime'] ?? '',
      category: Category.fromMap(map['category']),
      usersbidded:
          List<User>.from(map['usersbidded']?.map((x) => User.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
