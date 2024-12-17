import 'package:caf/settings/app_color.dart';
import 'package:flutter/material.dart';

class SnackbarScreen {
  static showSnackbarError(BuildContext context, String message) {
    // Create a SnackBar
    final snackBar = SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: AppColors.error, // You can customize the color
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MediaQuery.of(context).size.height / 2 - 25),
    );

    // Show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showSnackbarSuccess(BuildContext context, String message) {
    // Create a SnackBar
    final snackBar = SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontFamily: "Kantumruy"),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: AppColors.success, // You can customize the color
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: MediaQuery.of(context).size.height / 2 - 25),
    );

    // Show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
