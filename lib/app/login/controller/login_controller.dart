import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:register_driver_car/app/login/model/login_user_token.dart';

import 'package:register_driver_car/app/register/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/config/core/constants/constants.dart';

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

        // print(roleName);

        Get.toNamed("/dash_board",
            arguments: Client(
              name: tokens.dictdata!.client!.name,
              phone: tokens.dictdata!.client!.phone,
              email: tokens.dictdata!.client!.email,
              address: tokens.dictdata!.client!.address,
              dataimg: tokens.dictdata!.client!.dataimg,
            ));
      }
    } catch (e) {
      print(e);
    }
  }
}
