import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/details_screen.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

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
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (sercurityController) => Stack(
        children: [
          FutureBuilder(
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })),
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
