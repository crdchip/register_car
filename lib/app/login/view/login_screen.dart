import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:register_driver_car/app/login/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String routes = "/login_screen";

  final LoginController _loginController = LoginController();

  bool obscureText = true;

  bool login = true;

  // void _fetchData(BuildContext context) async {
  //   // show the loading dialog
  //   showDialog(
  //       // The user CANNOT close this dialog  by pressing outsite it
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (_) {
  //         return Dialog(
  //           // The background color
  //           backgroundColor: Colors.white,

  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 20),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 // The loading indicator
  //                 CircularProgressIndicator(
  //                     color: Colors.orangeAccent.withOpacity(0.4)),
  //                 const SizedBox(height: 15),
  //                 // Some text
  //                 Text('Loading...',
  //                     style: TextStyle(
  //                         color: Colors.orangeAccent.withOpacity(0.4)))
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //   // Tính toán không đồng bộ của bạn ở đây (tìm nạp dữ liệu từ API, xử lý tệp, chèn thứ gì đó vào cơ sở dữ liệu, v.v.)
  //   await Future.delayed(const Duration(seconds: 3));
  //   // Đóng hộp thoại theo chương trình
  //   Get.back();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: getBody(size, context),
        ),
      ),
    );
  }

  Widget getBody(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: size.height,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(
                    "assets/images/background.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.width * 0.05),
            Container(
              height: size.height * 0.1,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(
                    "assets/images/logo@2x.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
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
            buttonForm(
              size,
              () async {
                // _fetchData(context);
                _loginController.loginDrivers(
                  _loginController.accountController.text,
                  _loginController.passController.text,
                );
              },
            ),
            Expanded(child: Container())
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
        border:
            Border.all(width: 1, color: Colors.orangeAccent.withOpacity(0.3)),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 60,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 20),
          isDense: true,
          hintText: text,
          iconColor: Colors.orangeAccent.withOpacity(0.4),
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
        border:
            Border.all(width: 1, color: Colors.orangeAccent.withOpacity(0.3)),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 60,
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
        color: Colors.orangeAccent.withOpacity(0.8),
        border:
            Border.all(width: 1, color: Colors.orangeAccent.withOpacity(0.4)),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      width: size.width * 0.9,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
