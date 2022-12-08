import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/widget/text_feilds.dart';
import "package:intl/intl.dart";

class ListFormDriverDetailsScreen extends StatefulWidget {
  const ListFormDriverDetailsScreen({super.key});

  @override
  State<ListFormDriverDetailsScreen> createState() =>
      _ListFormDriverDetailsScreenState();
}

class _ListFormDriverDetailsScreenState
    extends State<ListFormDriverDetailsScreen> {
  final String routes = "/list_form_driver_details_screen";

  @override
  Widget build(BuildContext context) {
    var items = Get.arguments;
    var dateIn = items["FormIn"]["timein"];
    var dateOut = items["FormIn"]["timeout"];
    final day = DateFormat("yyyy-MM-dd");
    final hour = DateFormat.jm();
    print("items: $items");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết phiếu"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            CustomText(
                title: "Công ty", content: "${items["Company"]["name"]}"),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    title: "Ngày vào",
                    content: day.format(
                      DateTime.parse(dateIn),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    title: "Giờ vào",
                    content: hour.format(
                      DateTime.parse(dateIn),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomText(
                    title: "Ngày ra",
                    content: day.format(
                      DateTime.parse(dateOut),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomText(
                    title: "Giờ ra",
                    content: hour.format(
                      DateTime.parse(dateOut),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
