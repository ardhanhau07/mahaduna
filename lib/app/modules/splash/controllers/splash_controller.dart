import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart'; // Import Routes

class SplashController extends GetxController {
  // Method to handle navigation
  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.ONBOARDING);
    });
  }
}
