import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

class SercurityFinalDetailsScreen extends StatefulWidget {
  const SercurityFinalDetailsScreen({super.key});

  @override
  State<SercurityFinalDetailsScreen> createState() =>
      _SercurityFinalDetailsScreenState();
}

class _SercurityFinalDetailsScreenState
    extends State<SercurityFinalDetailsScreen> {
  var items = Get.arguments as Tracking;
  final String routes = "/sercurity_final_details_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text("Chi tiết xe "),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              height: 60,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.amber,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.orangeAccent.withOpacity(0.8)),
                  ),
                  onPressed: () {
                    setState(() {
                      controller.putTrackinglv5(items.id);
                    });
                  },
                  child: const Text(
                    "Xác nhận",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
