import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static double averageRating(List<num> rating) {
    dynamic averageRating = 0;
    for (int i = 0; i < rating.length; i++) {
      averageRating = averageRating + rating[i];
    }
    return double.parse((averageRating / rating.length).toStringAsFixed(1));
  }

  static void fieldFocus(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static flutterToastErrorMessage(String message) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        titleColor: Colors.white,
        message: message,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [
          BoxShadow(
            color: Colors.blue.shade800,
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0,
          ),
        ],
        backgroundGradient: LinearGradient(
          colors: [Colors.purple, Colors.deepPurple],
        ),
        isDismissible: false,
        duration: Duration(seconds: 4),
        icon: Icon(Icons.error, color: Colors.redAccent),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
