import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_driver_page/controller/history_driver_controller.dart';
import 'package:register_driver_car/app/history_driver_page/model/history_driver_model.dart';
import 'package:intl/intl.dart';

class HistoryFormDriverScreen extends StatefulWidget {
  const HistoryFormDriverScreen({super.key});

  @override
  State<HistoryFormDriverScreen> createState() =>
      _HistoryFormDriverScreenState();
}

class _HistoryFormDriverScreenState extends State<HistoryFormDriverScreen> {
  var historyDriverController = HistoryDriverController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryDriverController>(
      init: HistoryDriverController(),
      builder: (context) => SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: historyDriverController.getListFormDriver(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<ListFormDriver>;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    String dateTime = items[index].intendTime.toString();
                    final day = DateFormat("yyyy-MM-dd");
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Get.toNamed("/history_form_details_screen",
                              arguments: items[index]);
                        });
                      },
                      child: ListTile(
                        leading: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text("$index")),
                        title: Text("${items[index].companyname}"),
                        subtitle:
                            Text("${day.format((DateTime.parse(dateTime)))}"),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
