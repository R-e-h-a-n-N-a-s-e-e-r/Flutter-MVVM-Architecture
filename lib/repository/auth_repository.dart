import 'package:flutter_mvvm_architecture/data/network/base_api_services.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_services.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response = await _apiServices.getPOSTResponse(
        AppUrl.loginUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      final response = await _apiServices.getPOSTResponse(
        AppUrl.registerUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
