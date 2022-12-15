// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:register_driver_car/config/widget/image_base64.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orangeAccent.withOpacity(0.4),
              Colors.white.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.4, 0.8],
          ),
        ),
        width: size.width,
        height: 60,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20,
                    child: Center(
                      child: Text(widget.Stt),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ImageBase64(image: widget.image),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(widget.nameDriver,
                              style: const TextStyle(
                                  color: Colors.blueGrey, fontSize: 14)),
                        ),
                        Center(
                          child: Text(widget.numberPhone,
                              style: const TextStyle(
                                  color: Colors.blueGrey, fontSize: 14)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(widget.customer,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 14)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(widget.status,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadImage(Size size, String image) {
    return SizedBox(
      width: size.width,
      height: size.width * 0.2,
      // color: Colors.amberAccent,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              height: size.width * 0.2,
              width: size.width * 0.2,
              child: ImageBase64(
                image: image,
              ),
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
}
