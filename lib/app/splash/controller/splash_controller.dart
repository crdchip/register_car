import 'dart:async';

import 'package:get/get.dart';

import 'package:register_driver_car/config/model/role/role_api.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class SplashController extends GetxController {
  bool userStatus = false;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () => checkUserStatus());
  }

  checkUserStatus() async {
    var token = await TokenApi().getToken();
    var role = await RoleApi().getRole();
    if (token != null) {
      if (role == "Bảo vệ") {
        print("true");
        Get.toNamed(Routes.DASHBOARD_SECURITY);
        print("true1");
      } else if (role == "khách hàng") {
        Get.toNamed(Routes.DASHBOARD);
      } else if (role == "Điều phối") {
        Get.toNamed(Routes.COORDINATOR_PAGE);
      } else if (role == "Leader hiện trường") {
        Get.toNamed(Routes.LEADER_SCREEN);
      }

      // checkPage();
    } else {
      userStatus = false;
      Get.toNamed(Routes.LOGIN);
    }
  }
}
