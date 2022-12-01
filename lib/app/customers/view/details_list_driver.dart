import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_status.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class DetailsListDriver extends StatefulWidget {
  const DetailsListDriver({super.key});

  @override
  State<DetailsListDriver> createState() => _DetailsListDriverState();
}

class _DetailsListDriverState extends State<DetailsListDriver> {
  final String routes = "/details_list_driver";

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null && Get.arguments is TrackingStatus) {}
  }

  var items = Get.arguments as TrackingStatus;

  @override
  Widget build(BuildContext context) {
    var length = items.statustracking!.length;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Trạng thái tài xê "),
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
            backgroundColor: CustomColor.backgroundAppbar,
          ),
          body: Container(
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
            // padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Timeline(
              children: <TimelineModel>[
                length >= 1
                    ? TimelineModel(
                        const SizedBox(
                            height: 100,
                            child: Center(child: Text("Chưa vào"))),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 2
                    ? TimelineModel(
                        const SizedBox(
                            height: 100,
                            child: Center(child: Text("Đã vào cổng"))),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.right,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 3
                    ? TimelineModel(
                        const SizedBox(
                            height: 100,
                            child: Center(child: Text("Đã vào line"))),
                        icon: const Icon(Icons.table_rows, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon: const Icon(Icons.table_rows, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 4
                    ? TimelineModel(
                        const SizedBox(
                            height: 100,
                            child: Center(child: Text("Đang lên hàng"))),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.right,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon: const Icon(Icons.android, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 5
                    ? TimelineModel(
                        const SizedBox(
                            height: 100, child: Center(child: Text("Đã xong"))),
                        icon: const Icon(Icons.done, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon: const Icon(Icons.done, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 6
                    ? TimelineModel(
                        const SizedBox(
                            height: 100,
                            child: Center(child: Text("Đã xuất cổng"))),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.right,
                      )
                    : TimelineModel(
                        Container(height: 100),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
              ],
              // position: TimelinePosition.Left,
              iconSize: 40,
              lineColor: Colors.orangeAccent.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
