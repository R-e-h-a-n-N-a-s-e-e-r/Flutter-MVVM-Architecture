import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Login Screen')),
      body: InkWell(
        onTap: () {
          // Utils.flushBarErrorMessage('no internet Connection',context);
          //  Utils.flutterToastErrorMessage('no internet Connection');
          Utils.snackBar('no internet Connection',context);
        },

        child: Center(child: Text('Press')),
      ),
    );
  }
}
