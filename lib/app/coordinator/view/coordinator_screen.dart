import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return GetBuilder<CoordinatorController>(
        init: CoordinatorController(),
        builder: (controller) {
          return Column(
            children: [
              _showAppbar
                  ? const SizedBox(
                      height: 60,
                      child: Center(
                        child: Text(
                          "Danh sách xe đợi vào lines",
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
                  future: controller.getTrackinglv1(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      var items = snapshot.data as List<Tracking>;

                      return ListView.builder(
                        controller: _scrollBottomBarController,
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(
                                () {
                                  Get.toNamed(
                                    "/coordinator_details_screen",
                                    arguments: items[index],
                                  );
                                },
                              );
                            },
                            child: CustomListTitle(
                              Stt: '${index + 1}',
                              image:
                                  "${items[index].formIns!.clientInformation!.imgdata}",
                              nameDriver:
                                  '${items[index].formIns!.clientInformation!.name}',
                              numberPhone:
                                  '${items[index].formIns!.clientInformation!.phone}',
                              customer:
                                  '${items[index].formIns!.clientInformation!.companyname}',
                              status: '${items[index].statustracking![0].name}',
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent.withOpacity(0.6),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        });
  }
}
