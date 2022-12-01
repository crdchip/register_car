import 'package:flutter/material.dart';
import 'package:register_driver_car/app/history_driver_page/controller/history_driver_controller.dart';
import 'package:register_driver_car/app/history_driver_page/model/history_driver_model.dart';
import "package:get/get.dart";
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class HistoryFormDetailsScreen extends StatefulWidget {
  const HistoryFormDetailsScreen({super.key});

  @override
  State<HistoryFormDetailsScreen> createState() =>
      _HistoryFormDetailsScreenState();
}

class _HistoryFormDetailsScreenState extends State<HistoryFormDetailsScreen> {
  final String routes = "/history_form_details_screen";
  var agr = Get.arguments as ListFormDriver;
  @override
  void initState() {
    if (Get.arguments != null && Get.arguments is ListFormDriver) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String datetime = agr.intendTime.toString();
    //format ngày tháng năm
    final day = DateFormat("yyyy - MM - dd");
    //format giờ AM/PM
    final hour = DateFormat.jm();
    return GetBuilder<HistoryDriverController>(
      init: HistoryDriverController(),
      builder: (context) => SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Thông tin chi tiết"),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white.withOpacity(0.4),
                  )),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  textForm(size, "Company", "${agr.companyname}"),
                  textForm(size, "Tổ chức", "${agr.carfleedname}"),
                  textForm(size, "Xe", "${agr.transportname}"),
                  textForm(size, "Kho", "${agr.warehousename}"),
                  textForm(
                      size, "Ngày/tháng", day.format(DateTime.parse(datetime))),
                  textForm(
                      size, "Giờ vào", hour.format(DateTime.parse(datetime))),
                ],
              ),
            )),
      ),
    );
  }

  Widget textForm(Size size, String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.075, vertical: size.height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
