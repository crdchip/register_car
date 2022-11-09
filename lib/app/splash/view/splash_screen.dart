import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/app/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return controller.userStatus == false
            ? const LoginScreen()
            : DashBoardPage();
      },
    );
  }
}
