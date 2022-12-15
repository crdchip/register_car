import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/form_button_bottom.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

class TallyManDetailsScreen extends StatefulWidget {
  const TallyManDetailsScreen({super.key});

  @override
  State<TallyManDetailsScreen> createState() => _TallyManDetailsScreenState();
}

class _TallyManDetailsScreenState extends State<TallyManDetailsScreen> {
  final String routes = "/tallyman_details_screen";
  var tallymanController = Get.put(TallyManController());
  bool checkStatus = false;

  var items = Get.arguments as Tracking;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Chi tiết phiếu đang đợi đơn hàng",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orangeAccent.withOpacity(0.4),
                  Colors.white.withOpacity(0.4)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.4, 0.7],
              ),
            ),
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: CustomText(
                        title: "Tên tài xê",
                        content: "${items.formIns!.clientInformation!.name}",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: CustomText(
                        title: "Tên công ty",
                        content:
                            "${items.formIns!.clientInformation!.companyname}",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: CustomText(
                        title: "Số điện thoại",
                        content: "${items.formIns!.clientInformation!.phone}",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        title: "Kho",
                        content: "${items.formIns!.dataform!.warehouse}",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        title: "Cửa",
                        content: "${items.lines!.gate}",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        title: "Lines",
                        content: "${items.lines!.name}",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ButtonFormBottom(
              onPressed: () {
                tallymanController.putTrackinglv3(items.id);
              },
              text: 'Xác nhận',
            ),
          ),
        ],
      ),
    );
  }
}
