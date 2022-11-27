import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';
import 'package:register_driver_car/app/driver_page/view/driver_detail_page.dart';
import 'package:register_driver_car/app/home/models/form_post_account.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class DriverController extends GetxController {
  TextEditingController numberCar = TextEditingController();
  TextEditingController nameDriver = TextEditingController();

  TextEditingController carfleedId = TextEditingController();
  TextEditingController transportId = TextEditingController();
  TextEditingController licensePlate = TextEditingController();
  TextEditingController intendTime = TextEditingController();
  TextEditingController warehouse = TextEditingController();
  TextEditingController contNumber1 = TextEditingController();
  TextEditingController cont1seal1 = TextEditingController();
  TextEditingController cont1seal2 = TextEditingController();
  TextEditingController cont1seal3 = TextEditingController();
  TextEditingController contNumber2 = TextEditingController();
  TextEditingController cont2seal1 = TextEditingController();
  TextEditingController cont2seal2 = TextEditingController();
  TextEditingController cont2seal3 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<dynamic> getData() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    final url = '${AppConstants.urlBase}/Client/getuser';

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        var userModel = response.data["data"];
        return userModel;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        return response.data;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postRegisterCar(
    String carfleedId,
    int companyId,
    String transportId,
    String licensePlate,
    String intendTime,
    String warehouse,
    String contNumber1,
    String cont1seal1,
    String cont1seal2,
    String cont1seal3,
    String contNumber2,
    String cont2seal1,
    String cont2seal2,
    String cont2seal3,
  ) async {
    var token = await TokenApi().getToken();

    Response response;
    var _dio = Dio();
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var formRegister = FormRegisterCar(
      carfleedId: carfleedId,
      companyId: companyId,
      transportId: transportId,
      licensePlate: licensePlate,
      intendTime: intendTime,
      warehouse: warehouse,
      contNumber1: contNumber1,
      cont1seal1: cont1seal1,
      cont1seal2: cont1seal2,
      cont1seal3: cont1seal3,
      contNumber2: contNumber2,
      cont2seal1: cont2seal1,
      cont2seal2: cont2seal2,
      cont2seal3: cont2seal3,
      onlySeal: false,
      lockState: false,
    );
    var jsonData = formRegister.toJson();
    String url = "http://192.168.3.59:8000/dangtai/create_formin";
    try {
      response = await _dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: jsonData,
      );
      print(response.data);

      if (response.statusCode == 201) {
        print(response.statusCode);
        if (response.data["status_code"] == 204) {
          print("Đã đăng ký");
        } else {
          Get.to(() => const DriverDetailsPage());
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
