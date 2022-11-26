import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/sercurity_page/controller/sercurity_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class SercurityFinalDetailsScreen extends StatefulWidget {
  const SercurityFinalDetailsScreen({super.key});

  @override
  State<SercurityFinalDetailsScreen> createState() =>
      _SercurityFinalDetailsScreenState();
}

class _SercurityFinalDetailsScreenState
    extends State<SercurityFinalDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null && Get.arguments is Trackinglv0) {
      print("oke");
    }
    // print("object");
  }

  var items = Get.arguments as Trackinglv0;
  final String routes = "/sercurity_final_details_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: Text("Chi tiết xe "),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Center(
                child: Text("${items.formIns!.clientInformation!.name}"),
              ),
            ),
            Positioned(
              height: 60,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.amber,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                  ),
                  onPressed: () {
                    setState(() {
                      controller.putTrackinglv5(items.id);
                    });
                  },
                  child: const Text(
                    "Xác nhận",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
