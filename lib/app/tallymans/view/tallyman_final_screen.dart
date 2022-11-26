import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class TallymanFinalScreen extends StatefulWidget {
  const TallymanFinalScreen({super.key});

  @override
  State<TallymanFinalScreen> createState() => _TallymanFinalScreenState();
}

class _TallymanFinalScreenState extends State<TallymanFinalScreen> {
  final String routes = "/tallyman_final_screen";
  var tallymanController = Get.put(TallyManController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tallymanController.getTrackinglv4(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var items = snapshot.data as List<Trackinglv0>;
          return items.length != 0
              ? ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    int statusChecking = items[index].statustracking!.length;
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
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
