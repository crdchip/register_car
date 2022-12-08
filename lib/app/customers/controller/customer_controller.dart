import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:register_driver_car/app/customers/model/list_form_register_model.dart';
import 'package:register_driver_car/app/driver_page/model/list_form_driver_model.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/driver/form_post_account.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_status.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class CustomerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDriverCompany();
    getData();
  }

  TextEditingController numberCar = TextEditingController();
  TextEditingController nameDriver = TextEditingController();

  TextEditingController carfleedId = TextEditingController();
  TextEditingController transportId = TextEditingController();
  TextEditingController licensePlate = TextEditingController();
  TextEditingController intendTime = TextEditingController();
  TextEditingController warehouse = TextEditingController();
  TextEditingController contNumber1 = TextEditingController();
  TextEditingController cont1seal1 = TextEditingController();
  TextEditingController cont1seal2 = TextEditingController();
  TextEditingController cont1seal3 = TextEditingController();
  TextEditingController contNumber2 = TextEditingController();
  TextEditingController cont2seal1 = TextEditingController();
  TextEditingController cont2seal2 = TextEditingController();
  TextEditingController cont2seal3 = TextEditingController();

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

  Future<List<Tracking>> getTrackinglv0() async {
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
        return driverCompany.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv1() async {
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
        return driverCompany.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postRegisterCar(
    String carfleedId,
    int companyId,
    String transportId,
    String licensePlate,
    String intendTime,
    String warehouse,
    String contNumber1,
    String cont1seal1,
    String cont1seal2,
    String cont1seal3,
    String contNumber2,
    String cont2seal1,
    String cont2seal2,
    String cont2seal3,
  ) async {
    var token = await TokenApi().getToken();

    Response response;
    var _dio = Dio();
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var formRegister = FormRegisterCar(
      carfleedId: carfleedId,
      companyId: companyId,
      transportId: transportId,
      licensePlate: licensePlate,
      intendTime: intendTime,
      warehouse: warehouse,
      contNumber1: contNumber1,
      cont1seal1: cont1seal1,
      cont1seal2: cont1seal2,
      cont1seal3: cont1seal3,
      contNumber2: contNumber2,
      cont2seal1: cont2seal1,
      cont2seal2: cont2seal2,
      cont2seal3: cont2seal3,
      onlySeal: false,
      lockState: false,
    );
    var jsonData = formRegister.toJson();
    String url = "${AppConstants.urlBase}/dangtai/create_formin";
    try {
      response = await _dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: jsonData,
      );

      if (response.statusCode == 201) {
        print("oke");
        if (response.data["status_code"] == 204) {
          var detail = response.data["detail"];
          print(detail);
          Get.defaultDialog(
            title: "Thông báo",
            middleText: "Khách hàng đã đăng ký",
            textConfirm: "Oke",
            confirmTextColor: Colors.white,
            backgroundColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
            buttonColor: Colors.orangeAccent.withOpacity(0.4),
          );

          print("Da dang ky");
        } else {
          Get.toNamed(
            Routes.DETAILS_FORM_REGISTER_SCREEN,
            arguments: FormRegisterCar(
              carfleedId: carfleedId,
              companyId: companyId,
              transportId: transportId,
              licensePlate: licensePlate,
              intendTime: intendTime,
              warehouse: warehouse,
              contNumber1: contNumber1,
              cont1seal1: cont1seal1,
              cont1seal2: cont1seal2,
              cont1seal3: cont1seal3,
              contNumber2: contNumber2,
              cont2seal1: cont2seal1,
              cont2seal2: cont2seal2,
              cont2seal3: cont2seal3,
              onlySeal: false,
              lockState: false,
            ),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<ListFormRegisterModel>> getListFormRegister() async {
    Response response;
    var _dio = Dio();
    var token = await TokenApi().getToken();
    var jsonResponse;
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = "${AppConstants.urlBase}/dangtai/list/getforminbycompany";
    try {
      response = await _dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = response.data;

        return jsonResponse
            .map((e) => ListFormRegisterModel.fromJson(e))
            .toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

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
          // print(jsonResponse);
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
