import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/register/model/driver.dart';

class ShowInformationPage extends StatefulWidget {
  const ShowInformationPage({Key? key, this.drivers}) : super(key: key);
  final Drivers? drivers;

  @override
  State<ShowInformationPage> createState() => _ShowInformationPageState();
}

class _ShowInformationPageState extends State<ShowInformationPage> {
  final String routes = "/show_infor";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text("Thông tin đã đăng ký"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: size.height * 0.1, child: Text("${arg.company}")),
              SizedBox(
                  height: size.height * 0.1, child: Text("${arg.vehicle}")),
              SizedBox(
                  height: size.height * 0.1, child: Text("${arg.numberCar}")),
              SizedBox(
                  height: size.height * 0.1, child: Text("${arg.timeReal}")),
            ],
          ),
        ),
      ),
    );
  }
}
