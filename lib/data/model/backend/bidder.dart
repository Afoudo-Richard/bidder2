import 'dart:convert';

import 'package:bidder/data/model/backend/category.dart';
import 'package:bidder/data/model/backend/user.dart';
import 'package:bidder/data/model/models.dart';

class Bidder {
  final String id;
  final User user;
  final int price;

  Bidder({
    required this.id,
    required this.user,
    required this.price,
  });
}
