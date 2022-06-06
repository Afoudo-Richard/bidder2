import 'dart:io';

import 'package:bidder/utils/errors/result_errors.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class BidderApi {
  final String baseUrl = 'http://10.0.2.2:5000';

  Uri getUrl({required String url, Map<String, String>? extraParameters}) {
    return Uri.parse('$baseUrl/${url.trim()}');
  }

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      final loginResponse = await http.post(
        getUrl(url: 'login'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(
          {
            "email": email,
            'password': password,
          },
        ),
      );

      if (loginResponse.statusCode == 200) {
        return json.decode(loginResponse.body);
      } else {
        throw ErrorLoggingIn("Error logging in");
      }
    } catch (e) {
      throw ErrorLoggingIn("Error logging in");
    }
  }

  Future signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final signUpresponse = await http.post(
        getUrl(url: 'users'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(
          {
            "firstname": firstname,
            "lastname": lastname,
            "email": email,
            "phone": phone,
            'password': password,
          },
        ),
      );

      if (signUpresponse.statusCode == 200) {
        return json.decode(signUpresponse.body);
      } else {
        throw ErrorSigningIn("Error signing in");
      }
    } catch (e) {
      throw ErrorSigningIn("Error signing in");
    }
  }

  Future addItem(Map data) async {
    try {
      final addItemResponse = await http.post(
        getUrl(url: 'products'),
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(
          data,
        ),
      );

      if (addItemResponse.statusCode == 200) {
        return json.decode(addItemResponse.body);
      } else {
        throw ErrorSigningIn("Error Adding product");
      }
    } catch (e) {
      throw ErrorSigningIn("Error Adding product");
    }
  }

  Future addItem3(Map data) async {
    print("Entered the third addItem");
    try {
      var request = http.MultipartRequest(
        "POST",
        getUrl(url: 'products'),
      )..fields.addAll(data['item-info']);

      data['images']?.forEach(
        (element) async {
          final file = await http.MultipartFile.fromPath('images', element.path,
              contentType: MediaType('image', 'jpeg'));
          request.files.add(file);
        },
      );
      print("I am currently here");
      // send data to the endpoint

      final send = await request.send();
      final response = await http.Response.fromStream(send);
      if (response.statusCode == 200) {
        //return respon
        print(response.body);
      } else {
        print(response.body);
        throw Exception(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // Future addItem2(Map data, List<XFile> images) async {
  //   print("entered add item 2 ......");
  //   try {
  //     http.MultipartRequest request = http.MultipartRequest(
  //       'POST',
  //       getUrl(url: 'products'),
  //     )..fields.addAll(data['item-info']);

  //     List<http.MultipartFile> newList = [];

  //     for (var img in images) {
  //       if (img != "") {
  //         var multipartFile = http.MultipartFile(
  //           'Photos',
  //           img.readAsBytes().asStream(),
  //           //File(img).path,
  //           filename: img.path.split('/').last,
  //         );
  //         newList.add(multipartFile);
  //       }
  //     }
  //     request.files.addAll(newList);

  //     // await http.MultipartFile.fromPath(
  //     //   'images',
  //     //   File('kitten1.jpg').path,
  //     //   contentType: MediaType('application', 'jpeg'),
  //     // ),

  //     http.StreamedResponse r = await request.send();
  //     print(r.statusCode);
  //     print(await r.stream.transform(utf8.decoder).join());
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future addItemWithDio(Map data) async {
    try {
      var arr = [];
      for (var img in data['images']) {
        arr.add(await Dio.MultipartFile.fromFile(img.path,
            filename: img.path.split('/').last));
      }
      Dio.FormData formData =
          new Dio.FormData.fromMap({...data['item-info'], "images": arr});

      var response = await Dio.Dio().post(
        "http://10.0.2.2:5000/products",
        data: data,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> fetchAllProducts() async {
    try {
      final productsResponse = await http.get(
        getUrl(url: 'products'),
        //headers: <String, String>{"Content-Type": "application/json"},
      );

      if (productsResponse.statusCode == 200) {
        //print(productsResponse.body);
        return json.decode(productsResponse.body);
      } else {
        print("What is going on with you");
        throw ErrorSigningIn("Error Fetching product adsf adsf asd fa");
      }
    } catch (e) {
      print(e);
      throw ErrorSigningIn("Error Fetching product");
    }
  }
}
