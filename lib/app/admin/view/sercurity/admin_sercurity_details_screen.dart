import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class AdminSercurityDetailsScreen extends StatefulWidget {
  const AdminSercurityDetailsScreen({super.key, this.dataform, this.tracking0});
  final Dataform? dataform;
  final Tracking? tracking0;

  @override
  State<AdminSercurityDetailsScreen> createState() =>
      _AdminSercurityDetailsScreenState();
}

class _AdminSercurityDetailsScreenState
    extends State<AdminSercurityDetailsScreen> {
  final String routes = "/admin_sercurity_details_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String dateTime = widget.dataform!.intendTime.toString();
    final day = DateFormat('yyyy-MM-dd ');
    final hour = DateFormat('hh:mm');
    return GetBuilder<AdminController>(
      init: AdminController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
          title: const Text(
            "Details Page ",
            style: TextStyle(color: Colors.blueGrey),
          ),
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: size.height * 1.1,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent.withOpacity(0.4),
                      Colors.white.withOpacity(0.4)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.4, 0.7],
                  ),
                ),
                child: Column(
                  children: [
                    textForm(
                        size,
                        "Đội xe",
                        widget.dataform!.carfleedId == "NN"
                            ? "Nhà nước"
                            : "Cá nhân"),
                    const SizedBox(height: 15),
                    textForm(
                        size,
                        "Loại xe",
                        widget.dataform!.transportId == "con"
                            ? "Container"
                            : "Car"),
                    textForm(
                        size, "Biến số xe", "${widget.dataform!.licensePlate}"),
                    const SizedBox(height: 15),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        textForm(size, "Ngày/tháng",
                            day.format(DateTime.parse(dateTime))),
                        textForm(size, "Ngày/tháng",
                            hour.format(DateTime.parse(dateTime))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    textForm(size, "Kho", "Kho 5"),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: textForm(size, "Sô công 1",
                              "${widget.dataform!.contNumber1}"),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              textForm(size, "Sô seal 1",
                                  "${widget.dataform!.cont1seal1}"),
                              textForm(size, "Sô seal 2",
                                  "${widget.dataform!.cont1seal2}"),
                              textForm(size, "Sô seal 3",
                                  "${widget.dataform!.cont1seal3}"),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: textForm(size, "Sô công 2",
                              "${widget.dataform!.contNumber2}"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              textForm(size, "Sô seal 1",
                                  "${widget.dataform!.cont2seal1}"),
                              textForm(size, "Sô seal 2",
                                  "${widget.dataform!.cont2seal2}"),
                              textForm(size, "Sô seal 3",
                                  "${widget.dataform!.cont2seal3}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: buttonForm(size, () {
                print(widget.tracking0!.id);
                controller.putTrackinglv1(widget.tracking0!.id);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget textForm(Size size, String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.blueGrey.withOpacity(0.8),
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
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonForm(Size size, VoidCallback onPressed) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.025),
      decoration: BoxDecoration(
        color: CustomColor.backgroundAppbar.withOpacity(0.8),
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: size.width,
      height: 60,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "Submit",
          style: TextStyle(
            color: Colors.blueGrey.withOpacity(0.8),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
