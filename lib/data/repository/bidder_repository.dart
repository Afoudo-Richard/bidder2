import 'dart:convert';

import 'package:bidder/data/data_provider/bidder_api.dart';
import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/utils/errors/result_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BidderRepository {
  final BidderApi bidderApi;

  BidderRepository({required this.bidderApi});

  // login to the system
  Future login({
    required String email,
    required String password,
  }) async {
    final user = ParseUser(email, password, email);

    var response = await user.login();
    print(response);
    if (response.success) {
      return response.result;
    } else {
      throw ErrorSigningIn("Error logining in");
    }
  }

  Future signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
  }) async {
    final user =
        ParseUser.createUser(firstname + " " + lastname, password, email);

    var response = await user.signUp();

    return response;
  }

  Future addItem(Map data) async {
    final addItemResponse = await bidderApi.addItem3(data);
    return addItemResponse;
  }

  Future<List<Product>> fetchAllProducts() async {
    try {
      final fetchProductResponse = await bidderApi.fetchAllProducts();
      final parsedProducts = fetchProductResponse
          .map<Product>((item) => Product.fromJson(json.encode(item)))
          .toList();
      return parsedProducts;
    } on ErrorSigningIn catch (e) {
      print(e.error);
    } catch (e) {
      print(e);
    }

    return <Product>[];
  }
}
