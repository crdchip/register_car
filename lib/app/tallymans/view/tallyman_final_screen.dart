import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';
import 'package:register_driver_car/config/widget/custome_title.dart';

class TallymanFinalScreen extends StatefulWidget {
  const TallymanFinalScreen({super.key});

  @override
  State<TallymanFinalScreen> createState() => _TallymanFinalScreenState();
}

class _TallymanFinalScreenState extends State<TallymanFinalScreen> {
  final String routes = "/tallyman_final_screen";
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
    return GetBuilder<TallyManController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.4),
              Colors.orangeAccent.withOpacity(0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.2, 0.7],
          ),
        ),
        child: Column(
          children: [
            _showAppbar
                ? const SizedBox(
                    height: 60,
                    child: Center(
                      child: Text(
                        "Danh s??ch xe ???? l??n h??ng xong",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(),
            const CustomNavListTitle(
              nameDriver: "T??i x???",
              customer: "Kh??ch h??ng",
              status: "Tr???ng th??i",
              height: 60,
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getTrackinglv4(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var items = snapshot.data as List<Tracking>;
                    return items.isNotEmpty
                        ? ListView.builder(
                            itemCount: items.length,
                            itemBuilder: ((context, index) {
                              int statusChecking =
                                  items[index].statustracking!.length;

                              return CustomTitle(
                                  Stt: "${index + 1}",
                                  nameDriver:
                                      "${items[index].formIns!.clientInformation!.name}",
                                  numberPhone:
                                      "${items[index].formIns!.clientInformation!.phone}",
                                  customer:
                                      "${items[index].formIns!.clientInformation!.companyname}",
                                  status:
                                      "${items[index].statustracking![statusChecking - 1].name}");
                            }),
                          )
                        : const Center(
                            child: Text("Kh??ng c?? xe"),
                          );
                  }
                  return const Center(
                      child: CircularProgressIndicator(
                          color: Colors.orangeAccent));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
