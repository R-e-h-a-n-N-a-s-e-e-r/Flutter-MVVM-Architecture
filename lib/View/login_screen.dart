import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';
import 'package:flutter_mvvm_architecture/View_Model/authview_model.dart';
import 'package:flutter_mvvm_architecture/res/components/round_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _isObscure.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Login Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocus,
              onFieldSubmitted: (value) {
                Utils.fieldFocus(context, emailFocus, passwordFocus);
              },
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),
                label: Text('Email'),
              ),
              controller: _emailController,
            ),
            ValueListenableBuilder(
              valueListenable: _isObscure,
              builder: (context, value, child) {
                return TextFormField(
                  focusNode: passwordFocus,
                  obscureText: _isObscure.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.blue),
                    label: Text('Password'),
                    suffixIcon: InkWell(
                      onTap: () {
                        _isObscure.value = !_isObscure.value;
                      },
                      child: _isObscure.value
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility),
                    ),
                  ),
                  controller: _passwordController,
                );
              },
            ),
            SizedBox(height: height * 0.1),
            RoundButton(
              title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter Password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                    'Password should be at least 6 digits',
                    context,
                  );
                } else {
                  Map data = {
                    'email': _emailController.text,
                    'password': _passwordController.text,
                  };
                  authViewModel.loginApi(data, context);
                  print('Api hit successfully');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
