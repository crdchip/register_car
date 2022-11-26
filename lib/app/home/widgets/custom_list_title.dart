import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomListTitle extends StatefulWidget {
  const CustomListTitle({
    super.key,
    required this.Stt,
    required this.nameDriver,
    required this.numberPhone,
    required this.customer,
    required this.status,
    required this.image,
  });
  final String Stt;
  final String nameDriver;
  final String numberPhone;
  final String customer;
  final String status;
  final String image;

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: size.width,
        height: 60,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(widget.Stt),
                      ),
                    ),
                    const SizedBox(width: 15),
                    getImageBase64(widget.image),
                    // uploadImage(size, widget.image),
                    Expanded(
                        // flex: 1,
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(widget.nameDriver),
                        ),
                        Center(
                          child: Text(widget.numberPhone),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(widget.customer),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(widget.status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadImage(Size size, String image) {
    return Container(
      width: size.width,
      height: size.width * 0.2,
      // color: Colors.amberAccent,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: size.width * 0.2,
              width: size.width * 0.2,
              child: getImageBase64(image),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1.0),
                  // color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 24,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getImageBase64(String image) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.memory(
        bytes,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
