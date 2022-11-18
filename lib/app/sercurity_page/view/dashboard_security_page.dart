import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/details_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardSecurityPage extends StatefulWidget {
  const DashBoardSecurityPage({super.key});

  @override
  State<DashBoardSecurityPage> createState() => _DashBoardSecurityPageState();
}

class _DashBoardSecurityPageState extends State<DashBoardSecurityPage> {
  final String routes = "/dash_board_security";
  late ScrollController _scrollController;

  var sercurityController = SercurityController();

  List<Map<String, dynamic>> listMenu = [
    {"name": "Setting"},
    {"name": "Logout"}
  ];

  bool _showAppbar = false;
  bool isScrollingDown = false;

  bool showSearch = true;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(
      () {
        //Ẩn
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!isScrollingDown) {
            setState(() {
              print("Scrolling");
              isScrollingDown = true;
              _showAppbar = true;
            });
          }
        }
        // Hiện
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isScrollingDown) {
            setState(() {
              print("Scrolled");
              isScrollingDown = false;
              _showAppbar = false;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: ((controller) => SafeArea(
            child: Scaffold(
              appBar: _showAppbar
                  ? null
                  : AppBar(
                      title: const Text(
                        "Security Page",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      centerTitle: true,
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        const SizedBox(width: 15),
                      ],
                    ),
              drawer: const Drawer(
                child: DrawerScreen(),
              ),
              body: body(size),
            ),
          )),
    );
  }

  Widget body(Size size) {
    return Stack(
      children: [
        FutureBuilder(
          future: sercurityController.getTracking(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<Trackinglv0>;
              print("items : ${items.length + 1}");
              return ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? const CustomNavListTitle(
                          height: 60,
                          // nameDriver: "",
                          nameDriver: 'Tài xế',
                          customer: "Khánh Hàng",
                          status: "Trạng thái",
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              // Get.toNamed(Routes.DETAILS_SERCURITY,
                              //     arguments: [items[index].formIns!.dataform, items[index]]);
                              Get.to(() => DetailsSercurity(
                                    dataform:
                                        items[index - 1].formIns!.dataform,
                                    tracking0: items[index - 1],
                                  ));
                            });
                          },
                          child: CustomListTitle(
                            Stt: '$index',
                            image:
                                "${items[index - 1].formIns!.clientInformation!.imgdata}",
                            nameDriver:
                                '${items[index - 1].formIns!.clientInformation!.name}',
                            numberPhone:
                                '${items[index - 1].formIns!.clientInformation!.phone}',
                            customer:
                                '${items[index - 1].formIns!.clientInformation!.companyname}',
                            status:
                                '${items[index - 1].statustracking![0].name}',
                          ),
                        );
                },
              );
            }
            return Container();
          }),
        ),
        Positioned(
            top: -6,
            child: CustomNavListTitle(
              height: _showAppbar ? 60 : 0,
              nameDriver: "Tên tài xế",
              customer: "Khánh Hàng",
              status: "Trạng thái",
            ))
      ],
    );
  }

  Widget uploadImage(Size size, String image) {
    return Container(
      width: size.width,
      height: size.width * 0.2,
      // color: Colors.amberAccent,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: size.width * 0.2,
              width: size.width * 0.2,
              child: getImageBase64(image),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1.0),
                  // color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 24,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getImageBase64(String image) {
    // print("imgae : $image");
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

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }
}

postLogout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove(AppConstants.KEY_ACCESS_TOKEN);

  Get.toNamed("/login");
}
