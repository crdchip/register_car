import 'package:flutter/material.dart';

class StatusScreens extends StatefulWidget {
  const StatusScreens({super.key});

  @override
  State<StatusScreens> createState() => _StatusScreensState();
}

class _StatusScreensState extends State<StatusScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Test Page"),
        ),
      ),
    );
  }
}
