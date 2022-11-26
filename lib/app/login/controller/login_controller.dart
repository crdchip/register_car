import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:register_driver_car/app/login/model/login_user_token.dart';

import 'package:register_driver_car/app/register/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController accountController = TextEditingController(text: "son1");
  TextEditingController passController = TextEditingController(text: "son1");

  Future<void> loginDrivers(
    String? username,
    String? password,
  ) async {
    var jsonResponse;
    Response response;
    // Tokens tokens;
    UserToken dictData;
    UserToken tokens;
    Role role;
    var dio = Dio();
    var user = Users(
      username: username,
      password: password,
    );
    var jsonData = user.toJson();
    String url = "http://192.168.3.59:8000/login";
    try {
      response = await dio.post(
        url,
        data: jsonData,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        jsonResponse = response.data;
        tokens = UserToken.fromJson(jsonResponse);
        // khai báo SharePrefer
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // Lưu access_token vào  SharedPrefer
        var access_token = await prefs.setString(
            AppConstants.KEY_ACCESS_TOKEN, "${tokens.accessToken}");
        // Lưu roleName vào  SharedPrefer
        var roleName = await prefs.setString(
            AppConstants.ROLE, "${tokens.dictdata!.role!.roleName}");

        var username = tokens.dictdata!.client!.name;
        print(username);
        var roles = tokens.dictdata!.role!.roleName;
        //Chuyển page theo role
        print(roles);

        switch (roles) {
          case "Bảo vệ":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE),
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
          case "Leader hiện trường":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.LEADER_SCREEN),
            );
            break;
          case "tài xế":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(
                Routes.DRIVER_PAGE,
                arguments: username,
              ),
            );
            break;
          case "Tallyman":
            Future.delayed(
              const Duration(seconds: 1),
              () => Get.toNamed(Routes.TALLYMAN_PAGE),
            );
            break;
          default:
            print("Lỗi sai account");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  _showDialog(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text("Đăng nhập thất bại"),
      actions: [
        CupertinoDialogAction(
          child: Text("Oke"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
