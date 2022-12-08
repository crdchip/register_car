import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinator/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/data/colors.dart';

class StatusLinesDetailsScreen extends StatefulWidget {
  const StatusLinesDetailsScreen({
    super.key,
  });

  @override
  State<StatusLinesDetailsScreen> createState() =>
      _StatusLinesDetailsScreenState();
}

class _StatusLinesDetailsScreenState extends State<StatusLinesDetailsScreen> {
  final String routes = "/status_screen_detail";
  var items = Get.arguments[0] as WareHome;
  var idForm = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    var gateLeft = items.gateLeft;
    var gateRight = items.gateRight;
    return GetBuilder<CoordinatorController>(
      init: CoordinatorController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "${items.name} ",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,

          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: gateLeft!.length,
                  itemBuilder: ((context, index) {
                    var lengthLeft = gateLeft.length;
                    // ignore: unnecessary_null_comparison
                    return lengthLeft == null
                        ? Container()
                        : Column(
                            children: [
                              Center(child: Text("Door left ${index + 1}")),
                              showLane(
                                "${gateLeft[index].lines![0].name}",
                                gateLeft[index].lines![0].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      // content: Text(
                                      //     " ${idForm} + ${gateLeft[index].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateLeft[index].lines![0].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              showLane(
                                "${gateLeft[index].lines![1].name}",
                                gateLeft[index].lines![1].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      content: Text(
                                          "${gateLeft[index].lines![1].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateLeft[index].lines![0].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              showLane(
                                "${gateLeft[index].lines![2].name}",
                                gateLeft[index].lines![2].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      content: Text(
                                          "${gateLeft[index].lines![2].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateLeft[index].lines![0].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                  }),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: gateRight!.length,
                  itemBuilder: ((context, index) {
                    var lengthRight = gateRight.length;
                    // ignore: unnecessary_null_comparison
                    return lengthRight == null
                        ? Container()
                        : Column(
                            children: [
                              Text("Door right ${index + 0}"),
                              showLane(
                                "${gateRight[index].lines![0].name}",
                                gateRight[index].lines![0].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      content: Text(
                                          "${gateRight[index].lines![0].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateRight[index].lines![0].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              showLane(
                                "${gateRight[index].lines![1].name}",
                                gateRight[index].lines![1].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      content: Text(
                                          "${gateRight[index].lines![1].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateRight[index].lines![1].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              showLane(
                                "${gateRight[index].lines![2].name}",
                                gateRight[index].lines![2].status == false
                                    ? Colors.red
                                    : Colors.green,
                                () {
                                  showPlatformDialog(
                                    context: context,
                                    builder: (context) => BasicDialogAlert(
                                      title: const Text("Bạn có xác nhận !"),
                                      content: Text(
                                          "${gateRight[index].lines![2].id}"),
                                      actions: <Widget>[
                                        BasicDialogAction(
                                          title: const Text("Oke"),
                                          onPressed: () {
                                            setState(() {
                                              controller.putTrackinglv2(
                                                gateRight[index].lines![2].id,
                                                idForm,
                                              );
                                            });
                                          },
                                        ),
                                        BasicDialogAction(
                                          title: const Text("Hủy"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showLane(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.white),
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
