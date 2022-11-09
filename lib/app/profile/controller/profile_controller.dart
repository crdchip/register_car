import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/config/model/image/image_api.dart';

class ProfileController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  getImageBase64() async {
    String image = await ImageApi().getImage();
    print("imgae : $image");
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return Image.memory(
      bytes,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
    );
  }
}
