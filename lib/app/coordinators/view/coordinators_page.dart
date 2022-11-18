import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinators/controller/coordinator_controller.dart';
import 'package:register_driver_car/app/coordinators/view/coordinators_screen.dart';
import 'package:register_driver_car/app/coordinators/view/coordnator_details_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';
import 'package:register_driver_car/app/status/model/ware_home.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoordinatorsPage extends StatefulWidget {
  const CoordinatorsPage({super.key});

  @override
  State<CoordinatorsPage> createState() => _CoordinatorsPageState();
}

class _CoordinatorsPageState extends State<CoordinatorsPage> {
  final String routes = "/coordinator_page";

  var coordinatorController = Get.put(CoordinatorController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<CoordinatorController>(builder: (coordinatorController) {
      return Scaffold(
        drawer: const Drawer(
          child: DrawerScreen(),
        ),
        appBar: AppBar(
          title: const Text("CoordinatorsPage"),
          centerTitle: true,
        ),
        body: const CoordinatorsScreen(),
      );
    });
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN);
  }
}
