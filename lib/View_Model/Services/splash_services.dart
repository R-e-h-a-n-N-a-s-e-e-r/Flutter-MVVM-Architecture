import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/View_Model/userview_model.dart';
import 'package:flutter_mvvm_architecture/models/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value) async {
          if (value.token == 'null' || value.token == '') {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.login);
          } else {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.home);
          }
        })
        .catchError((error, stackTrace) {
          if (kDebugMode) {
            print(error);
          }
        });
  }
}
