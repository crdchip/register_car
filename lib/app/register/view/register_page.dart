import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:register_driver_car/app/login/controller/login_controller.dart';
import 'package:register_driver_car/app/register/controller/register_controller.dart';
import 'package:register_driver_car/app/register/view/register_screen_clients.dart';
import 'package:register_driver_car/app/register/view/register_screen_drivers.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String routes = "/login";

  bool obscureText = true;
  var registerController = RegisterController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => const SafeArea(
        child: RegisterScreenDriver(),
      ),
    );
  }
}
