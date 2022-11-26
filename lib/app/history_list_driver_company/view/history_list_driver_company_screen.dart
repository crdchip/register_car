import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/history_list_driver_company/controller/history_list_driver_company_controller.dart';
import 'package:register_driver_car/app/history_list_driver_company/model/history_list_driver_company_model.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class HistoryListDriverCompanyScreen extends StatefulWidget {
  const HistoryListDriverCompanyScreen({super.key});

  @override
  State<HistoryListDriverCompanyScreen> createState() =>
      _HistoryListDriverCompanyScreenState();
}

class _HistoryListDriverCompanyScreenState
    extends State<HistoryListDriverCompanyScreen> {
  final String routes = "/history_list_driver_company_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HistoryListDriverCompanyController>(
      init: HistoryListDriverCompanyController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(5),
            child: FutureBuilder(
              future: controller.getListFormCompany(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as List<ListFormCompany>;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAILS_HISTORY_LIST_DRIVER_COMPANY_SCREEN,
                            arguments: items[index],
                          );
                        },
                        leading: _urlIamge(
                            "https://i.pinimg.com/736x/c8/d0/c9/c8d0c9ecf1324757eda4f815543cba64.jpg"),
                        title: Text("${items[index].clientInformation!.name}"),
                        subtitle:
                            Text("${items[index].clientInformation!.phone}"),
                      );
                    }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _urlIamge(String src) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.amber,
        image: DecorationImage(
          image: Image.network(src).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
