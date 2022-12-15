import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/admin/admin_page.dart';

import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/driver/form_post_account.dart';
import 'package:register_driver_car/config/model/id/id_model.dart';
import 'package:register_driver_car/config/model/id/put_tracking2.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_status.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

import 'package:register_driver_car/config/routes/pages.dart';

class AdminController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
    getTracking();
    getTrackinglv1();
    getTrackinglv2();
    getTrackinglv3();
    getTrackinglv4();
    // getDriverCompany();
    getStatusLine();
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

  // driver

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
          print("Da dang ky");
        } else {
          Get.toNamed(
            Routes.ADMIN_DRIVER_DETAILS_PAGE,
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
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //sercurity
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
      Get.toNamed(Routes.ADMIN_PAGE);
      // var currentScreen = AdminSercurityScreen();
      // Get.to(() => const AdminPage());
      print("oke");
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
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

    const url = "${AppConstants.urlBase}/tracking/lv3";
    response =
        await dio.put(url, options: Options(headers: headers), data: jsonData);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      Get.toNamed(Routes.ADMIN_PAGE);

      print("oke");
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
      // Get.toNamed(Routes.DASHBOARD_SECURITY_PAGE);
      Get.to(() => AdminPage());
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
  //tracking

  Future<List<Tracking>> getTracking() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv0S";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv1() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv1S";

    try {
      response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv2() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv2S";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        // print(
        //     "tracing : ${tracking.map((e) => Trackinglv0.fromJson(e)).toList()}");
        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv3() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv3S";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        // print(
        //     "tracing : ${tracking.map((e) => Trackinglv0.fromJson(e)).toList()}");
        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv4() async {
    var _dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv4S";

    try {
      response = await _dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tracking>> getTrackinglv5() async {
    var _dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    const url = "${AppConstants.urlBase}/tracking/Lv5S";

    try {
      response = await _dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        return tracking.map((e) => Tracking.fromJson(e)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  //customer
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

  //coordinator
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
      Get.toNamed(Routes.ADMIN_PAGE);
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

  //tallyman
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
      Get.toNamed(Routes.ADMIN_PAGE);
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
