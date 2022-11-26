import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class CustomerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDriverCompany();
    // print(getDriverCompany());
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
}
