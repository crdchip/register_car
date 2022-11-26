import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/customers/controller/customer_controller.dart';
import 'package:register_driver_car/app/customers/model/list_driver_company_model.dart';
import 'package:register_driver_car/app/customers/view/details_list_driver.dart';
import 'package:register_driver_car/config/routes/pages.dart';

class ListDriverScreen extends StatefulWidget {
  const ListDriverScreen({super.key});

  @override
  State<ListDriverScreen> createState() => _ListDriverScreenState();
}

class _ListDriverScreenState extends State<ListDriverScreen> {
  final String routes = "/list_driver_screen";

  var _customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<ListDriverCompanyModel>;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.toNamed("/details_list_driver",
                            arguments: items[index] as ListDriverCompanyModel);
                      },
                      leading: _urlIamge(
                          "https://i.pinimg.com/736x/c8/d0/c9/c8d0c9ecf1324757eda4f815543cba64.jpg"),
                      title: Text("${items[index].clientCompany!.name}"),
                      subtitle: Text("${items[index].clientCompany!.email}"),
                      trailing: items[index].clientCompany!.status == true
                          ? const Icon(
                              Icons.adjust,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.adjust,
                              color: Colors.red,
                            ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
            future: _customerController.getDriverCompany(),
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
}
