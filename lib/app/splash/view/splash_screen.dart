import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (context) {
        return Image.asset("assets/images/logo@2x.png");
      },
    );
  }
}
