import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/status/controller/status_page_controller.dart';

import 'package:register_driver_car/app/status/model/lane_model.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/app/status/view/status_detail_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  var statusController = Get.put(StatusController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<StatusController>(
          builder: (controller) {
            return _getBody(size);
          },
        ),
      ),
    );
  }

  Widget _getBody(Size size) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: size.width,
          height: size.height,
          child: FutureBuilder(
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<LaneCar>;
                print(items);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(index);
                        Get.to(
                          () => StatusDetailScreen(
                            client_left: items[index].client_left,
                            client_right: items[index].client_right,
                          ),
                        );
                        print(items[index].client_left!.length);
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
              return Container();
            }),
            future: statusController.ReadDataLane(),
          )),
    );
  }
  // Widget _getBody(Size size) {
  //   return SingleChildScrollView(
  //     child: Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 5),
  //         width: size.width,
  //         height: size.height,
  //         child: FutureBuilder(
  //           builder: ((context, snapshot) {
  //             if (snapshot.hasData) {
  //               var items = snapshot.data as List<WareHome>;
  //               print(items);
  //               return ListView.builder(
  //                 scrollDirection: Axis.vertical,
  //                 itemCount: items.length,
  //                 itemBuilder: (context, index) {
  //                   return InkWell(
  //                     onTap: () {
  //                       print(index);
  //                       Get.to(
  //                         () => StatusDetailScreen(
  //                           client_left: items[index].client_left,
  //                           client_right: items[index].client_right,
  //                         ),
  //                       );
  //                       print(items[index].client_left!.length);
  //                     },
  //                     child: Card(
  //                       child: ListTile(
  //                         title: Text("${items[index].name}"),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               );
  //             }
  //             return Container();
  //           }),
  //           future: statusController.getStatusLine(),
  //         )),
  //   );
  // }
}
