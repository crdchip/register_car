import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/tallymans/controller/tallyman_controller.dart';
import 'package:register_driver_car/config/model/tracking/form_tracking.dart';

class TallymanWorkingDetailsScreen extends StatefulWidget {
  const TallymanWorkingDetailsScreen({super.key});

  @override
  State<TallymanWorkingDetailsScreen> createState() =>
      _TallymanWorkingDetailsScreenState();
}

class _TallymanWorkingDetailsScreenState
    extends State<TallymanWorkingDetailsScreen> {
  final String routes = "/tallyman_working_details_screen";
  var tallymanController = Get.put(TallyManController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.arguments != null && Get.arguments is Trackinglv0) ;
  }

  var items = Get.arguments as Trackinglv0;

  @override
  Widget build(BuildContext context) {
    var checkTracking = items.statustracking!.length;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        title: Text("Order Details"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Text("${items.formIns!.clientInformation!.name}"),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // color: Colors.amber,
              height: 100,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        tallymanController.putTrackinglv4(items.id);
                      },
                      child: const Text(
                        "Xác nhận",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
