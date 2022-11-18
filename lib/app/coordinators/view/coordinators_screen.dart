import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinators/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/coordinators/view/coordnator_details_screen.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';

class CoordinatorsScreen extends StatefulWidget {
  const CoordinatorsScreen({super.key});

  @override
  State<CoordinatorsScreen> createState() => _CoordinatorsScreenState();
}

class _CoordinatorsScreenState extends State<CoordinatorsScreen> {
  var coordinatorController = Get.put(CoordinatorController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: size.width,
          height: size.height,
          child: FutureBuilder(
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<WareHome>;
                // print(items);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // print(index);
                        Get.to(
                          () => CoordinatorDetailsScreen(
                            gateLeft: items[index].gateLeft,
                            gateRight: items[index].gateRight,
                          ),
                        );
                        print(items[index].gateLeft!.length);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text("${items[index].name}"),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
            future: coordinatorController.getStatusLine(),
          )),
    );
  }
}
