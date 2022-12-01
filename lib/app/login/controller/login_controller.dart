import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:register_driver_car/app/login/model/login_user_token.dart';

import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/login/model/user.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController accountController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> loginDrivers(
    String? username,
    String? password,
  ) async {
    // ignore: prefer_typing_uninitialized_variables
    var jsonResponse;
    Response response;
    // Tokens tokens;

    UserToken tokens;
    var dio = Dio();
    var user = Users(
      username: username,
      password: password,
    );
    var jsonData = user.toJson();
    String url = "${AppConstants.urlBase}/login";
    try {
      response = await dio.post(
        url,
        data: jsonData,
      );

      if (response.statusCode == 200) {
        jsonResponse = response.data;
        tokens = UserToken.fromJson(jsonResponse);
        // khai báo SharePrefer
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // Lưu access_token vào  SharedPrefer
        // ignore: unused_local_variable
        var accessToken = await prefs.setString(
            AppConstants.KEY_ACCESS_TOKEN, "${tokens.accessToken}");
        // Lưu roleName vào  SharedPrefer
        // ignore: unused_local_variable
        var roleName = await prefs.setString(
            AppConstants.ROLE, "${tokens.dictdata!.role!.roleName}");

        var roles = tokens.dictdata!.role!.roleName;

        //Chuyển page theo role

        switch (roles) {
          case "Bảo vệ":
            Future.delayed(
              const Duration(seconds: 1),
              () {
                Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE,
                    arguments: tokens.dictdata);
              },
            );
            break;
          case "khách hàng":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.CUSTOMER_PAGE),
            );
            break;
          case "Điều phối":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.COORDINATOR_PAGE),
            );
            break;
          case "Leader":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.LEADER_SCREEN),
            );
            break;
          case "Tài xế":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(
                Routes.DRIVER_PAGE,
                arguments: tokens.dictdata!.client!.name,
              ),
            );
            break;
          case "Tallyman":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.TALLYMAN_PAGE),
            );
            break;
          case "admin":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.ADMIN_PAGE),
            );
            break;
          default:
            if (kDebugMode) {
              print("Lỗi sai account");
            }
        }
      } else if (response.statusCode == 401) {
        printError();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
