import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/coordinators/view/coordinators_screen.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_sreen.dart';
import 'package:register_driver_car/app/leader_page/controller/leader_controller.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderScreen extends StatefulWidget {
  const LeaderScreen({super.key});

  @override
  State<LeaderScreen> createState() => _LeaderScreenState();
}

class _LeaderScreenState extends State<LeaderScreen> {
  final String routes = "/leader_page";

  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = CoordinatorsScreen();
  var leaderController = Get.put(LeaderController());
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LeaderController>(
      init: LeaderController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: _drawer(size, controller),
          ),
          appBar: AppBar(
            title: const Text("Leader Screen"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              )
            ],
            backgroundColor: CustomColor.backgroundAppbar,
          ),
          body: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
        ),
      ),
    );
  }

  Widget _drawer(Size size, LeaderController controller) {
    return Column(
      children: [
        Column(
          children: [
            FutureBuilder(
              future: leaderController.getData(),
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
                  currentScreen = HistorySercurityScreen(arg: "");
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
                  currentScreen = const CoordinatorsScreen();

                  closeDrawer();
                });
              },
              leading: const Icon(Icons.menu_book),
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
