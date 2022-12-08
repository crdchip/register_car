import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/view/create_form_screen.dart';
import 'package:register_driver_car/app/customers/view/list_driver.dart';
import 'package:register_driver_car/app/customers/view/list_form_register_screen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/data/colors.dart';
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
  var customerController = Get.put(CustomerController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
            children: [
              FutureBuilder(
                future: controller.getData(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data;
                    return SizedBox(
                      height: size.height * 0.3,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
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
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
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
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
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
              Divider(
                  height: 5,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.05,
                  thickness: 2),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text("Cài đặt"),
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
                title: const Text("Đăng xuất"),
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
