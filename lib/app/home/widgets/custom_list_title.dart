import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomListTitle extends StatefulWidget {
  const CustomListTitle(
      {super.key,
      required this.Stt,
      required this.nameDriver,
      required this.numberPhone,
      required this.customer,
      required this.status});
  final String Stt;
  final String nameDriver;
  final String numberPhone;
  final String customer;
  final String status;

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
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
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
}
