import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/details_screen.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';

class DashBoardSercurityScreen extends StatefulWidget {
  const DashBoardSercurityScreen({super.key});

  @override
  State<DashBoardSercurityScreen> createState() =>
      _DashBoardSercurityScreenState();
}

class _DashBoardSercurityScreenState extends State<DashBoardSercurityScreen> {
  final String routes = "/dash_board_security_screen";
  var sercurityController = Get.put(SercurityController());

  bool showSearch = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (sercurityController) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.3, 0.8],
              ),
            ),
            child: FutureBuilder(
              future: sercurityController.getTracking(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<Trackinglv0>;
                  return ListView.builder(
                    itemCount: items.length + 1,
                    itemBuilder: ((context, index) {
                      return index == 0
                          ? const CustomNavListTitle(
                              nameDriver: "Tài xế",
                              customer: "Khách hàng",
                              status: "Trạng thái",
                              height: 60,
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  Get.to(
                                    () => DetailsSercurity(
                                      dataform:
                                          items[index - 1].formIns!.dataform,
                                      tracking0: items[index - 1],
                                    ),
                                  );
                                });
                              },
                              child: CustomListTitle(
                                Stt: "$index",
                                nameDriver:
                                    "${items[index - 1].formIns!.clientInformation!.name}",
                                numberPhone:
                                    "${items[index - 1].formIns!.clientInformation!.phone}",
                                customer:
                                    "${items[index - 1].formIns!.clientInformation!.companyname}",
                                status:
                                    "${items[index - 1].statustracking![0].name}",
                                image:
                                    "${items[index - 1].formIns!.clientInformation!.imgdata}",
                              ),
                            );
                    }),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent.withOpacity(0.4),
                  ),
                );
              }),
            ),
          ),
          const Positioned(
            child: CustomNavListTitle(
              height: 60,
              nameDriver: "Tài xế",
              customer: "Khách hàng",
              status: "Trạng thái",
            ),
          )
        ],
      ),
    );
  }
}
