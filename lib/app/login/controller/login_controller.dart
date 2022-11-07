import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';

import 'package:register_driver_car/app/register/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token.dart';
import 'package:register_driver_car/config/model/token/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController accountController =
      TextEditingController(text: "tiena");
  TextEditingController passController = TextEditingController(text: "tiena");

  Future<void> loginDrivers(
    String? username,
    String? password,
  ) async {
    var jsonResponse;
    Response response;
    Tokens tokens;
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
        tokens = Tokens.fromJson(jsonResponse);
        // print(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        var access_token = await prefs.setString(
            AppConstants.KEY_ACCESS_TOKEN, "${tokens.access_token}");

        // var token = prefs.getString(AppConstants.KEY_ACCESS_TOKEN);
        // // print(tokens.access_token);
        // print(token);
        Get.to(() => const DashBoardPage());
      }
    } catch (e) {
      print(e);
    }
  }
}
