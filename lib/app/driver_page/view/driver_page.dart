import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/driver_page/controller/driver_controller.dart';
import 'package:register_driver_car/app/driver_page/view/driver_screen.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_driver_page.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  final String routes = "driver_page";
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Driver Page",
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
          ),
          centerTitle: true,
          // automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: _drawer(),
        ),
        body: const DriverScreen(),
      ),
    );
  }

  Widget _drawer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => const HistoryFormDriverPage());
            },
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("History Form Driver"),
                ),
                ListTile(
                  onTap: () {
                    postLogout();
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN);
  }
}
