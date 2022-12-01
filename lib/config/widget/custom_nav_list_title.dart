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
        height: widget.height,
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(widget.nameDriver,
                          style: const TextStyle(
                              color: Colors.blueGrey, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.customer,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  widget.status,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
