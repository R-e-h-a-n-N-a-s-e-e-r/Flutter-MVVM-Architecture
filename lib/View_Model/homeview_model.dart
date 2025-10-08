import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_architecture/data/response/api_response.dart';
import 'package:flutter_mvvm_architecture/models/movies_model.dart';
import 'package:flutter_mvvm_architecture/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<MoviesModel> movieList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo
        .movieApi()
        .then((value) {
          setMoviesList(ApiResponse.completed(value));
        })
        .catchError((error, stackTrace) {
          setMoviesList(ApiResponse.error(error.toString()));
        });
  }
}
