import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_page.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_sreen.dart';
import 'package:register_driver_car/config/core/constants/constants.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: Image.network(
                        height: 100,
                        width: 100,
                        "https://upanh123.com/wp-content/uploads/2021/03/hinh-anh-cute13-300x300.jpg",
                        fit: BoxFit.cover,
                      ).image),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      "Nguyễn Văn Cừ",
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 5,
              height: 10,
              indent: size.width * 0.1,
              endIndent: size.width * 0.1,
              color: Colors.red,
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("Settings"),
                        leading: Icon(Icons.settings),
                        tileColor: Colors.black.withOpacity(0.4),
                        // trailing: Icon(Icons.skip_next),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => const HistorySercurityPage());
                        },
                        title: const Text("History"),
                        leading: const Icon(Icons.book),
                        tileColor: Colors.black.withOpacity(0.4),
                        // trailing: Icon(Icons.skip_next),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          postLogout();
                        },
                        title: const Text("Logout"),
                        leading: const Icon(Icons.logout),
                        tileColor: Colors.black.withOpacity(0.4),
                        // trailing: Icon(Icons.skip_next),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN);
  }
}
