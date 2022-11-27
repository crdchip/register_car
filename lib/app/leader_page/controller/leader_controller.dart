import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';

class LeaderController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<dynamic> getData() async {
    var dio = Dio();
    var token = await TokenApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    final url = '${AppConstants.urlBase}/Client/getuser';

    try {
      final response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        var userModel = response.data["data"];
        return userModel;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        return response.data;
      }
    } catch (error) {
      rethrow;
    }
  }
}
