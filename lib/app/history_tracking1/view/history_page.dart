import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_details_screen.dart';
import 'package:register_driver_car/app/history_tracking1/view/history_sreen.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/app/history_tracking1/controller/history_tracking1_controller.dart';
import 'package:register_driver_car/app/home/widgets/custom_list_title.dart';
import 'package:register_driver_car/app/home/widgets/custom_nav_list_title.dart';

class HistorySercurityPage extends StatefulWidget {
  const HistorySercurityPage({super.key});

  @override
  State<HistorySercurityPage> createState() => _HistorySercurityPageState();
}

class _HistorySercurityPageState extends State<HistorySercurityPage> {
  final String routes = "/history_tracking1_screen";
  late ScrollController _scrollController;

  var historyTracking1Controller = HistoryTracking1Controller();

  bool _showAppbar = false;
  bool isScrollingDown = false;

  bool showSearch = true;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(
      () {
        //Ẩn
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (!isScrollingDown) {
            setState(() {
              print("Scrolling");
              isScrollingDown = true;
              _showAppbar = true;
            });
          }
        }
        // Hiện
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isScrollingDown) {
            setState(() {
              print("Scrolled");
              isScrollingDown = false;
              _showAppbar = false;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var arg = ModalRoute.of(context)!.settings.arguments;
    print(arg);
    return GetBuilder<HistoryTracking1Controller>(
      init: HistoryTracking1Controller(),
      builder: ((controller) => SafeArea(
            child: Scaffold(
              appBar: _showAppbar
                  ? null
                  : AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      title: Text(
                        "History Security Page $arg",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      centerTitle: true,
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        const SizedBox(width: 15),
                      ],
                    ),
              body: HistorySercurityScreen(arg: arg.toString()),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }
}
