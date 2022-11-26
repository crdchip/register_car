import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class DetailsListDriver extends StatefulWidget {
  const DetailsListDriver({super.key});

  @override
  State<DetailsListDriver> createState() => _DetailsListDriverState();
}

class _DetailsListDriverState extends State<DetailsListDriver> {
  final String routes = "details_list_driver";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null) {
      print("oke");
    }
    print("object");
  }

  var items = Get.arguments as ListDriverCompanyModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Trạng thái tài xê"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white.withOpacity(0.4),
                size: 16,
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Timeline(
              children: <TimelineModel>[
                TimelineModel(
                  Container(
                      height: 100, child: Center(child: Text("Chưa vào"))),
                  icon: Icon(Icons.android, color: Colors.white),
                  iconBackground: Colors.cyan,
                ),
                TimelineModel(
                  Container(
                      height: 100, child: Center(child: Text("Đã vào cổng"))),
                  icon: Icon(Icons.android, color: Colors.white),
                  iconBackground: Colors.cyan,
                ),
                TimelineModel(
                  Container(
                    height: 100,
                    child: Center(
                      child: Text("Đang đợi lên hàng"),
                    ),
                  ),
                  icon: Icon(Icons.ios_share),
                  iconBackground: Colors.cyan,
                ),
                TimelineModel(
                  Container(
                    height: 100,
                    child: Center(
                      child: Text("Đang lên hàng"),
                    ),
                  ),
                  icon: Icon(Icons.ios_share),
                  iconBackground: Colors.cyan,
                ),
                TimelineModel(
                  Container(
                    height: 100,
                    child: Center(
                      child: Text("Đã xog"),
                    ),
                  ),
                  icon: Icon(Icons.ios_share),
                  iconBackground: Colors.cyan,
                ),
                TimelineModel(
                  Container(
                    height: 100,
                    child: Center(
                      child: Text("Đã ra cổng"),
                    ),
                  ),
                  icon: Icon(Icons.ios_share),
                  iconBackground: Colors.cyan,
                ),
              ],
              position: TimelinePosition.Left,
              iconSize: 40,
              lineColor: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
