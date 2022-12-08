import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:register_driver_car/config/widget/form_button_bottom.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

class DetailsSercurity extends StatefulWidget {
  const DetailsSercurity({super.key, this.dataform, this.tracking0});
  final Dataform? dataform;
  final Tracking? tracking0;

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
    return GetBuilder<SercurityController>(
      init: SercurityController(),
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
            "Chi tiết phiếu",
            style: TextStyle(color: Colors.blueGrey),
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: size.height * 1.1,
                padding: const EdgeInsets.only(top: 10),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.orangeAccent.withOpacity(0.4),
                //       Colors.white.withOpacity(0.4)
                //     ],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     stops: const [0.4, 0.7],
                //   ),
                // ),
                child: Column(
                  children: [
                    CustomText(
                      title: "Đội xe",
                      content: widget.dataform!.carfleedId == "NN"
                          ? "Nhà nước"
                          : "Cá nhân",
                    ),
                    const SizedBox(height: 15),
                    CustomText(
                      title: "Đội xe",
                      content: widget.dataform!.transportId == "con"
                          ? "Container"
                          : "Xe tải",
                    ),
                    CustomText(
                        title: "Biển số xe",
                        content: "${widget.dataform!.licensePlate}"),
                    const SizedBox(height: 15),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.s,
                      children: [
                        CustomText(
                            title: "Ngày/tháng",
                            content: day.format(DateTime.parse(dateTime))),
                        CustomText(
                            title: "Giờ vào",
                            content: hour.format(DateTime.parse(dateTime))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const CustomText(title: "Kho", content: "5"),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomText(
                              title: "Số công 1",
                              content: "${widget.dataform!.contNumber1}"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              CustomText(
                                  title: "Số seal 1",
                                  content: "${widget.dataform!.cont1seal1}"),
                              CustomText(
                                  title: "Số seal 2",
                                  content: "${widget.dataform!.cont1seal2}"),
                              CustomText(
                                  title: "Số seal 3",
                                  content: "${widget.dataform!.cont1seal3}"),
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
                          child: CustomText(
                              title: "Số công 2",
                              content: "${widget.dataform!.contNumber2}"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              CustomText(
                                  title: "Số seal 1",
                                  content: "${widget.dataform!.cont2seal1}"),
                              CustomText(
                                  title: "Số seal 2",
                                  content: "${widget.dataform!.cont2seal2}"),
                              CustomText(
                                  title: "Số seal 3",
                                  content: "${widget.dataform!.cont2seal3}"),
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
              left: 0,
              right: 0,
              child: ButtonFormBottom(
                onPressed: () {
                  sercurityController.putTrackinglv1(widget.tracking0!.id);
                },
                text: 'Xác nhận',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
