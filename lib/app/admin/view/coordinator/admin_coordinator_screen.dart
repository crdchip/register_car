import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';

import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';

class AdminCoordinatorScreen extends StatefulWidget {
  const AdminCoordinatorScreen({super.key});

  @override
  State<AdminCoordinatorScreen> createState() => _AdminCoordinatorScreenState();
}

class _AdminCoordinatorScreenState extends State<AdminCoordinatorScreen> {
  final bool _showAppbar = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
        init: AdminController(),
        builder: (controller) {
          return Stack(
            children: [
              FutureBuilder(
                future: controller.getTrackinglv1(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data as List<Tracking>;
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
                                  setState(
                                    () {
                                      Get.toNamed(
                                        Routes.ADMIN_COORDINATOR_DETAILS_SCREEN,
                                        arguments: items[index - 1],
                                      );
                                    },
                                  );
                                },
                                child: CustomListTitle(
                                  Stt: '${index - 1}',
                                  image:
                                      "${items[index - 1].formIns!.clientInformation!.imgdata}",
                                  nameDriver:
                                      '${items[index - 1].formIns!.clientInformation!.name}',
                                  numberPhone:
                                      '${items[index - 1].formIns!.clientInformation!.phone}',
                                  customer:
                                      '${items[index - 1].formIns!.clientInformation!.companyname}',
                                  status:
                                      '${items[index - 1].statustracking![0].name}',
                                ),
                              );
                      },
                    );
                  }
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.orangeAccent.withOpacity(0.4),
                  ));
                }),
              ),
              Positioned(
                top: -6,
                child: CustomNavListTitle(
                  height: _showAppbar ? 60 : 0,
                  nameDriver: "Tên tài xế",
                  customer: "Khánh Hàng",
                  status: "Trạng thái",
                ),
              )
            ],
          );
        });
  }
}
