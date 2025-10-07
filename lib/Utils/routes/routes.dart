import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/View/home_screen.dart';
import 'package:flutter_mvvm_architecture/View/login_screen.dart';
import 'package:flutter_mvvm_architecture/View/signup_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Text('No route defined')),
        );
    }
  }
}
