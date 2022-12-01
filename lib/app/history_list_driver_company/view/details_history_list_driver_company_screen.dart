import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_list_driver_company/controller/history_list_driver_company_controller.dart';
import 'package:register_driver_car/app/history_list_driver_company/model/history_list_driver_company_model.dart';

class DetailsHistoryListDriverCompanyScreen extends StatefulWidget {
  const DetailsHistoryListDriverCompanyScreen({super.key});

  @override
  State<DetailsHistoryListDriverCompanyScreen> createState() =>
      _DetailsHistoryListDriverCompanyScreenState();
}

class _DetailsHistoryListDriverCompanyScreenState
    extends State<DetailsHistoryListDriverCompanyScreen> {
  final String routes = "/details_history_list_driver_company_screen";
  @override
  void initState() {
    super.initState();
    if (Get.arguments != null && Get.arguments is ListFormCompany) {
      if (kDebugMode) {
        print("oke");
      }
    }
    if (kDebugMode) {
      print("object");
    }
  }

  var items = Get.arguments as ListFormCompany;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryListDriverCompanyController>(
      builder: (context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          title: const Text("Chi tiết phiếu vào"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("${items.clientInformation!.imgname}"),
        ),
      ),
    );
  }
}
