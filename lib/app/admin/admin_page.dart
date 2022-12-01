import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/admin/controller/admin_controller.dart';
import 'package:register_driver_car/app/admin/view/admin_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final String routes = "/admin_page";

  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const AdminScreen();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AdminController>(
      init: AdminController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Dash Board",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 24,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: _drawer(size, controller),
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
      ),
    );
  }

  Widget _drawer(Size size, AdminController controller) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.4, 0.7],
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              FutureBuilder(
                future: controller.getData(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data;

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: size.height * 0.2,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: size.height * 0.1,
                            width: size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.redAccent,
                            ),
                            child: _urlIamge(
                                "https://th.bing.com/th/id/OIP.AFt9Z1kjCPEqviYmS5C7QwHaHa?pid=ImgDet&rs=1"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: size.height * 0.1,
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Họ và tên : ${items["client"]["name"]}",
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Số điện thoại : ${items["client"]["phone"]}",
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Chức vụ : ${items["role"]["roleName"]}",
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
              ),
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
              ListTile(
                onTap: () {
                  setState(() {
                    // currentScreen = const CoordinatorScreen();
                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.home),
                title: const Text("Home Page"),
              ),
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
              ListTile(
                onTap: () {
                  // Get.to(() => HistoryListDriverCompanyScreen());
                  setState(() {
                    // currentScreen = const WareHouseScreen();

                    closeDrawer();
                  });
                },
                leading: const Icon(Icons.menu_book),
                title: const Text("History Form Driver"),
              ),
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
              ),
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
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

  getImageBase64(String image) {
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

  Widget _urlIamge(String src) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.amber,
        image: DecorationImage(
          image: Image.network(src).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN);
  }
}
