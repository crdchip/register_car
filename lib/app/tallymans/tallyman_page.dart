import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_final_screen.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_screen.dart';
import 'package:register_driver_car/app/tallymans/view/tallyman_woking_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TallymanPage extends StatefulWidget {
  const TallymanPage({super.key});

  @override
  State<TallymanPage> createState() => _TallymanPageState();
}

class _TallymanPageState extends State<TallymanPage> {
  final String routes = "tallyman_page";
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = TallymanScreen();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TallyManController>(
      init: TallyManController(),
      builder: (controller) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("TallyMan Page"),
          centerTitle: true,
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        drawer: Drawer(child: _drawer()),
      ),
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
                  setState(() {
                    currentScreen = TallymanScreen();
                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.home),
                title: const Text("Home Page"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentScreen = TallymanWorkingScreen();
                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.settings),
                title: const Text("Working Car Page"),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    currentScreen = TallymanFinalScreen();
                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.settings),
                title: const Text("Final Car Page"),
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

    Get.toNamed(Routes.LOGIN);
  }
}
