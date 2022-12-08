import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class AdminCoordinatorDetailsScreen extends StatefulWidget {
  const AdminCoordinatorDetailsScreen({super.key});

  @override
  State<AdminCoordinatorDetailsScreen> createState() =>
      _AdminCoordinatorDetailsScreenState();
}

class _AdminCoordinatorDetailsScreenState
    extends State<AdminCoordinatorDetailsScreen> {
  final String routes = "/admin_coordinator_details_screen";
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              textForm(size, "Công ty",
                  "${items.formIns!.clientInformation!.companyname}"),
              Row(
                children: [
                  Expanded(
                    child: textForm(size, "Tên tài xế",
                        "${items.formIns!.clientInformation!.name}"),
                  ),
                  Expanded(
                    child: textForm(size, "Điện thoại :",
                        "${items.formIns!.clientInformation!.phone}"),
                  ),
                ],
              ),
              textForm(
                  size, "Email", "${items.formIns!.clientInformation!.email}"),
              textForm(size, "Kho", "${items.formIns!.dataform!.warehouse}"),
              textForm(
                  size, "Đội xe", "${items.formIns!.dataform!.carfleedId}"),
              textForm(
                  size, "Loại xe", "${items.formIns!.dataform!.transportId}"),
              items.formIns!.dataform!.contNumber1 != ""
                  ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: textForm(size, "Số công 1",
                              "${items.formIns!.dataform!.contNumber1}"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              textForm(size, "Số công 1",
                                  "${items.formIns!.dataform!.cont1seal1}"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 2",
                                  "${items.formIns!.dataform!.cont1seal2}"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 3",
                                  "${items.formIns!.dataform!.cont1seal3}"),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              items.formIns!.dataform!.contNumber2 != ""
                  ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: textForm(size, "Số công 2",
                              "${items.formIns!.dataform!.contNumber2}"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              textForm(size, "Số công 1",
                                  "${items.formIns!.dataform!.cont2seal1}"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 2",
                                  "${items.formIns!.dataform!.cont2seal2}"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 3",
                                  "${items.formIns!.dataform!.cont2seal3}"),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              buttonForm(
                size,
                () {
                  Get.toNamed(
                    Routes.ADMIN_STATUS_LINES_SCREEN,
                    arguments: items.id,
                  );
                },
                "Select lines",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textForm(Size size, String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16,
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
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonForm(Size size, VoidCallback onPressed, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.025),
      decoration: BoxDecoration(
        color: Colors.orangeAccent.withOpacity(0.6),
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 60,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
