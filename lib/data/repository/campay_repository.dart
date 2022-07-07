import 'package:bidder/data/data_provider/campay_api.dart';

class CamPayRepository {
  final CamPayApi camPayApi;

  CamPayRepository({
    required this.camPayApi,
  });

  Future collectFund({
    required String phone,
    required String amount,
  }) async {
    var response = await camPayApi.collectPayment(phone: phone, amount: amount);
    print("Inside campay repo");
    print(response);
    // if (response.success) {
    //   return response.result;
    // } else {
    //   throw Exception("Error collecting fundeds");
    // }
  }
}
