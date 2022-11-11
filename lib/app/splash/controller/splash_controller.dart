import 'dart:async';

import 'package:get/get.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class SplashController extends GetxController {
  bool userStatus = false;

  @override
  void onInit() async {
    super.onInit();
    checkUserStatus();
  }

  checkUserStatus() async {
    var token = await TokenApi().getToken();
    if (token != null) {
      userStatus = true;
      Timer(
        const Duration(seconds: 1),
        () => Get.toNamed("/dash_board"),
      );
    } else {
      userStatus = false;
      Timer(
        const Duration(seconds: 1),
        () => Get.toNamed("/login"),
      );
    }
  }
}
