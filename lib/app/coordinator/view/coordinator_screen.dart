import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';

import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';

class CoordinatorScreen extends StatefulWidget {
  const CoordinatorScreen({super.key});

  @override
  State<CoordinatorScreen> createState() => _CoordinatorScreenState();
}

class _CoordinatorScreenState extends State<CoordinatorScreen> {
  final bool _showAppbar = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoordinatorController>(
        init: CoordinatorController(),
        builder: (controller) {
          return Stack(
            children: [
              FutureBuilder(
                future: controller.getTrackinglv1(),
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
                                  setState(
                                    () {
                                      Get.toNamed(
                                        "/coordinator_details_screen",
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
                ),
              )
            ],
          );
        });
  }
}
