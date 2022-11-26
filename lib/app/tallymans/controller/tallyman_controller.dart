import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class TallyManController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTrackinglv2();
    getTrackinglv3();
  }

  Future<List<Trackinglv0>> getTrackinglv2() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv2";

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

  Future<List<Trackinglv0>> getTrackinglv3() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv3";

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

  Future<List<Trackinglv0>> getTrackinglv4() async {
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

  Future putTrackinglv3(int? id) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var idModel = IdModel(id: id);

    var jsonData = idModel.toJson();

    var url = "${AppConstants.urlBase}/tracking/lv3";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    if (response.statusCode == 200) {
      print("TallyMan : Oke");
      Get.toNamed(Routes.TALLYMAN_PAGE);
    } else {
      print(response.statusCode);
    }
  }

  Future putTrackinglv4(int? id) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var idModel = IdModel(id: id);

    var jsonData = idModel.toJson();

    var url = "${AppConstants.urlBase}/tracking/lv4";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    if (response.statusCode == 200) {
      print("TallyMan : Đã xog");
      // Get.toNamed(Routes.TALLYMAN_PAGE);
      // var currentScreen = TallymanWorkingScreen();
      Get.back();
    } else {
      print(response.statusCode);
    }
  }
}
