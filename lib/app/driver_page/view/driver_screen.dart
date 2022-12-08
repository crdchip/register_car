import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/driver_page/controller/driver_controller.dart';
import 'package:register_driver_car/config/widget/checkbox.dart';
import 'package:register_driver_car/config/widget/dropdownButton.dart';
import 'package:register_driver_car/config/widget/form_button_bottom.dart';
import 'package:register_driver_car/config/widget/text_form.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({
    super.key,
  });

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  final String routes = "/driver_screen";
  final DriverController _driverController = Get.put(DriverController());

  bool isCheckProduct = false;
  bool isCheckNotProduct = true;
  String valueTime = "";

  final List<Map<String, dynamic>> genderItems = [
    {"value": "tai", "name": "Xe tải"},
    {"value": "con", "name": "Xe container"},
  ];
  final List<Map<String, dynamic>> idTeamItems = [
    {'value': "DN", "name": "Doanh nghiệp"},
    {'value': "NN", "name": "Tư nhân"},
    {'value': "TN", "name": "Nhà nước"},
  ];

  final List<Map<String, dynamic>> idKho = [
    {"value": "K1", "name": "Kho 1"},
    {"value": "K2", "name": "Kho 2"},
    {"value": "K3", "name": "Kho 3"},
    {"value": "K4", "name": "Kho 4"},
    {"value": "K5", "name": "Kho 5"},
  ];

  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top: 15),
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
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Đăng ký phiếu vào",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            //Tài xế

            TextForm(
              title: "Tài xế",
              controller: _driverController.nameDriver,
              hintText: "Nguyễn Văn A",
              icon: Icons.abc,
            ),
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
            //Biển số xe

            TextForm(
              title: "Biển số xe",
              controller: _driverController.numberCar,
              hintText: "61H-63 456321",
              icon: Icons.abc,
            ),

            //check xem có hàng hóa k
            // checkboxProduct(size, "Hàng hóa"),
            CheckboxProduct(
              title: "Hàng hóa",
              onChanged: (bool? value) {
                setState(() {
                  isCheckProduct = value!;
                  isCheckNotProduct = !isCheckProduct;
                });
              },
              value: isCheckProduct,
              onChanged1: (bool? value) {
                setState(() {
                  isCheckNotProduct = value!;
                  isCheckProduct = !isCheckNotProduct;
                });
              },
              value1: isCheckNotProduct,
            ),
            //Số công
            isCheckProduct
                ? TextForm(
                    title: "Số công 1",
                    controller: _driverController.contNumber1,
                    icon: Icons.abc,
                    hintText: '')
                : Container(),
            //Số seal
            isCheckProduct
                ? TextForm(
                    title: "Số seal 1",
                    controller: _driverController.cont1seal1,
                    icon: Icons.abc,
                    hintText: '')
                : Container(),
            isCheckProduct
                ? TextForm(
                    title: "Số seal 2",
                    controller: _driverController.cont1seal2,
                    icon: Icons.abc,
                    hintText: '')
                : Container(),
            isCheckProduct
                ? TextForm(
                    title: "Số seal 3",
                    controller: _driverController.cont1seal3,
                    icon: Icons.abc,
                    hintText: '')
                : Container(),
            //form chọn ngày tháng
            formDate(size, "Ngày/tháng vào"),
            //Nút submit
            ButtonFormBottom(
              onPressed: () {
                setState(() {
                  postRegis();
                  print("oke");
                });
              },
              text: "Đăng ký",
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget formDate(Size size, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width * 0.1),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.only(left: size.width * 0.1),
          width: size.width * 0.8,
          height: 60,
          child: DateTimePicker(
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: Colors.white,
            ),
            type: DateTimePickerType.dateTimeSeparate,
            dateMask: 'd MMM, yyyy',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2100),
            icon: const Icon(Icons.event),
            dateLabelText: 'Date',
            timeLabelText: "Hour",
            // selectableDayPredicate: (date) {
            //   // Disable weekend days to select from the calendar
            //   if (date.weekday == 7) {
            //     return false;
            //   }

            //   return true;
            // },
            onChanged: (val) {
              setState(() {
                valueTime = val;
              });
            },
            onSaved: (val) {
              setState(() {
                if (kDebugMode) {
                  print(val);
                }
              });
            },
            validator: (val) {
              setState(() {
                valueTime = val!;
              });
              return null;
            },
          ),
        )
      ],
    );
  }

  postRegis() {
    return _driverController.postRegisterCar(
      selectedTeamCar.toString(),
      1,
      selectedCar.toString(),
      "string",
      valueTime,
      selectedWarehome.toString(),
      // "", "", "", "",
      _driverController.contNumber1.text,
      _driverController.cont1seal1.text,
      _driverController.cont1seal2.text,
      _driverController.cont1seal3.text,
      "",
      "",
      "",
      "",
    );
  }
}
