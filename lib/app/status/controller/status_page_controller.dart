import 'dart:convert';
import "package:dio/dio.dart";

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/status/model/lane_model.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStatusLine();
    print(getStatusLine());
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

  Future<void> getStatusLine() async {
    var _dio = Dio();
    Response response;
    var urlApi = "http://192.168.3.59:8000/tracking/test";

    response = await _dio.get(urlApi);

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.data['data']);
      return response.data['data'];
    }
  }
}
