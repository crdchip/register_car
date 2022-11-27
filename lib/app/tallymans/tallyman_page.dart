import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';

import 'package:register_driver_car/app/tallymans/view/tallyman_screen.dart';

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
    Size size = MediaQuery.of(context).size;
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
        drawer: Drawer(child: _drawer(size, controller)),
      ),
    );
  }

  Widget _drawer(Size size, TallyManController controller) {
    return Column(
      children: [
        Column(
          children: [
            FutureBuilder(
              future: controller.getData(),
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
                  // currentScreen = HistorySercurityScreen(arg: "");
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
                  // currentScreen = const CoordinatorsScreen();

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

    Get.toNamed(Routes.LOGIN);
  }
}
