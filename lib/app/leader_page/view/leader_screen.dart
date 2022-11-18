import 'package:flutter/material.dart';
import 'package:register_driver_car/app/coordinators/view/coordinators_screen.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_sreen.dart';
import 'package:register_driver_car/app/sercurity_page/view/drawer.dart';

class LeaderScreen extends StatefulWidget {
  const LeaderScreen({super.key});

  @override
  State<LeaderScreen> createState() => _LeaderScreenState();
}

class _LeaderScreenState extends State<LeaderScreen> {
  final String routes = "/leader_page";

  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = CoordinatorsScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DrawerScreen(),
        ),
        appBar: AppBar(
          title: const Text("Leader Screen"),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 0,
                  child: Text("Car in "),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text("Lane in "),
                ),
              ],
              onSelected: (items) {
                setState(() {
                  onSelection(context, items);
                });
              },
            )
          ],
        ),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ));
  }

  onSelection(BuildContext context, int items) {
    switch (items) {
      case 0:
        currentScreen = HistorySercurityScreen(
          scrollController: ScrollController(),
          arg: "",
        );
        break;
      case 1:
        currentScreen = CoordinatorsScreen();
        break;
      default:
    }
  }
}
