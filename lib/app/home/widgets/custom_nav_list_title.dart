import 'package:flutter/material.dart';

class CustomNavListTitle extends StatefulWidget {
  const CustomNavListTitle(
      {super.key,
      required this.nameDriver,
      required this.customer,
      required this.status,
      required this.height});

  final String nameDriver;
  final String customer;
  final String status;
  final double height;

  @override
  State<CustomNavListTitle> createState() => _CustomNavListTitleState();
}

class _CustomNavListTitleState extends State<CustomNavListTitle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        color: Colors.amber,
        width: size.width,
        height: widget.height,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 25),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: Text(widget.nameDriver),
                  ),
                ],
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
