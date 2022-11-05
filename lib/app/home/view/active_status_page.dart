import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/active_status/active_status_controller.dart';
import 'package:register_driver_car/app/home/view/detail_status_page.dart';
import 'package:register_driver_car/app/home/widgets/list_title_custom.dart';

class ActiveStatusPage extends StatefulWidget {
  const ActiveStatusPage({Key? key}) : super(key: key);

  @override
  State<ActiveStatusPage> createState() => _ActiveStatusPageState();
}

class _ActiveStatusPageState extends State<ActiveStatusPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ActiveStatusController>(
      init: ActiveStatusController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Tình trạng bãi để xe"),
        ),
        body: body(size),
      ),
    );
  }

  Widget body(Size size) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return index == 0
            ? const ListTile(
                leading: Text("Số xe"),
                title: Text("Khách Hàng"),
                trailing: Text("Trạng thái"),
              )
            : InkWell(
                onTap: () {
                  Get.to(() => const DetailStatusPage());
                },
                child: const CustomListTitle(
                  company: 'Công ty việt á',
                  customer: 'Hà thị Hoa',
                  nameDriver: 'Cao văn cừ',
                  numberCar: '93H-154326',
                  statusProfuct: 'Đang lên hàng',
                ),
              );
      },
      itemCount: 20,
    );
  }
}
