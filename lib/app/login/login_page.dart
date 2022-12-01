import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:register_driver_car/app/login/controller/login_controller.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String routes = "/login_page";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
