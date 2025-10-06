import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';
import 'package:flutter_mvvm_architecture/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  isLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    isLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          Utils.flushBarErrorMessage('Login Successfully', context);

          if (kDebugMode) {
            print(value.toString());
          }
          isLoading(false);
          Navigator.pushNamed(context, RoutesName.home);
        })
        .onError((error, stackTrace) {
          isLoading(false);
          Utils.flushBarErrorMessage(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
