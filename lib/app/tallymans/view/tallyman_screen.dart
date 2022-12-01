import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/image_base64.dart';

class TallymanScreen extends StatefulWidget {
  const TallymanScreen({super.key});

  @override
  State<TallymanScreen> createState() => _TallymanScreenState();
}

class _TallymanScreenState extends State<TallymanScreen> {
  final String routes = "/tallyman_screen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TallyManController>(
        init: TallyManController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: FutureBuilder(
              future: controller.getTrackinglv2(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<Trackinglv0>;
                  return items.isNotEmpty
                      ? ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            // print(statusChecking);
                            return Card(
                              child: ListTile(
                                tileColor: Colors.orangeAccent.withOpacity(0.4),
                                onTap: () {
                                  Get.toNamed(Routes.TALLYMAN_DETAILS_SCREEN,
                                      arguments: items[index]);
                                },
                                leading: ImageBase64(
                                    image:
                                        "${items[index].formIns!.clientInformation!.imgdata}"),
                                title: Text(
                                    "${items[index].formIns!.clientInformation!.name}"),
                                subtitle: Text(
                                    "${items[index].formIns!.clientInformation!.companyname}"),
                                trailing: Text(
                                    "${items[index].formIns!.dataform!.warehouse} / ${items[index].lines!.name}"),
                              ),
                            );
                          })
                      : const Center(
                          child: Text("Không có xe"),
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
        });
  }
}
