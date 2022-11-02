import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/status/model/lane_model.dart';

class StatusController extends GetxController {
  Future<List<LaneCar>> ReadDataLane() async {
    //read json file

    final jsondata = await rootBundle.loadString("assets/datas/ware_home.json");
    //decode json data as list

    Map<String, dynamic> map = json.decode(jsondata);
    List<dynamic> data = map["data"];

    //map json and initialize using DataModel
    return data.map((e) => LaneCar.fromJson(e)).toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
