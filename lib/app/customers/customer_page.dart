import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/view/create_form_screen.dart';
import 'package:register_driver_car/app/customers/view/list_driver.dart';
import 'package:register_driver_car/app/customers/view/list_form_register_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/animated_toggle.dart';
import 'package:register_driver_car/config/widget/switch_language.dart';
import 'package:register_driver_car/config/widget/switch_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  var customerController = Get.put(CustomerController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _toggleValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text("Customer Page"),
            centerTitle: true,
            backgroundColor: CustomColor.backgroundAppbar,
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
                      currentScreen = const FormRegisterInCustomerScreen();
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
            child: _drawer(size, controller),
          ),
        ),
      ),
    );
  }

  Widget _drawer(Size size, CustomerController controller) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent.withOpacity(0.4),
            Colors.white.withOpacity(0.4)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.4, 0.9],
        ),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FutureBuilder(
                    future: controller.getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data;
                        return Container(
                          padding: const EdgeInsets.only(left: 20),
                          height: size.height * 0.3,
                          child: Column(
                            children: [
                              Container(
                                height: size.height * 0.15,
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
                          ),
                        );
                      }
                      return Container();
                    }),
                  ),
                  ListTile(
                    onTap: () {
                      setState(() {
                        currentScreen = const ListDriverScreen();
                        closeDrawer();
                      });
                    },
                    leading: const Icon(Icons.home),
                    title: const Text("Trang chủ"),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.to(() => HistoryListDriverCompanyScreen());
                      setState(() {
                        currentScreen = const ListFormRegisterScreen();

                        closeDrawer();
                      });
                    },
                    leading: const Icon(Icons.menu_book),
                    title: const Text("Lịch sử phiếu đã đăng ký"),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.settings),
                    title: const Text("Cài đặt"),
                  ),
                  ListTile(
                    onTap: () {
                      postLogout();
                    },
                    leading: const Icon(Icons.logout),
                    title: const Text("Đăng xuất"),
                  ),
                  Divider(
                    height: 2,
                    indent: 10,
                    endIndent: 10,
                    thickness: 2,
                    color: Colors.grey[400],
                  ),
                  // SizedBox(
                  //   height: 140,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       SwitchLanguage(),
                  //       SwitchMode(),
                  //     ],
                  //   ),
                  // ),
                ],
              )
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
