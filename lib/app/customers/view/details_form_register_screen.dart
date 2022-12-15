import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/customer_page.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/driver/form_post_account.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';

import 'package:intl/intl.dart';

class DetailsFormRegisterScreen extends StatefulWidget {
  const DetailsFormRegisterScreen({super.key});

  @override
  State<DetailsFormRegisterScreen> createState() =>
      _DetailsFormRegisterScreenState();
}

class _DetailsFormRegisterScreenState extends State<DetailsFormRegisterScreen> {
  final String routes = "/details_form_register_screen";
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
        title: const Text(
          "Thông tin đã đăng ký",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const CustomerPage());
              },
              icon: const Icon(Icons.home))
        ],
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(title: "Đội xe", content: "${items.carfleedId}"),
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
                  ? const SizedBox(height: 10)
                  : Container(),
              items.contNumber1 != ""
                  ? Row(
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
                    )
                  : Container(),
              items.contNumber2 != ""
                  ? const SizedBox(height: 10)
                  : Container(),
              items.contNumber2 != ""
                  ? Row(
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
                    )
                  : Container(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                        title: "Ngày/tháng",
                        content: day.format(DateTime.parse(dateTime))),
                  ),
                  Expanded(
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
