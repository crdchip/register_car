import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/app/register/controller/register_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/data/text.dart';

class RegisterScreenClient extends StatefulWidget {
  const RegisterScreenClient({Key? key}) : super(key: key);

  @override
  State<RegisterScreenClient> createState() => _RegisterScreenClientState();
}

class _RegisterScreenClientState extends State<RegisterScreenClient> {
  var registerController = RegisterController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => Scaffold(
        body: getBody(size, context),
      ),
    );
  }

  Widget getBody(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: size.width,
        decoration: const BoxDecoration(
          color: CustomColor.backgroundLight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width * 0.7,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage(
                  "assets/images/logo@2x.png",
                ),
                fit: BoxFit.contain,
              )),
            ),
            textForm(size, "ClientName", Icons.person,
                registerController.clientController),
            textForm(
                size, "Fax", Icons.person, registerController.faxController),
            textForm(size, "Address", Icons.person,
                registerController.addressController),
            textForm(size, "Account", Icons.person,
                registerController.clientController),
            textFormPassword(size, "Password", Icons.lock,
                registerController.passclientController),
            buttonForm(
              size,
              () {
                Get.to(() => const LoginScreen());
                registerController.createClients(
                  registerController.clientNameController.text,
                  registerController.faxController.text,
                  registerController.addressController.text,
                  registerController.clientController.text,
                  registerController.passController.text,
                );
              },
              "Register",
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn đã có tài khoản ?",
                    style: CustomTextStyle.primaryStyle,
                    textAlign: TextAlign.right,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      " Đăng nhập tài khoản",
                      style: CustomTextStyle.blueStyle,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textForm(
      Size size, String text, IconData icon, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 20),
          isDense: true,
          hintText: text,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormPassword(
      Size size, String text, IconData icon, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 20),
          isDense: true,
          hintText: text,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              icon,
              size: 20,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: obscureText
                  ? Icon(
                      Icons.visibility_off,
                      color: Colors.black.withOpacity(0.7),
                    )
                  : Icon(
                      Icons.visibility,
                      color: Colors.black.withOpacity(0.7),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonForm(Size size, VoidCallback onPressed, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.width * 0.025),
      decoration: BoxDecoration(
        color: CustomColor.colorButton,
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 50,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: CustomTextStyle.primaryStyle,
          )),
    );
  }
}
