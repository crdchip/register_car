import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class WareHouseScreen extends StatefulWidget {
  const WareHouseScreen({super.key});

  @override
  State<WareHouseScreen> createState() => _WareHouseScreenState();
}

class _WareHouseScreenState extends State<WareHouseScreen> {
  final String routes = "/warehouse_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: GetBuilder<CoordinatorController>(
          init: CoordinatorController(),
          builder: (controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: size.width,
              height: size.height,
              child: FutureBuilder(
                future: controller.getStatusLine(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data as List<WareHome>;
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(
                                Routes.WAREHOUSE_DETAILS_SCREEN,
                                arguments: items[index],
                              );
                            },
                            title: Text("${items[index].name}"),
                          ),
                        );
                      }),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orangeAccent.withOpacity(0.4),
                    ),
                  );
                }),
              ),
            );
          }),
    );
  }
}
