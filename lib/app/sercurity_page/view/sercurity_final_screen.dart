import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class SercurityFinalScreen extends StatefulWidget {
  const SercurityFinalScreen({super.key});

  @override
  State<SercurityFinalScreen> createState() => _SercurityFinalScreenState();
}

class _SercurityFinalScreenState extends State<SercurityFinalScreen> {
  final String routes = "/sercurity_final_screen";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SercurityController>(
        init: SercurityController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.getTracking4(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<Trackinglv0>;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    var lenghtTracking =
                        items[index].statustracking!.length - 1;
                    return ListTile(
                      onTap: () {
                        Get.toNamed(Routes.SERCURITY_FINAL_DETAILS_SCREEN,
                            arguments: items[index]);
                      },
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(100)),
                        height: 50,
                        width: 50,
                      ),
                      title: Text(
                          "${items[index].formIns!.clientInformation!.name}"),
                      subtitle: Text(
                          "${items[index].formIns!.clientInformation!.companyname}"),
                      trailing: Text(
                          "${items[index].statustracking![lenghtTracking].name}"),
                    );
                  }),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          );
        });
  }
}
