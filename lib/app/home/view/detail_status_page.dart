import 'package:flutter/material.dart';

class DetailStatusPage extends StatefulWidget {
  const DetailStatusPage({Key? key}) : super(key: key);

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        child: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
