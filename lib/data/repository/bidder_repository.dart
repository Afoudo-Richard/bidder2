import 'dart:convert';
import 'dart:io';

import 'package:bidder/data/data_provider/bidder_api.dart';
import 'package:bidder/data/model/backend/bidder.dart';
import 'package:bidder/data/model/backend/category.dart';
import 'package:bidder/data/model/backend/product.dart';
import 'package:bidder/data/model/backend/user.dart';
import 'package:bidder/utils/errors/result_errors.dart';
import 'package:image_picker/image_picker.dart';
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
    user
      ..set('phone', phone)
      ..set('firstname', firstname)
      ..set('lastname', lastname);

    var response = await user.signUp();

    return response;
  }

  Future<List<Category>> fetcheCategories() async {
    QueryBuilder<ParseObject> listOfCategories =
        QueryBuilder<ParseObject>(ParseObject('category'));
    final ParseResponse apiResponse = await listOfCategories.query();

    List<Category> categories = [
      Category(
        id: '0',
        name: "Select Category",
      ),
    ];

    if (apiResponse.success && apiResponse.results != null) {
      for (ParseObject item in apiResponse.result as List<ParseObject>) {
        Category category = Category(
          id: item.objectId ?? "",
          name: item.get("name"),
        );

        categories.add(category);
      }

      return categories;
    } else {
      return [];
    }
  }

  Future addItem(Map data) async {
    try {
      List<XFile> images = data['images'] as List<XFile>;

      List uploadedImageFiles = [];

      // images.forEach((image) async {
      //   ParseFileBase? parseFile = ParseFile(File(image.path));
      //   await parseFile.save();
      //   uploadedImageFiles.add(parseFile);
      // });

      for (var image in images) {
        ParseFileBase? parseFile = ParseFile(File(image.path));
        await parseFile.save();
        uploadedImageFiles.add(parseFile);
      }

      var profile = ParseObject('products');
      profile.set('price', data['productPrice']);
      profile.set('name', data['productName']);
      profile.set('description', data['productDescription']);
      profile.set('bidStartTime', DateTime.parse(data['bidStartTime']));
      profile.set('bidEndTime', DateTime.parse(data['bidEndTime']));
      profile.set(
          'category',
          (ParseObject('category')..objectId = data['category_id'])
              .toPointer());
      profile.set('user',
          (ParseObject('_User')..objectId = data['user_id']).toPointer());
      profile.set('images', uploadedImageFiles);

      await profile.save();
    } catch (e) {
      print(e);
    }
  }

  Future<List<Product>> fetchAllProducts() async {
    try {
      final QueryBuilder<ParseObject> parseQuery =
          QueryBuilder<ParseObject>(ParseObject('products'));
      parseQuery..includeObject(['category']);
      parseQuery..orderByDescending('createdAt');
      final apiResponse = await parseQuery.query();

      List<Product> products = [];

      if (apiResponse.success) {
        for (ParseObject item in apiResponse.result as List<ParseObject>) {
          final Product product = Product(
            id: item.objectId ?? "",
            productName: item.get('name'),
            productDescription: item.get('description'),
            productPrice: item.get('price'),
            dateCreated: item.createdAt ?? DateTime(2022),
            bidStartTime: item.get('bidStartTime').toString(),
            bidEndTime: item.get('bidEndTime').toString(),
            category: Category(
              id: item.get('category').objectId,
              name: item.get('category').get('name'),
            ),
            images: item.get('images'),
          );

          products.add(product);
        }
      }
      return products;
    } on ErrorSigningIn catch (e) {
      print(e.error);
    } catch (e) {
      print(e);
    }

    return <Product>[];
  }

  Future placeBid({
    required int price,
    required String productId,
    required String userId,
  }) async {
    var bidder = ParseObject('bidders');
    bidder.set(
        'product', (ParseObject('products')..objectId = productId).toPointer());
    bidder.set('bidder', (ParseObject('_User')..objectId = userId).toPointer());
    bidder.set('price', price);

    await bidder.save();
  }

  Future<List<Bidder>> fetchBidders({required String productId}) async {
    QueryBuilder<ParseObject> listOfBidders =
        QueryBuilder<ParseObject>(ParseObject('bidder'));
    listOfBidders..includeObject(['user']);
    listOfBidders
      ..whereEqualTo('product',
          (ParseObject('products')..objectId = productId).toPointer());

    final ParseResponse apiResponse = await listOfBidders.query();

    List<Bidder> listOfBidder = [];

    if (apiResponse.success && apiResponse.results != null) {
      print(apiResponse.result);
      for (ParseObject item in apiResponse.result as List<ParseObject>) {
        Bidder bidder = Bidder(
          id: item.objectId ?? "",
          price: item.get('price'),
          user: User(
            id: item.get('user').objectId,
            firstname: item.get('user').get('firstname'),
            lastname: item.get('user').get('lastname'),
            email: item.get('user').get('email'),
            phone: item.get('user').get('phone'),
            dateCreated: DateTime.parse(item.get('user').createdAt),
          ),
        );

        listOfBidder.add(bidder);
      }

      return listOfBidder;
    } else {
      return [];
    }
  }
}
