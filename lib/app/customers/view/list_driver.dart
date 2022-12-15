import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';

class ListDriverScreen extends StatefulWidget {
  const ListDriverScreen({super.key});

  @override
  State<ListDriverScreen> createState() => _ListDriverScreenState();
}

class _ListDriverScreenState extends State<ListDriverScreen> {
  final String routes = "/list_driver_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orangeAccent.withOpacity(0.4),
                Colors.white.withOpacity(0.4)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.4, 0.9],
            ),
          ),
          height: size.height,
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<ListDriverCompanyModel>;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    int id = items[index].clientCompany!.id!.toInt();
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () {
                          // getDialog();
                          if (items[index].clientCompany!.status == true) {
                            controller.postStatusS(id);
                          } else {
                            Get.defaultDialog(
                              middleText: "Tài xế chưa đăng ký phiếu",
                              textConfirm: "Xác nhận",
                              confirmTextColor: Colors.white,
                              backgroundColor: Colors.white,
                              onConfirm: () {
                                Get.back();
                              },
                              buttonColor: Colors.orangeAccent.withOpacity(0.4),
                            );
                          }
                        },
                        leading: _urlIamge(
                            "https://i.pinimg.com/736x/c8/d0/c9/c8d0c9ecf1324757eda4f815543cba64.jpg"),
                        title: Text(
                          "${items[index].clientCompany!.name}",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "${items[index].clientCompany!.email}",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                        trailing: items[index].clientCompany!.status == true
                            ? const Icon(
                                Icons.adjust,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.adjust,
                                color: Colors.red,
                              ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(color: Colors.orangeAccent),
              );
            }),
            future: controller.getDriverCompany(),
          ),
        ),
      ),
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

  void getDialog() {
    Get.defaultDialog(
      title: "Loading",
      confirm: CircularProgressIndicator(
        color: Colors.orangeAccent.withOpacity(0.7),
      ),
      middleText: "",
      textConfirm: null,
      confirmTextColor: Colors.white,
      backgroundColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
      buttonColor: Colors.orangeAccent.withOpacity(0.4),
    );
  }
}
