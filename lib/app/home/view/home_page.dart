import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/home/controller/home/home_controller.dart';
import 'package:register_driver_car/app/home/view/active_status/active_status_page.dart';
import 'package:register_driver_car/app/home/view/register_car/register_car_page.dart';

import 'package:register_driver_car/app/home/view/webview.dart';

import 'package:register_driver_car/app/status/view/status_screen.dart';

import 'package:register_driver_car/config/model/role/role_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final const String role = RoleApi.getRole().toString;

  void switchPage() async {
    var role = await RoleApi().getRole();
    switch (role) {
      case "Bảo vệ":
        Get.to(() => const StatusScreen());
        break;
      case "admin":
        Get.to(() => const ActiveStatusPage());
        break;

      default:
        print("Lỗi");
    }
  }

  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(body: getBody(size)),
    );
  }

  Widget getBody(Size size) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            if (controller.acticles.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SizedBox(
              width: size.width,
              height: size.width * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.acticles.length,
                itemBuilder: ((context, index) {
                  var acticle = controller.acticles[index];

                  return Stack(
                    children: [
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => WebViewScreen(
                                    articles: acticle,
                                  ),
                                );
                              },
                              child: Container(
                                width: size.width * 0.6,
                                height: size.width * 0.4,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.purple, Colors.blue],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 5,
                        left: 5,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.6,
                          child: Text(
                            "${acticle.title}",
                            style: const TextStyle(color: Colors.white),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Text(
                          "${acticle.author}",
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  );
                }),
              ),
            );
          }),
          Card(
            child: GestureDetector(
              onTap: () {
                Get.to(() => RegisterCarPage());
              },
              child: const Card(
                child: ListTile(
                  title: Text("Đăng ký xe ra vào"),
                  tileColor: Colors.grey,
                ),
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const ActiveStatusPage());
              },
              child: const Card(
                child: ListTile(
                  title: Text("Tình trạng xe"),
                  tileColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
