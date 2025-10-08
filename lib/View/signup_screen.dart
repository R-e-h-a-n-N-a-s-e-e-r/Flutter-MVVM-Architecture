import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/Utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/Utils/utils.dart';
import 'package:flutter_mvvm_architecture/View_Model/authview_model.dart';
import 'package:flutter_mvvm_architecture/res/components/round_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    _isObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Sign Up Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height - kToolbarHeight, // avoids double height
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Email Field
                TextFormField(
                  controller: _emailController,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocus(context, emailFocus, passwordFocus);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.blue),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: _isObscure,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      focusNode: passwordFocus,
                      obscureText: value,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.blue,
                        ),
                        labelText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            _isObscure.value = !_isObscure.value;
                          },
                          child: Icon(
                            value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: height * 0.06),

                /// Sign Up Button
                RoundButton(
                  title: 'Sign Up',
                  loading: authViewModel.signUploading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage('Please enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                        'Please enter password',
                        context,
                      );
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                        'Password should be at least 6 characters',
                        context,
                      );
                    } else {
                      final data = {
                        'email': _emailController.text.trim(),
                        'password': _passwordController.text.trim(),
                      };
                      authViewModel.registerApi(data, context);
                      debugPrint('API hit successfully');
                    }
                  },
                ),

                SizedBox(height: height * 0.02),

                /// Login Navigation
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
