import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:register_driver_car/app/profile/view/profile_page.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/image/image_api.dart';
import 'package:register_driver_car/config/model/token/token_api.dart';
import 'package:register_driver_car/config/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getUser();
  }

  getImageBase64() async {
    String image = await ImageApi().getImage();
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return Image.memory(
      bytes,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    );
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed("/login");
  }

  Future<dynamic> getUser() async {
    var token = await TokenApi().getToken();
    var jsonResponse;
    Response response;

    var dio = Dio();

    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
    };

    String url = "http://192.168.3.59:8000/Client/getuser";

    response = await dio.get(url, options: Options(headers: headers));
    // print(response.data);

    if (response.statusCode == 200) {
      var userModel = response.data['data']["client"];

      return userModel;
    } else {
      throw response.statusCode.toString();
    }
  }
}
