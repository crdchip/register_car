import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/config/model/id/put_tracking2.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class HistoryTracking1Controller extends GetxController {
  Future<List<Trackinglv0>> getTrackinglv1() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "http://192.168.3.59:8000/tracking/Lv1";

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

  Future putTrackinglv2(int? lineid, int? strackingid) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var putTracking2 = PutTracking2(lineid: lineid, strackingid: strackingid);

    var jsonData = putTracking2.toJson();

    var url = "http://192.168.3.59:8000/tracking/lv2";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.COORDINATOR_PAGE);
    } else {
      print(response.statusCode);
    }
  }
}
