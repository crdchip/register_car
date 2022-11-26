import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import 'package:get/state_manager.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class SercurityController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getTracking();
  }

  Future<List<Trackinglv0>> getTracking() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "http://192.168.3.59:8000/tracking/Lv0";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        // print(
        // "tracing : ${tracking.map((e) => Trackinglv0.fromJson(e)).toList()}");
        return tracking.map((e) => Trackinglv0.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Trackinglv0>> getTracking4() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "http://192.168.3.59:8000/tracking/Lv4";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        // print(
        //     "tracing : ${tracking.map((e) => Trackinglv0.fromJson(e)).toList()}");
        return tracking.map((e) => Trackinglv0.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future putTrackinglv1(int? id) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    var idModel = IdModel(id: id);

    var jsonData = idModel.toJson();
    print(jsonData);

    const url = "http://192.168.3.59:8000/tracking/lv1";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print("oke");
      Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE);
    } else {
      print(response.statusCode);
    }
  }

  Future putTrackinglv5(int? id) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    var idModel = IdModel(id: id);

    var jsonData = idModel.toJson();
    // print(jsonData);

    const url = "http://192.168.3.59:8000/tracking/lv5";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print("oke");
      Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE);
    } else {
      print(response.statusCode);
    }
  }
}
