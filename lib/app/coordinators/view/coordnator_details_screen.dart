import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinators/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class CoordinatorDetailsScreen extends StatefulWidget {
  const CoordinatorDetailsScreen({
    super.key,
    this.gateRight,
    this.gateLeft,
  });

  final List<Gate>? gateRight;
  final List<Gate>? gateLeft;

  @override
  State<CoordinatorDetailsScreen> createState() =>
      _CoordinatorDetailsScreenState();
}

class _CoordinatorDetailsScreenState extends State<CoordinatorDetailsScreen> {
  final String routes = "/status_screen_detail";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  "${widget.gateRight!.length} + ${widget.gateLeft!.length}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.HISTORY_SCREEN,
                      );
                    },
                    icon: const Icon(
                      Icons.check_sharp,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
                backgroundColor: Colors.amber,
              ),
              body: _getBody(),
            ));
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        children: [
          gateLeft(),
          const SizedBox(
            width: 5,
          ),
          gateRight(),
        ],
      ),
    );
  }

  Widget gateLeft() {
    return Expanded(
      flex: 10,
      child: ListView.builder(
        itemCount: widget.gateLeft!.length,
        itemBuilder: ((context, index) {
          var lengthLeft = widget.gateLeft!.length;
          return lengthLeft == null
              ? Container()
              : Column(
                  children: [
                    Center(child: Text("Door left ${index + 1}")),
                    showLane(
                      "${widget.gateLeft![index].lines![0].name}",
                      widget.gateLeft![index].lines![0].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: const Text("Bạn có xác nhận !"),
                              content: Text(
                                  "${widget.gateLeft![index].lines![0].id}"),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: const Text("Oke"),
                                  onPressed: () {
                                    Get.toNamed(Routes.HISTORY_SCREEN,
                                        arguments: widget
                                            .gateLeft![index].lines![0].id);
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
                          if (widget.gateLeft![index].lines![0].status ==
                              false) {
                            widget.gateLeft![index].lines![0].status = true;
                          } else if (widget.gateLeft![index].lines![0].status ==
                              true) {
                            widget.gateLeft![index].lines![0].status = false;
                          }
                        });
                      },
                    ),
                    showLane(
                      "${widget.gateLeft![index].lines![1].name}",
                      widget.gateLeft![index].lines![1].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: const Text("Bạn có xác nhận !"),
                              content: Text(
                                  "${widget.gateLeft![index].lines![0].id}"),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: const Text("Oke"),
                                  onPressed: () {
                                    Get.toNamed(Routes.HISTORY_SCREEN,
                                        arguments: widget
                                            .gateLeft![index].lines![0].id);
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
                          if (widget.gateLeft![index].lines![1].status ==
                              false) {
                            widget.gateLeft![index].lines![1].status = true;
                          } else if (widget.gateLeft![index].lines![1].status ==
                              true) {
                            widget.gateLeft![index].lines![1].status = false;
                          }
                        });
                      },
                    ),
                    showLane(
                      "${widget.gateLeft![index].lines![2].name}",
                      widget.gateLeft![index].lines![2].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          showPlatformDialog(
                            context: context,
                            builder: (context) => BasicDialogAlert(
                              title: const Text("Bạn có xác nhận !"),
                              content: Text(
                                  "${widget.gateLeft![index].lines![0].id}"),
                              actions: <Widget>[
                                BasicDialogAction(
                                  title: const Text("Oke"),
                                  onPressed: () {
                                    Get.toNamed(Routes.HISTORY_SCREEN,
                                        arguments: widget
                                            .gateLeft![index].lines![0].id);
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
                          if (widget.gateLeft![index].lines![2].status ==
                              false) {
                            widget.gateLeft![index].lines![2].status = true;
                          } else if (widget.gateLeft![index].lines![2].status ==
                              true) {
                            widget.gateLeft![index].lines![2].status = false;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
        }),
      ),
    );
  }

  Widget gateRight() {
    return Expanded(
      flex: 10,
      child: ListView.builder(
        itemCount: widget.gateRight!.length,
        itemBuilder: ((context, index) {
          var lengthRight = widget.gateRight!.length;
          return lengthRight == null
              ? Container()
              : Column(
                  children: [
                    Text("Door right ${index + 0}"),
                    showLane(
                      "${widget.gateRight![index].lines![0].name}",
                      widget.gateRight![index].lines![0].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          if (widget.gateRight![index].lines![0].status ==
                              false) {
                            widget.gateRight![index].lines![0].status = true;
                          } else if (widget
                                  .gateRight![index].lines![0].status ==
                              true) {
                            widget.gateRight![index].lines![0].status = false;
                          }
                        });
                      },
                    ),
                    showLane(
                      "${widget.gateRight![index].lines![1].name}",
                      widget.gateRight![index].lines![1].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          if (widget.gateRight![index].lines![1].status ==
                              false) {
                            widget.gateRight![index].lines![1].status = true;
                          } else if (widget
                                  .gateRight![index].lines![1].status ==
                              true) {
                            widget.gateRight![index].lines![1].status = false;
                          }
                        });
                      },
                    ),
                    showLane(
                      "${widget.gateRight![index].lines![2].name}",
                      widget.gateRight![index].lines![2].status == false
                          ? Colors.red
                          : Colors.green,
                      () {
                        setState(() {
                          if (widget.gateRight![index].lines![2].status ==
                              false) {
                            widget.gateRight![index].lines![2].status = true;
                          } else if (widget
                                  .gateRight![index].lines![2].status ==
                              true) {
                            widget.gateRight![index].lines![2].status = false;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                );
        }),
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
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
