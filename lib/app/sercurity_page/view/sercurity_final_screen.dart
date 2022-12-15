import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';

class SercurityFinalScreen extends StatefulWidget {
  const SercurityFinalScreen({super.key});

  @override
  State<SercurityFinalScreen> createState() => _SercurityFinalScreenState();
}

class _SercurityFinalScreenState extends State<SercurityFinalScreen> {
  final String routes = "/sercurity_final_screen";
  bool _showAppbar = true;
  final ScrollController _scrollBottomBarController = new ScrollController();
  bool isScrollingDown = false;
  bool _show = true;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {
            print("oke");
            _show = true;
          });
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {
            _show = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (controller) {
        return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.orangeAccent.withOpacity(0.4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 0.7],
              ),
            ),
            child: Column(
              children: [
                _showAppbar
                    ? const SizedBox(
                        height: 60,
                        child: Center(
                          child: Text(
                            "Danh sách xe ra cổng",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const CustomNavListTitle(
                  nameDriver: "Tài xế",
                  customer: "Khách hàng",
                  status: "Trạng thái",
                  height: 60,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: controller.getTracking4(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data as List<Tracking>;
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: ((context, index) {
                            var lenghtTracking =
                                items[index].statustracking!.length - 1;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  Get.toNamed(
                                      Routes.SERCURITY_FINAL_DETAILS_SCREEN,
                                      arguments: items[index]);
                                });
                              },
                              child: CustomListTitle(
                                Stt: "${index + 1}",
                                nameDriver:
                                    "${items[index].formIns!.clientInformation!.name}",
                                numberPhone:
                                    "${items[index].formIns!.clientInformation!.phone}",
                                customer:
                                    "${items[index].formIns!.clientInformation!.companyname}",
                                status:
                                    "${items[index].statustracking![lenghtTracking].name}",
                                image:
                                    "${items[index].formIns!.clientInformation!.imgdata}",
                              ),
                            );
                          }),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                            color: Colors.orangeAccent),
                      );
                    }),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
