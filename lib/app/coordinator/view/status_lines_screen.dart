import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class StatusLinesScreen extends StatefulWidget {
  const StatusLinesScreen({super.key});

  @override
  State<StatusLinesScreen> createState() => _StatusLinesScreenState();
}

class _StatusLinesScreenState extends State<StatusLinesScreen> {
  final String routes = "/status_lines_screen";
  var coordinatorController = Get.put(CoordinatorController());
  var idForm = Get.arguments;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Chọn kho"),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: SingleChildScrollView(
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
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(
                            Routes.STATUS_LINES_DETAILS_SCREEN,
                            arguments: [items[index], idForm],
                          );
                        },
                        title: Text("${items[index].name}"),
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
          ),
        ),
      ),
    );
  }
}
