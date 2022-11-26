import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/dashboard_sercurity_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/sercurity_final_screen.dart';
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
  final String routes = "/dash_board_security_page";
  late ScrollController _scrollController;

  var sercurityController = Get.put(SercurityController());

  bool _showAppbar = false;

  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashBoardSercurityScreen();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: ((controller) => SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: const Text(
                  "Security Page",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  const SizedBox(width: 15),
                ],
              ),
              drawer: Drawer(
                child: _drawer(),
              ),
              body: PageStorage(
                bucket: bucket,
                child: currentScreen,
              ),
            ),
          )),
    );
  }

  Widget _drawer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Column(
            children: [
              ListTile(
                onTap: () {
                  // Get.to(() => HistoryListDriverCompanyScreen());
                  setState(() {
                    currentScreen = const DashBoardSercurityScreen();

                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.home),
                title: const Text("History Form Driver"),
              ),
              ListTile(
                onTap: () {
                  // Get.to(() => HistoryListDriverCompanyScreen());
                  setState(() {
                    currentScreen = const SercurityFinalScreen();

                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.settings),
                title: const Text("History Form Driver"),
              ),
              ListTile(
                onTap: () {
                  postLogout();
                },
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.closeDrawer();
      } else if (_scaffoldKey.currentState!.isEndDrawerOpen) {
        _scaffoldKey.currentState!.closeEndDrawer();
      }
    }
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed("/login");
  }
}
