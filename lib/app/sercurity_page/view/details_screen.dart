import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:intl/intl.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';

class DetailsSercurity extends StatefulWidget {
  const DetailsSercurity({super.key, this.dataform, this.tracking0});
  final Dataform? dataform;
  final Trackinglv0? tracking0;

  @override
  State<DetailsSercurity> createState() => _DetailsSercurityState();
}

class _DetailsSercurityState extends State<DetailsSercurity> {
  final String routes = "/detail_sercurity";

  var sercurityController = SercurityController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String dateTime = widget.dataform!.intendTime.toString();
    final day = DateFormat('yyyy-MM-dd ');
    final hour = DateFormat('hh:mm');
    return GetBuilder<DashBoardController>(
        init: DashBoardController(),
        builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("Details Page "),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
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
                          flex: 3,
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
                    buttonForm(size, () {
                      sercurityController.putTrackinglv1(widget.tracking0!.id);
                    })
                  ],
                ),
              ),
            )));
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
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 15,
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
                  fontSize: 18,
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
        color: CustomColor.colorButton,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          child: const Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
