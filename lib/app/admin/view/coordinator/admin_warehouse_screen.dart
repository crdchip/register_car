import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class AdminWareHouseScreen extends StatefulWidget {
  const AdminWareHouseScreen({super.key});

  @override
  State<AdminWareHouseScreen> createState() => _AdminWareHouseScreenState();
}

class _AdminWareHouseScreenState extends State<AdminWareHouseScreen> {
  final String routes = "/admin_warehouse_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: GetBuilder<AdminController>(
          init: AdminController(),
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
                                Routes.ADMIN_WAREHOUSE_DETAILS_SCREEM,
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
