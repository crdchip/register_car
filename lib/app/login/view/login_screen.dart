import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/dashboard/view/dashboard_page.dart';
import 'package:register_driver_car/app/login/controller/login_controller.dart';
import 'package:register_driver_car/app/register/view/register_page.dart';
import "package:register_driver_car/config/data/colors.dart";
import 'package:register_driver_car/config/data/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String routes = "/login_screen";

  // ignore: unused_field
  final LoginController _loginController = LoginController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_loginController) => Scaffold(
        body: getBody(size, context),
      ),
    );
  }

  Widget getBody(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        // width: size.width,
        decoration: const BoxDecoration(
          color: CustomColor.backgroundLight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage(
                  "assets/images/logo@2x.png",
                ),
                fit: BoxFit.contain,
              )),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            textForm(
              size,
              "Account",
              Icons.person,
              _loginController.accountController,
            ),
            textFormPassword(
              size,
              "Password",
              Icons.lock,
              _loginController.passController,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forgot password ?",
                    style: CustomTextStyle.primaryStyle,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            buttonForm(
              size,
              () {
                print("oke");
                // Get.to(() => const DashBoardPage());
                _loginController.loginDrivers(
                  _loginController.accountController.text,
                  _loginController.passController.text,
                );
              },
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Bạn chưa có tài khoản ?",
                    style: CustomTextStyle.primaryStyle,
                    textAlign: TextAlign.right,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegisterPage());
                    },
                    child: const Text(
                      " Đăng ký tài khoản",
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
        color: Colors.black,
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
        color: Colors.black,
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

  Widget buttonForm(Size size, VoidCallback onPressed) {
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
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
