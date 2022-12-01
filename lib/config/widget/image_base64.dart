import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageBase64 extends StatelessWidget {
  const ImageBase64({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.memory(
        bytes,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
