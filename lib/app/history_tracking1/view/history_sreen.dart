import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_tracking1/controller/history_tracking1_controller.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_details_screen.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class HistorySercurityScreen extends StatefulWidget {
  const HistorySercurityScreen({super.key, required this.arg});

  final String arg;

  @override
  State<HistorySercurityScreen> createState() => _HistorySercurityScreenState();
}

class _HistorySercurityScreenState extends State<HistorySercurityScreen> {
  bool _showAppbar = false;
  var historyTracking1Controller = Get.put(HistoryTracking1Controller());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var arg = ModalRoute.of(context)!.settings.arguments;
    return Stack(
      children: [
        FutureBuilder(
          future: historyTracking1Controller.getTrackinglv1(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<Trackinglv0>;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const CustomNavListTitle(
                          height: 60,
                          nameDriver: 'Tài xế',
                          customer: "Khánh Hàng",
                          status: "Trạng thái",
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              Get.to(() => HistoryDeatailSercurityScreen(
                                    dataform:
                                        items[index - 1].formIns!.dataform,
                                    tracking0: items[index - 1],
                                    linesId: int.parse(widget.arg),
                                  ));
                            });
                          },
                          child: CustomListTitle(
                            Stt: '$index',
                            image:
                                "${items[index - 1].formIns!.clientInformation!.imgdata}",
                            nameDriver:
                                '${items[index - 1].formIns!.clientInformation!.name}',
                            numberPhone:
                                '${items[index - 1].formIns!.clientInformation!.phone}',
                            customer:
                                '${items[index - 1].formIns!.clientInformation!.companyname}',
                            status:
                                '${items[index - 1].statustracking![1].name}',
                          ),
                        );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
        Positioned(
            top: -6,
            child: CustomNavListTitle(
              height: _showAppbar ? 60 : 0,
              nameDriver: "Tên tài xế",
              customer: "Khánh Hàng",
              status: "Trạng thái",
            ))
      ],
    );
  }
}
