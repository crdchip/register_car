import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;

import 'package:register_driver_car/app/status/model/lane_model.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class CoordinatorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getStatusLine();
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

  Future<List<LaneCar>> ReadDataLane() async {
    //read json file
    final jsondata = await rootBundle.loadString("assets/datas/ware_home.json");
    //decode json data as list
    Map<String, dynamic> map = json.decode(jsondata);
    List<dynamic> data = map["data"];
    //map json and initialize using DataModel
    return data.map((e) => LaneCar.fromJson(e)).toList();
  }

  Future<List<WareHome>?> getStatusLine() async {
    var _dio = Dio();
    Response response;
    var urlApi = "http://192.168.3.59:8000/tracking/test";

    response = await _dio.get(urlApi);

    // print(response.statusCode);

    if (response.statusCode == 200) {
      // print(response.data['data']);
      Map<String, dynamic> map = response.data;
      List<dynamic> data = map["data"];

      return data.map((e) => WareHome.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
