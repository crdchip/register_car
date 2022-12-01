import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;

import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class SercurityController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getTracking();
    await getData();
  }

  Future<dynamic> getData() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = '${AppConstants.urlBase}/Client/getuser';

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        var userModel = response.data["data"];
        return userModel;
      } else {
        return response.data;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Trackinglv0>> getTracking() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv0";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

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

    const url = "${AppConstants.urlBase}/tracking/Lv4";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

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

    const url = "${AppConstants.urlBase}/tracking/lv1";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
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

    const url = "${AppConstants.urlBase}/tracking/lv5";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
