import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:dio/dio.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/app/register/model/client.dart';
import 'package:register_driver_car/app/register/model/driver.dart';
import 'package:register_driver_car/app/register/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cccdController = TextEditingController();
  TextEditingController gplxController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController clientNameController = TextEditingController();
  TextEditingController faxController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController passclientController = TextEditingController();

  TextEditingController accountController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> createDrivers(
    String? firstName,
    String? lastName,
    String? cccd,
    String? gplx,
    String? phone,
    String? username,
    String? password,
  ) async {
    Response response;
    var dio = Dio();
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxIiwiZXhwIjoxNjY1ODE2NTY4fQ.S4TzqSqhvIfEh1aJ8XZQ3LCUAtETJWfcAwOc6m991Bw",
    };

    var drivers = Drivers(
      firstName: firstName,
      lastName: lastName,
      cccd: cccd,
      gplx: gplx,
      phone: phone,
      user: Users(
        username: username,
        password: password,
      ),
    );

    var jsonData = drivers.toJson();
    String url = "http://192.168.3.54:8000/driver/";
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: jsonData,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.data);
        Get.to(() => const LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createClients(
    String? clientName,
    String? fax,
    String? address,
    String? username,
    String? password,
  ) async {
    Response response;
    var dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString(AppConstants.KEY_ACCESS_TOKEN);

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    var drivers = Clients(
      clientName: clientName,
      fax: fax,
      address: address,
      user: Users(
        username: username,
        password: password,
      ),
    );

    var jsonData = drivers.toJson();
    String url = "http://192.168.3.54:8000/client/";
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: jsonData,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.data);
        Get.to(() => const LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
