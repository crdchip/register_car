import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_list_driver_company/controller/history_list_driver_company_controller.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/history_list_driver_company_screen.dart';

class HistoryListDriverCompanyPage extends StatefulWidget {
  const HistoryListDriverCompanyPage({super.key});

  @override
  State<HistoryListDriverCompanyPage> createState() =>
      _HistoryListDriverCompanyPageState();
}

class _HistoryListDriverCompanyPageState
    extends State<HistoryListDriverCompanyPage> {
  final String routes = "/history_list_driver_company_page";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryListDriverCompanyController>(
      init: HistoryListDriverCompanyController(),
      builder: (context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("History FormIn Company"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ),
          body: const HistoryListDriverCompanyScreen(),
        ),
      ),
    );
  }
}
