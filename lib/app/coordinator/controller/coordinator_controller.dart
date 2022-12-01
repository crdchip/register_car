import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/id/put_tracking2.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class CoordinatorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTrackinglv1();
    getStatusLine();
    getData();
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

  Future<List<WareHome>?> getStatusLine() async {
    var dio = Dio();
    Response response;
    var urlApi = "${AppConstants.urlBase}/tracking/test";

    response = await dio.get(urlApi);

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

  Future<List<Trackinglv0>> getTrackinglv1() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv1";

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

  // Future<List<Trackinglv0>> getTrackinglv1() async {
  //   var dio = Dio();
  //   Response response;
  //   var token = await TokenApi().getToken();
  //   Map<String, dynamic> headers = {
  //     HttpHeaders.authorizationHeader: "Bearer $token"
  //   };

  //   const url = "${AppConstants.urlBase}/tracking/Lv1S";

  //   try {
  //     response = await dio.get(url, options: Options(headers: headers));
  //     // print(response.data);
  //     if (response.statusCode == 200) {
  //       List<dynamic> tracking = response.data;

  //       // print(
  //       //     "tracing : ${tracking.map((e) => Trackinglv0.fromJson(e)).toList()}");
  //       return tracking.map((e) => Trackinglv0.fromJson(e)).toList();
  //     } else {
  //       return response.data;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future putTrackinglv2(int? lineid, int? strackingid) async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var putTracking2 = PutTracking2(lineid: lineid, strackingid: strackingid);

    var jsonData = putTracking2.toJson();

    var url = "${AppConstants.urlBase}/tracking/lv2";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.COORDINATOR_PAGE);
    }
  }
}
