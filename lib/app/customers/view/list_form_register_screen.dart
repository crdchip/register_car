import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/model/list_form_register_model.dart';
import 'package:intl/intl.dart';

class ListFormRegisterScreen extends StatefulWidget {
  const ListFormRegisterScreen({super.key});

  @override
  State<ListFormRegisterScreen> createState() => _ListFormRegisterScreenState();
}

class _ListFormRegisterScreenState extends State<ListFormRegisterScreen> {
  final String routes = "/list_form_register_screen";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
        init: CustomerController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orangeAccent.withOpacity(0.4),
                  Colors.white.withOpacity(0.4)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.4, 0.7],
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      "Danh sách phiếu đã đăng ký",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: controller.getListFormRegister(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        var items =
                            snapshot.data as List<ListFormRegisterModel>;
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              var dateTime = items[index].dataform!.intendTime;
                              var day = DateFormat("yyyy-MM-dd");
                              return Card(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text("$index"),
                                    ),
                                  ),
                                  title: Text(
                                      "${items[index].clientInformation!.name}"),
                                  subtitle: Text(
                                      "${items[index].clientInformation!.phone}"),
                                  trailing: Text(
                                      day.format(DateTime.parse(dateTime!))),
                                ),
                              );
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orangeAccent.withOpacity(0.8),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
        });
  }
}
