import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class AdminSercurityFinalScreen extends StatefulWidget {
  const AdminSercurityFinalScreen({super.key});

  @override
  State<AdminSercurityFinalScreen> createState() =>
      _AdminSercurityFinalScreenState();
}

class _AdminSercurityFinalScreenState extends State<AdminSercurityFinalScreen> {
  final String routes = "/admin_sercurity_final_screen";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      init: AdminController(),
      builder: (controller) {
        return Container(
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
          child: FutureBuilder(
            future: controller.getTrackinglv4(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<Tracking>;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    var lenghtTracking =
                        items[index].statustracking!.length - 1;
                    return Card(
                      color: Colors.orangeAccent.withOpacity(0.3),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(
                              Routes.ADMIN_SERCURITY_FINAL_DETAILS_SCREEN,
                              arguments: items[index]);
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(100)),
                          height: 50,
                          width: 50,
                          child: getImageBase64(
                              "${items[index].formIns!.clientInformation!.imgdata}"),
                        ),
                        title: Text(
                            "${items[index].formIns!.clientInformation!.name}"),
                        subtitle: Text(
                            "${items[index].formIns!.clientInformation!.companyname}"),
                        trailing: Text(
                            "${items[index].statustracking![lenghtTracking].name}"),
                      ),
                    );
                  }),
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.orangeAccent),
              );
            }),
          ),
        );
      },
    );
  }

  getImageBase64(String image) {
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.memory(
        bytes,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
