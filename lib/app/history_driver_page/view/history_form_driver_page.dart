import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/history_driver_page/controller/history_driver_controller.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_driver_screen.dart';

class HistoryFormDriverPage extends StatefulWidget {
  const HistoryFormDriverPage({super.key});

  @override
  State<HistoryFormDriverPage> createState() => _HistoryFormDriverPageState();
}

class _HistoryFormDriverPageState extends State<HistoryFormDriverPage> {
  final String routes = "/history_driver_page";
  var historyDriverController = HistoryDriverController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDriverController>(
      init: HistoryDriverController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Get.back();
              },
            ),
            title: const Text(
              "History Driver Page",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            centerTitle: true,
          ),
          body: const HistoryFormDriverScreen(),
        ),
      ),
    );
  }
}
