import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/driver_page/driver_page.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/driver/form_post_account.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DriverDetailsPage extends StatefulWidget {
  const DriverDetailsPage({super.key});

  @override
  State<DriverDetailsPage> createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  final String routes = "/driver_details_page";
  bool checkCont2 = false;
  @override
  void initState() {
    if (Get.arguments != null && Get.arguments is FormRegisterCar) {
      if (kDebugMode) {
        print("oke");
      }
    }
    super.initState();
  }

  var items = Get.arguments as FormRegisterCar;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dateTime = items.intendTime.toString();
    final day = DateFormat("yyyy - MM - dd");
    final hour = DateFormat.jm();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Thông tin đã đăng ký"),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const DriverPage());
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.orangeAccent.withOpacity(0.4),
              Colors.white.withOpacity(0.4)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.4, 0.7],
          )),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomText(
                          title: "Đội xe", content: "${items.carfleedId}")),
                  Expanded(
                      child: CustomText(
                          title: "Đội xe", content: "${items.companyId}")),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        title: "Loại xe", content: "${items.transportId}"),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        CustomText(title: "Kho", content: "${items.warehouse}"),
                  ),
                ],
              ),
              items.contNumber1 != ""
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomText(
                                title: "Số công 1",
                                content: "${items.contNumber1}"),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                CustomText(
                                    title: "Số seal 1",
                                    content: "${items.cont1seal1}"),
                                const SizedBox(height: 10),
                                CustomText(
                                    title: "Số seal 2",
                                    content: "${items.cont1seal2}"),
                                const SizedBox(height: 10),
                                CustomText(
                                    title: "Số seal 3",
                                    content: "${items.cont1seal3}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              items.contNumber2 != ""
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomText(
                                title: "Số công 2",
                                content: "${items.contNumber2}"),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                CustomText(
                                    title: "Số seal 1",
                                    content: "${items.cont2seal1}"),
                                const SizedBox(height: 10),
                                CustomText(
                                    title: "Số seal 2",
                                    content: "${items.cont2seal2}"),
                                const SizedBox(height: 10),
                                CustomText(
                                    title: "Số seal 3",
                                    content: "${items.cont2seal3}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        title: "Ngày/tháng",
                        content: day.format(DateTime.parse(dateTime))),
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomText(
                        title: "Giờ vào",
                        content: hour.format(DateTime.parse(dateTime))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
