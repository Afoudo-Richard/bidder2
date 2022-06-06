import 'dart:convert';

import 'package:bidder/data/data_provider/bidder_api.dart';
import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/utils/errors/result_errors.dart';

class BidderRepository {
  final BidderApi bidderApi;

  BidderRepository({required this.bidderApi});

  // login to the system
  Future<Map> login({
    required String email,
    required String password,
  }) async {
    final rawloginResponse =
        await bidderApi.login(email: email, password: password);
    return rawloginResponse;
  }

  Future signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
  }) async {
    final rawSignUpResponse = await bidderApi.signUp(
      firstname: firstname,
      lastname: lastname,
      email: email,
      phone: phone,
      password: password,
    );
    return rawSignUpResponse;
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
