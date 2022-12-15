import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class AdminCarOutScreen extends StatefulWidget {
  const AdminCarOutScreen({super.key});

  @override
  State<AdminCarOutScreen> createState() => _AdminCarOutScreenState();
}

class _AdminCarOutScreenState extends State<AdminCarOutScreen> {
  final String routes = "/admin_car_out_screen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
        builder: (controller) => FutureBuilder(
              future: controller.getTrackinglv5(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<Tracking>;
                  return items.isNotEmpty
                      ? ListView.builder(
                          itemCount: items.length,
                          itemBuilder: ((context, index) {
                            int statusChecking =
                                items[index].statustracking!.length;
                            return ListTile(
                              onTap: () {
                                // Get.toNamed(Routes.TALLYMAN_DETAILS_SCREEN,
                                //     arguments: items[index]);
                              },
                              title: Text(
                                  "${items[index].formIns!.clientInformation!.name}"),
                              subtitle: Text(
                                  "${items[index].formIns!.clientInformation!.companyname}"),
                              trailing: Text(
                                  "${items[index].statustracking![statusChecking - 1].name}"),
                            );
                          }),
                        )
                      : const Center(
                          child: Text("Không có xe"),
                        );
                }
                return const Center(
                    child:
                        CircularProgressIndicator(color: Colors.orangeAccent));
              }),
            ));
  }
}
