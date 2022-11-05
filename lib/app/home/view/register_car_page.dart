import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/home/controller/register_car/register_car_controller.dart';
import 'package:register_driver_car/app/home/widgets/dropdownButton.dart';
import 'package:register_driver_car/app/home/widgets/form_date.dart';

class RegisterCarPage extends StatefulWidget {
  const RegisterCarPage({Key? key}) : super(key: key);

  @override
  State<RegisterCarPage> createState() => _RegisterCarPageState();
}

class _RegisterCarPageState extends State<RegisterCarPage> {
  final String routes = "/register_car";

  RegisterCarController _registerController = Get.put(RegisterCarController());
  bool isCheckProduct = true;
  bool isCheckNotProduct = false;

  String valueTime = "";

  final List<Map<String, dynamic>> genderItems = [
    {"value": "tai", "name": "Xe tải"},
    {"value": "con", "name": "Xe container"},
  ];
  final List<Map<String, dynamic>> idTeamItems = [
    {'value': "DN", "name": "Doanh nghiệp"},
    {'value': "TN", "name": "Tư nhân"},
  ];

  final List<Map<String, dynamic>> idKho = [
    {"value": "k1", "name": "Kho 1"},
    {"value": "k2", "name": "Kho 2"},
    {"value": "k3", "name": "Kho 3"},
    {"value": "k4", "name": "Kho 4"},
    {"value": "k5", "name": "Kho 5"},
  ];

  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<RegisterCarController>(
      init: RegisterCarController(),
      builder: (_registerController) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Đăng ký xe ra vào"),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          body: body(size),
        ),
      ),
    );
  }

  Widget body(Size size) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      width: size.width,
      color: Colors.grey.withOpacity(0.2),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Đội xe
              DropdownButton2(
                text: "Đội xe",
                items: idTeamItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item["value"],
                          child: Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  //Do something when changing the item if you want.
                  selectedTeamCar = value;
                },
                onSaved: (value) {
                  selectedTeamCar = value.toString();
                },
              ),
              //Xe
              DropdownButton2(
                text: "Xe",
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item["value"],
                          child: Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  //Do something when changing the item if you want.
                  selectedCar = value;
                },
                onSaved: (value) {
                  selectedCar = value.toString();
                },
              ),
              // Kho
              DropdownButton2(
                text: "Warehome",
                items: idKho
                    .map((item) => DropdownMenuItem<String>(
                          value: item["value"],
                          child: Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  //Do something when changing the item if you want.
                  selectedWarehome = value;
                },
                onSaved: (value) {
                  selectedWarehome = value.toString();
                },
              ),

              formText(
                  size, "Biển số xe", _registerController.numberCar, Icons.abc),
              //check xem có hàng hóa k
              checkboxProduct(size, "Hàng hóa"),

              isCheckProduct
                  ? formText(size, "Số seal 1", _registerController.cont1seal1,
                      Icons.abc)
                  : Container(),
              isCheckProduct
                  ? formText(size, "Số seal 2 (Nếu có)",
                      _registerController.cont1seal2, Icons.abc)
                  : Container(),
              isCheckProduct
                  ? formText(size, "Số seal 3 (Nếu có)",
                      _registerController.cont1seal3, Icons.abc)
                  : Container(),
              //form chọn ngày tháng
              formDate(size),
              formButton(
                () {
                  _registerController.postRegisterCar(
                    selectedTeamCar.toString(),
                    selectedCar.toString(),
                    "",
                    valueTime,
                    selectedWarehome.toString(),
                    "", "", "", "",
                    // _registerController.contNumber1.text,
                    // _registerController.cont1seal1.text,
                    // _registerController.cont1seal2.text,
                    // _registerController.cont1seal3.text,
                    "",
                    "",
                    "",
                    "",
                  );
                },
                size,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget formDate(Size size) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.only(left: 15),
      width: size.width * 0.8,
      child: DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
        dateMask: 'd MMM, yyyy',
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2100),
        icon: const Icon(Icons.event),
        dateLabelText: 'Date',
        timeLabelText: "Hour",
        selectableDayPredicate: (date) {
          // Disable weekend days to select from the calendar
          return true;
        },
        onChanged: (val) {
          setState(() {
            valueTime = val;
          });
        },
        onSaved: (val) {
          setState(() {
            print(val);
          });
        },
        validator: (val) {
          setState(() {
            valueTime = val!;
          });
          return null;
        },
      ),
    );
  }

  Widget formText(
      Size size, String text, TextEditingController controller, IconData icon) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width * 0.1),
          child: Row(
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter "$text" .';
              }
            },
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(
                  icon,
                  size: 26,
                ),
                isDense: true),
          ),
        ),
      ],
    );
  }

  Widget formButton(VoidCallback onPressed, Size size) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        margin: const EdgeInsets.only(top: 20),
        width: size.width * 0.8,
        height: 60,
        child: const Center(
          child: Text(
            "Đăng ký",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget checkboxProduct(Size size, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text("Có"),
                  Checkbox(
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckProduct = value!;
                        isCheckNotProduct = !isCheckProduct;
                      });
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.orange.withOpacity(.32);
                      }
                      return Colors.orange;
                    }),
                    value: isCheckProduct,
                  )
                ],
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              Column(
                children: [
                  const Text("Không có"),
                  Checkbox(
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckNotProduct = value!;
                        isCheckProduct = !isCheckNotProduct;
                      });
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.orange.withOpacity(.32);
                      }
                      return Colors.orange;
                    }),
                    value: isCheckNotProduct,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
