import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;

    // Start navigation after building the widget
    controller.navigateToHome(context);

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LogoMahad3.png',
              width: screenHeight * .4,
              height: screenHeight * .2,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * .02),
          ],
        ),
      ),
    );
  }
}
