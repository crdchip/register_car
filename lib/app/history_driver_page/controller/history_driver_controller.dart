import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/history_driver_page/model/history_driver_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class HistoryDriverController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getListFormDriver();
  }

  Future<List<ListFormDriver>> getListFormDriver() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: " Bearer $token"
    };

    const url = "http://192.168.3.59:8000/dangtai/list/getformindriver";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> history = response.data;

        return history.map((e) => ListFormDriver.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
