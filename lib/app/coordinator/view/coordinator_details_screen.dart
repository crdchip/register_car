import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/form_button_bottom.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

class CoordinatorDetailsScreen extends StatefulWidget {
  const CoordinatorDetailsScreen({super.key});

  @override
  State<CoordinatorDetailsScreen> createState() =>
      _CoordinatorDetailsScreenState();
}

class _CoordinatorDetailsScreenState extends State<CoordinatorDetailsScreen> {
  final String routes = "/coordinator_details_screen";
  var items = Get.arguments as Tracking;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Chi tiết thông tin phiếu",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: "Công ty",
                          content:
                              "${items.formIns!.clientInformation!.companyname}",
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          title: "Kho đăng ký",
                          content: "${items.formIns!.dataform!.warehouse}",
                        ),
                      ),
                    ],
                  ),
                  horizontalLine(size),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: "Tên tài xế",
                          content: "${items.formIns!.clientInformation!.name}",
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          title: "Số điện thoại",
                          content: "${items.formIns!.clientInformation!.phone}",
                        ),
                      ),
                    ],
                  ),
                  horizontalLine(size),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: "Đội xe",
                          content: "${items.formIns!.dataform!.carfleedId}",
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          title: "Loại xe",
                          content: "${items.formIns!.dataform!.transportId}",
                        ),
                      ),
                    ],
                  ),
                  items.formIns!.dataform!.contNumber1 != ""
                      ? horizontalLine(size)
                      : Container(),
                  items.formIns!.dataform!.contNumber1 != ""
                      ? Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomText(
                                title: "Số công 1",
                                content:
                                    "${items.formIns!.dataform!.contNumber1}",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  CustomText(
                                    title: "Số seal 1",
                                    content:
                                        "${items.formIns!.dataform!.cont1seal1}",
                                  ),
                                  CustomText(
                                    title: "Số seal 2",
                                    content:
                                        "${items.formIns!.dataform!.cont1seal2}",
                                  ),
                                  CustomText(
                                    title: "Số seal 3",
                                    content:
                                        "${items.formIns!.dataform!.cont1seal3}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  items.formIns!.dataform!.contNumber2 != ""
                      ? horizontalLine(size)
                      : Container(),
                  items.formIns!.dataform!.contNumber2 != ""
                      ? Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: CustomText(
                                title: "Số công 2",
                                content:
                                    "${items.formIns!.dataform!.contNumber2}",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  CustomText(
                                    title: "Số seal 1",
                                    content:
                                        "${items.formIns!.dataform!.cont2seal1}",
                                  ),
                                  CustomText(
                                    title: "Số seal 2",
                                    content:
                                        "${items.formIns!.dataform!.cont2seal2}",
                                  ),
                                  CustomText(
                                    title: "Số seal 3",
                                    content:
                                        "${items.formIns!.dataform!.cont2seal3}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ButtonFormBottom(
              onPressed: () {
                Get.toNamed(
                  Routes.STATUS_LINES_SCREEN,
                  arguments: items.id,
                );
              },
              text: "Chọn lines",
            ),
          )
        ],
      ),
    );
  }

  Widget horizontalLine(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        height: 5,
        indent: size.width * 0.05,
        endIndent: size.width * 0.05,
        color: Colors.black.withOpacity(0.1),
        thickness: 2,
      ),
    );
  }
}
