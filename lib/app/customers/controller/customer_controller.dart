import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;

import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_status.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class CustomerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDriverCompany();
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

  Future<List<ListDriverCompanyModel>> getDriverCompany() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Response response;

    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/dangtai/getdriverincompany";
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> driverCompany = response.data;
        // print(driverCompany);
        return driverCompany
            .map((e) => ListDriverCompanyModel.fromJson(e))
            .toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Trackinglv0>> getTrackinglv0() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Response response;

    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv0";
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> driverCompany = response.data;
        // print(driverCompany);
        return driverCompany.map((e) => Trackinglv0.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Trackinglv0>> getTrackinglv1() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Response response;

    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv1";
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> driverCompany = response.data;
        // print(driverCompany);
        return driverCompany.map((e) => Trackinglv0.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> postStatus(int id) async {
  //   Response response;
  //   var dio = Dio();
  //   Statustracking statustracking;
  //   var token = await TokenApi().getToken();
  //   var jsonResponse;
  //   Map<String, String> headers = {
  //     HttpHeaders.authorizationHeader: "Bearer $token",
  //   };
  //   var idModel = IdModel(id: id);
  //   var jsonData = idModel.toJson();
  //   String url = "${AppConstants.urlBase}/Client/getdriverbyid/";
  //   try {
  //     response = await dio.post(
  //       url,
  //       options: Options(headers: headers),
  //       data: jsonData,
  //     );
  //     if (response.statusCode == 200) {
  //       jsonResponse = response.data;
  //       print(jsonResponse);
  //       var tracking = Trackinglv0.fromJson(jsonResponse);
  //       print("tracking: $tracking");
  //       // var tracking = statustracking.name;
  //       Get.toNamed("/details_list_driver", arguments: tracking);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> postStatusS(int id) async {
    Response response;
    var dio = Dio();

    var token = await TokenApi().getToken();
    // ignore: prefer_typing_uninitialized_variables
    var jsonResponse;
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var idModel = IdModel(id: id);
    var jsonData = idModel.toJson();
    String url = "${AppConstants.urlBase}/Client/getdriverbyid/";
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == 200) {
        jsonResponse = response.data;
        if (kDebugMode) {
          print(jsonResponse);
        }
        var tracking = TrackingStatus.fromJson(jsonResponse);

        Get.toNamed("/details_list_driver", arguments: tracking);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
