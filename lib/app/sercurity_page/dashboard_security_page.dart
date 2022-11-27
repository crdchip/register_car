import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/dashboard/controller/dashboard_controller.dart';
import 'package:register_driver_car/app/login/model/login_user_token.dart';
import 'package:register_driver_car/app/sercurity_page/view/dashboard_sercurity_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/sercurity_final_screen.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/details_screen.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/model/user/user_model.dart';
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
                backgroundColor: CustomColor.backgroundAppbar,
              ),
              drawer: Drawer(
                child: _drawer(size, controller),
              ),
              body: PageStorage(
                bucket: bucket,
                child: currentScreen,
              ),
            ),
          )),
    );
  }

  Widget _drawer(Size size, SercurityController controller) {
    return Column(
      children: [
        Column(
          children: [
            FutureBuilder(
              future: sercurityController.getData(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data;
                  print("items: $items");
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network(
                                "https://anhdepfree.com/wp-content/uploads/2020/11/hinh-anh-background-troi-dem-day-sao-1920x1080.jpg")
                            .image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: size.height * 0.3,
                    child: Column(
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
                              child:
                                  // getImageBase64("${items["client"]["dataimg"]}"),
                                  _urlIamge(
                                      "https://th.bing.com/th/id/OIP.AFt9Z1kjCPEqviYmS5C7QwHaHa?pid=ImgDet&rs=1")),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: size.height * 0.1,
                          width: size.width,
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Họ và tên : ${items["client"]["name"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Số điện thoại : ${items["client"]["phone"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Chức vụ : ${items["role"]["roleName"]}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              }),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  currentScreen = const DashBoardSercurityScreen();
                  closeDrawer();
                });
              },
              leading: const Icon(Icons.home),
              title: const Text("Home Page"),
            ),
            Divider(
                height: 5,
                indent: size.width * 0.1,
                endIndent: size.width * 0.1,
                thickness: 2),
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
            Divider(
                height: 5,
                indent: size.width * 0.1,
                endIndent: size.width * 0.1,
                thickness: 2),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
            ),
            Divider(
                height: 5,
                indent: size.width * 0.1,
                endIndent: size.width * 0.1,
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

    Get.toNamed("/login");
  }
}
