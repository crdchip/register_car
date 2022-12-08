import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:register_driver_car/app/driver_page/model/list_form_driver_model.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/routes/pages.dart';
import 'package:register_driver_car/config/widget/custom_list_title.dart';

class ListFormDriverScreen extends StatefulWidget {
  const ListFormDriverScreen({super.key});

  @override
  State<ListFormDriverScreen> createState() => _ListFormDriverScreenState();
}

class _ListFormDriverScreenState extends State<ListFormDriverScreen> {
  final String routes = "/list_form_driver_screen";
  bool _showAppbar = true;
  final ScrollController _scrollBottomBarController = new ScrollController();
  bool isScrollingDown = false;
  bool _show = true;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {
            print("oke");
            _show = true;
          });
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {
            _show = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var items = Get.arguments as List;
    final day = DateFormat("yyyy-MM-dd");
    final hour = DateFormat.jm();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: const Text("Danh sách các phiếu đã đăng ký"),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                tileColor: CustomColor.backgroundAppbar,
                leading: const Text(""),
                title: const Text(
                  "Công ty",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Ngày vào",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollBottomBarController,
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  var dateTime = items[index]["FormIn"]["timein"];

                  return dateTime != null
                      ? Card(
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(
                                Routes.LIST_FORM_DRIVER_DETAILS_SCREEN,
                                arguments: items[index],
                              );
                            },
                            leading: Text("${index + 1}"),
                            title: Text("${items[index]["Company"]["name"]}"),
                            subtitle:
                                Text("${items[index]["CarFleed"]["name"]}"),
                            trailing: Column(
                              children: [
                                Text(day.format(DateTime.parse(dateTime))),
                                Text(hour.format(DateTime.parse(dateTime))),
                              ],
                            ),
                          ),
                        )
                      : Container();
                }),
              ),
            ),
          ],
        ));
  }
}
