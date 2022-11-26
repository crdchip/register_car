import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/driver_page/view/driver_page.dart';

class DriverDetailsPage extends StatefulWidget {
  const DriverDetailsPage({super.key});

  @override
  State<DriverDetailsPage> createState() => _DriverDetailsPageState();
}

class _DriverDetailsPageState extends State<DriverDetailsPage> {
  bool checkCont2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Thông tin đã đăng ký"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => DriverPage());
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textForm(size, "Đội xe", "Nhà nước"),
                  textForm(size, "Tài xế", "Nguyễn Văn Cừ"),
                ],
              ),

              horizontalLine(size),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: textForm(size, "Loại xe", "Container"),
                  ),
                  Expanded(
                    flex: 1,
                    child: textForm(size, "Kho", "Kho 2"),
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              horizontalLine(size),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: textForm(size, "Số công 1", "654321HA45"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        textForm(size, "Số công 1", "654321HA45"),
                        const SizedBox(height: 10),
                        textForm(size, "Số công 2", "36524HYS65"),
                        const SizedBox(height: 10),
                        textForm(size, "Số công 3", "654HJK5642"),
                      ],
                    ),
                  ),
                ],
              ),
              checkCont2 ? horizontalLine(size) : Container(),
              checkCont2
                  ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: textForm(size, "Số công 2", "654321HA45"),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              textForm(size, "Số công 1", "654321HA45"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 2", "36524HYS65"),
                              const SizedBox(height: 10),
                              textForm(size, "Số công 3", "654HJK5642"),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              horizontalLine(size),
              Row(
                children: [
                  textForm(size, "Ngày/tháng", "19/11/2022"),
                  textForm(size, "Giờ vào", "12:45 AM"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textForm(Size size, String title, String text) {
    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
      // color: Colors.blueAccent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget horizontalLine(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Divider(
        height: 5,
        indent: size.width * 0.05,
        endIndent: size.width * 0.05,
        color: Colors.black.withOpacity(0.4),
        thickness: 2,
      ),
    );
  }
}
