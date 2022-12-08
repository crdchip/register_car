import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

class TallymanWorkingDetailsScreen extends StatefulWidget {
  const TallymanWorkingDetailsScreen({super.key});

  @override
  State<TallymanWorkingDetailsScreen> createState() =>
      _TallymanWorkingDetailsScreenState();
}

class _TallymanWorkingDetailsScreenState
    extends State<TallymanWorkingDetailsScreen> {
  final String routes = "/tallyman_working_details_screen";
  var tallymanController = Get.put(TallyManController());

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
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        title: const Text("Order Details"),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                        content: "${items.formIns!.clientInformation!.phone}",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        title: "Cửa",
                        content: "${items.formIns!.clientInformation!.phone}",
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomText(
                        title: "Lines",
                        content: "${items.formIns!.clientInformation!.phone}",
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
            child: SizedBox(
              // color: Colors.amber,
              height: 100,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        tallymanController.putTrackinglv4(items.id);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orangeAccent.withOpacity(0.8)),
                      ),
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(
                          color: Colors.blueGrey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
