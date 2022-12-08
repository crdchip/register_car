import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class AdminTallymanWorkingScreen extends StatefulWidget {
  const AdminTallymanWorkingScreen({super.key});

  @override
  State<AdminTallymanWorkingScreen> createState() =>
      _AdminTallymanWorkingScreenState();
}

class _AdminTallymanWorkingScreenState
    extends State<AdminTallymanWorkingScreen> {
  final String routes = "/admin_tallyman_working_screen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: FutureBuilder(
                future: controller.getTrackinglv3(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data as List<Tracking>;
                    return items.isNotEmpty
                        ? ListView.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, index) {
                              int statusChecking =
                                  items[index].statustracking!.length;
                              return Card(
                                child: ListTile(
                                  tileColor:
                                      Colors.orangeAccent.withOpacity(0.4),
                                  onTap: () {
                                    Get.toNamed(
                                        Routes
                                            .ADMIN_TALLYMAN_WORKING_DETAILS_SCREEN,
                                        arguments: items[index]);
                                  },
                                  title: Text(
                                      "${items[index].formIns!.clientInformation!.name}"),
                                  subtitle: Text(
                                      "${items[index].formIns!.clientInformation!.companyname}"),
                                  trailing: Text(
                                      "${items[index].statustracking![statusChecking - 1].name}"),
                                ),
                              );
                            }),
                          )
                        : const Center(
                            child: Text("Không có xe"),
                          );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              ),
            ));
  }
}
