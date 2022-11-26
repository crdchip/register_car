import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/view/list_driver.dart';
import 'package:register_driver_car/app/driver_page/view/driver_screen.dart';
import 'package:register_driver_car/app/history_driver_page/view/history_form_driver_page.dart';
import 'package:register_driver_car/app/history_list_driver_company/controller/history_list_driver_company_controller.dart';
import 'package:register_driver_car/app/history_list_driver_company/view/history_list_driver_company_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final String routes = "/customer_page";
  bool checkPage = false;
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ListDriverScreen();
  bool checkDrawer = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text("Customer Page"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = const ListDriverScreen();
                  });
                },
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    checkPage = !checkPage;
                    if (checkPage) {
                      currentScreen = const DriverScreen();
                    } else {
                      currentScreen = const ListDriverScreen();
                    }
                  });
                },
                icon: checkPage
                    ? const Icon(Icons.close)
                    : const Icon(Icons.create),
              ),
            ],
          ),
          body: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
          drawer: Drawer(
            child: _drawer(),
          ),
        ),
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
                  // Get.to(() => HistoryListDriverCompanyScreen());
                  setState(() {
                    currentScreen = const HistoryListDriverCompanyScreen();
                    checkDrawer = !checkDrawer;
                    // Navigator.pop(context);
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

    Get.toNamed(Routes.LOGIN);
  }
}
