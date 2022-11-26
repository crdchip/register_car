import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:register_driver_car/app/history_list_driver_company/model/history_list_driver_company_model.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class HistoryListDriverCompanyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getListFormCompany();
    print(getListFormCompany());
  }

  Future<List<ListFormCompany>> getListFormCompany() async {
    var dio = Dio();
    Response response;
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: " Bearer $token"
    };
    var url = "${AppConstants.urlBase}/dangtai/list/getforminbycompany";
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> listDriverCompany = response.data;

        return listDriverCompany
            .map((e) => ListFormCompany.fromJson(e))
            .toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
