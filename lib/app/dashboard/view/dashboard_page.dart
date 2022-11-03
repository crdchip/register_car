import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';
import 'package:register_driver_car/app/home/view/home_page.dart';
import 'package:register_driver_car/app/profile/view/profile_page.dart';

import 'package:register_driver_car/app/status/view/status_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int currentTab = 0;
  bool isFloatButton = false;
  final List<Widget> screens = [
    const HomePage(),
    const StatusScreen(),
    const ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage();
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("TBS"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            Switch.adaptive(
              value: _value,
              activeColor: Colors.grey[600],
              onChanged: (value) {
                // print(Get.isDarkMode);
                String themeCode = value ? "dark" : "light";
                setState(() {
                  GetStorage('MyStorage').write(AppConstants.THEME_KEY, themeCode);
                  Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                  _value = value;
                });
              },
            ),
          ],
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const HomePage();
                      currentTab = 0;
                    });
                  },
                  minWidth: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dashboard,
                        color:
                            currentTab == 0 ? Colors.blueAccent : Colors.grey,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = StatusScreen();
                      currentTab = 1;
                    });
                  },
                  minWidth: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color:
                            currentTab == 1 ? Colors.blueAccent : Colors.grey,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const ProfilePage();
                      currentTab = 2;
                    });
                  },
                  minWidth: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat,
                        color:
                            currentTab == 2 ? Colors.blueAccent : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
