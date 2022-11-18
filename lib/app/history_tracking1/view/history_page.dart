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
              body: HistorySercurityScreen(
                  scrollController: _scrollController, arg: arg.toString()),
            ),
          )),
    );
  }

  // Widget body(Size size, String arg) {
  //   return Stack(
  //     children: [
  //       FutureBuilder(
  //         future: historyTracking1Controller.getTrackinglv1(),
  //         builder: ((context, snapshot) {
  //           if (snapshot.hasData) {
  //             var items = snapshot.data as List<Trackinglv0>;
  //             print("items : ${items.length + 1}");

  //             return ListView.builder(
  //               controller: _scrollController,
  //               scrollDirection: Axis.vertical,
  //               itemCount: items.length + 1,
  //               itemBuilder: (context, index) {
  //                 // print("items: ${items[index].id}");
  //                 return index == 0
  //                     ? const CustomNavListTitle(
  //                         height: 60,
  //                         // nameDriver: "",
  //                         nameDriver: 'Tài xế',
  //                         customer: "Khánh Hàng",
  //                         status: "Trạng thái",
  //                       )
  //                     : InkWell(
  //                         onTap: () {
  //                           setState(() {
  //                             Get.to(() => HistoryDeatailSercurityScreen(
  //                                   dataform:
  //                                       items[index - 1].formIns!.dataform,
  //                                   tracking0: items[index - 1],
  //                                   linesId: int.parse(arg),
  //                                 ));
  //                           });
  //                         },
  //                         child: CustomListTitle(
  //                           Stt: '$index',
  //                           image:
  //                               "${items[index - 1].formIns!.clientInformation!.imgdata}",
  //                           nameDriver:
  //                               '${items[index - 1].formIns!.clientInformation!.name}',
  //                           numberPhone:
  //                               '${items[index - 1].formIns!.clientInformation!.phone}',
  //                           customer:
  //                               '${items[index - 1].formIns!.clientInformation!.companyname}',
  //                           status:
  //                               '${items[index - 1].statustracking![1].name}',
  //                         ),
  //                       );
  //               },
  //             );
  //           }
  //           return Container();
  //         }),
  //       ),
  //       Positioned(
  //           top: -6,
  //           child: CustomNavListTitle(
  //             height: _showAppbar ? 60 : 0,
  //             nameDriver: "Tên tài xế",
  //             customer: "Khánh Hàng",
  //             status: "Trạng thái",
  //           ))
  //     ],
  //   );
  // }

  // Widget uploadImage(Size size, String image) {
  //   return Container(
  //     width: size.width,
  //     height: size.width * 0.2,
  //     // color: Colors.amberAccent,
  //     child: Center(
  //       child: Stack(
  //         children: [
  //           Container(
  //             height: size.width * 0.2,
  //             width: size.width * 0.2,
  //             child: getImageBase64(image),
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             right: 0,
  //             child: Container(
  //               height: 25,
  //               width: 25,
  //               decoration: BoxDecoration(
  //                 // border: Border.all(width: 1.0),
  //                 // color: Colors.amberAccent,
  //                 borderRadius: BorderRadius.circular(100.0),
  //               ),
  //               child: const Center(
  //                 child: Icon(
  //                   Icons.add_a_photo,
  //                   size: 24,
  //                   color: Colors.blueGrey,
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // getImageBase64(String image) {
  //   // print("imgae : $image");
  //   const Base64Codec base64 = Base64Codec();
  //   Uint8List bytes = base64.decode(image);
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(100.0),
  //     child: Image.memory(
  //       bytes,
  //       width: 50,
  //       height: 50,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }
}
