import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/login/view/login_screen.dart';
import 'package:register_driver_car/config/data/colors.dart';
import 'package:register_driver_car/config/data/text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.075),
            uploadImage(size),
            SizedBox(height: size.height * 0.05),
            textForm(size, "Name", "Adom Shafi"),
            SizedBox(height: size.height * 0.05),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textForm(size, "BirthDate", "1/11/2001"),
                SizedBox(width: size.width * 0.2),
                textForm(size, "Gender", "Male"),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            textForm(size, "Email", "helloword@gmail.com"),
            SizedBox(height: size.height * 0.05),
            textForm(size, "Phone", "+84582369632"),
            SizedBox(height: size.height * 0.05),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textForm(size, "Country", "BD"),
                SizedBox(width: size.width * 0.2),
                textForm(size, "Zip code", "5696"),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            buttonForm(
              size,
              () {
                print("oke");
                Get.to(() => const LoginScreen());
                // _loginController.loginDrivers(
                //   _loginController.accountController.text,
                //   _loginController.passController.text,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadImage(Size size) {
    return Container(
      width: size.width,
      height: size.width * 0.2,
      // color: Colors.amberAccent,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: size.width * 0.2,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/image_profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1.0),
                  // color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 24,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textForm(Size size, String title, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
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
            "Logout",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
