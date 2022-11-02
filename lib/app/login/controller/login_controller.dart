import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';

import 'package:register_driver_car/app/register/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' hide Response;

class LoginController extends GetxController {
  TextEditingController accountController =
      TextEditingController(text: "tiena");
  TextEditingController passController = TextEditingController(text: "tiena");

  Future<void> loginDrivers(
    String? username,
    String? password,
  ) async {
    Response response;
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
        print(response.data);
        Get.to(() => const DashBoardPage());
      }
    } catch (e) {
      print(e);
    }
  }
}
