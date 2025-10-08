import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';
import 'package:flutter_mvvm_architecture/View_Model/userview_model.dart';
import 'package:flutter_mvvm_architecture/models/user_model.dart';
import 'package:flutter_mvvm_architecture/repository/auth_repository.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  bool _signUploading = false;

  bool get signUploading => _signUploading;

  isLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  isSignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    isLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          Utils.flushBarErrorMessage('Login Successfully', context);
          final userPreferences = Provider.of<UserViewModel>(context,listen: false);
          userPreferences.saveUser(UserModel(token: value['token'].toString()));
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

  Future<void> registerApi(dynamic data, BuildContext context) async {
    isSignUpLoading(true);
    _myRepo
        .registerApi(data)
        .then((value) {
          Utils.flushBarErrorMessage('Register Successfully', context);

          if (kDebugMode) {
            print(value.toString());
          }
          isSignUpLoading(false);
          Navigator.pushNamed(context, RoutesName.home);
        })
        .catchError((error, stackTrace) {
          isSignUpLoading(false);
          Utils.flushBarErrorMessage(error.toString(), context);
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
