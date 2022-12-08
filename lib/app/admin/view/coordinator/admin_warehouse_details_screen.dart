import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';

class AdminWareHouseDetailsScreen extends StatefulWidget {
  const AdminWareHouseDetailsScreen({super.key});

  @override
  State<AdminWareHouseDetailsScreen> createState() =>
      _AdminWareHouseDetailsScreenState();
}

class _AdminWareHouseDetailsScreenState
    extends State<AdminWareHouseDetailsScreen> {
  final String routes = "/admin_warehouse_details_screen";
  var items = Get.arguments as WareHome;
  @override
  Widget build(BuildContext context) {
    var gateLeft = items.gateLeft;
    var gateRight = items.gateRight;
    return GetBuilder<AdminController>(
      init: AdminController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              "${items.name}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            centerTitle: true,

            backgroundColor: Colors.amber,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                    itemCount: gateLeft!.length,
                    itemBuilder: ((context, index) {
                      var lengthLeft = gateLeft.length;
                      // ignore: unnecessary_null_comparison
                      return lengthLeft == null
                          ? Container()
                          : Column(
                              children: [
                                Center(child: Text("Door left ${index + 1}")),
                                showLane(
                                  "${gateLeft[index].lines![0].name}",
                                  gateLeft[index].lines![0].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                showLane(
                                  "${gateLeft[index].lines![1].name}",
                                  gateLeft[index].lines![1].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                showLane(
                                  "${gateLeft[index].lines![2].name}",
                                  gateLeft[index].lines![2].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                    }),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                    itemCount: gateRight!.length,
                    itemBuilder: ((context, index) {
                      var lengthRight = gateRight.length;
                      // ignore: unnecessary_null_comparison
                      return lengthRight == null
                          ? Container()
                          : Column(
                              children: [
                                Text("Door right ${index + 0}"),
                                showLane(
                                  "${gateRight[index].lines![0].name}",
                                  gateRight[index].lines![0].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                showLane(
                                  "${gateRight[index].lines![1].name}",
                                  gateRight[index].lines![1].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                showLane(
                                  "${gateRight[index].lines![2].name}",
                                  gateRight[index].lines![2].status == false
                                      ? Colors.red
                                      : Colors.green,
                                  () {},
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget showLane(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.white),
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
