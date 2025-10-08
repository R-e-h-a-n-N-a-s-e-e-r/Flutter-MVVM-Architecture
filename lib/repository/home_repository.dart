import 'dart:convert';

import 'package:flutter_mvvm_architecture/data/network/base_api_services.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_services.dart';
import 'package:flutter_mvvm_architecture/models/movies_model.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MoviesModel> movieApi() async {
    try {
      final response = await _apiServices.getGETResponse(
        AppUrl.moviesListEndPoint,
      );
      return MoviesModel.fromJson(response);
    } catch (e) {
      throw e.toString();
    }
  }
}
