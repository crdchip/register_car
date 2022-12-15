import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';
import 'package:register_driver_car/config/widget/custom_nav_list_title.dart';

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
                        "Danh sách xe đã lên hàng xong",
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
              nameDriver: "Tài xế",
              customer: "Khách hàng",
              status: "Trạng thái",
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
                              return ListTile(
                                onTap: () {
                                  // Get.toNamed(Routes.TALLYMAN_DETAILS_SCREEN,
                                  //     arguments: items[index]);
                                },
                                title: Text(
                                    "${items[index].formIns!.clientInformation!.name}"),
                                subtitle: Text(
                                    "${items[index].formIns!.clientInformation!.companyname}"),
                                trailing: Text(
                                    "${items[index].statustracking![statusChecking - 1].name}"),
                              );
                            }),
                          )
                        : const Center(
                            child: Text("Không có xe"),
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
