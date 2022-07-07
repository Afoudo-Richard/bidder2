import 'package:http/http.dart' as http;
import 'dart:convert';

class CamPayApi {
  final String baseUrl = 'https://demo.campay.net/api';

  Uri getUrl({required String url, Map<String, String>? extraParameters}) {
    return Uri.parse('$baseUrl/${url.trim()}');
  }

  Future token() async {
    try {
      String username =
          "jK9t9wdAO3eR44qB-v1hcTR90hf1JrJ5oN7ak5sv33JdtYC3eVz8sikF3WO7k54RJzxAW61gQafA7A8jHP7j1Q";
      String password =
          "rCNZp5MfkQN8eWivicnXPGGa7-Kl1yfgCe6E8VBSUGbpCot66x6bLiGp10ThixpDcvVKJQU7dU_BI2T0TkaFcQ";

      String data_body = json.encode({
        "username": username,
        "password": password,
      });
      final tokenResponse = await http.post(
        getUrl(url: 'token/'),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        // body: '{"username":${username},"password":${password}}',
        body: data_body,
      );

      if (tokenResponse.statusCode == 200) {
        return json.decode(tokenResponse.body);
      }
    } catch (e) {}
  }

  Future collectPayment({
    required String phone,
    required String amount,
  }) async {
    try {
      final token = await this.token();
      print("Inside campay api");
      print(token);
      final collectResponse = await http.post(
        getUrl(url: 'collect'),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Token ${token['token']}"
        },
        body: json.encode(
          {
            "amount": "237${amount}",
            'from': phone,
            "description": "Making mobile money payment",
            "external_reference": "",
          },
        ),
      );

      if (collectResponse.statusCode == 200) {
        return json.decode(collectResponse.body);
      }
    } catch (e) {}
  }
}
