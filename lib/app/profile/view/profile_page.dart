import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_driver_car/app/login/model/login_user_token.dart';
import 'package:register_driver_car/app/profile/controller/profile_controller.dart';
import 'package:register_driver_car/config/data/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  // final Client client;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var profileController = Get.put(ProfileController());
  String dataImgae = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) => Scaffold(
        body: getBody(size),
      ),
    );
  }

  Widget getBody(Size size) {
    return SingleChildScrollView(
        child: FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var items = snapshot.data;
          // print("items : ${items["name"]} ");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                uploadImage(size, "${items["dataimg"]}"),
                SizedBox(height: size.height * 0.05),
                textForm(size, "Name", "${items["name"]}"),
                SizedBox(height: size.height * 0.05),
                textForm(size, "Địa chỉ", "${items["address"]}"),
                SizedBox(height: size.height * 0.05),
                textForm(size, "Email", "${items["email"]}"),
                SizedBox(height: size.height * 0.05),
                textForm(size, "Phone", "${items["phone"]}"),
                SizedBox(height: size.height * 0.05),
                buttonForm(
                  size,
                  () {
                    profileController.postLogout();
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      }),
      future: profileController.getUser(),
    ));
  }

  Widget uploadImage(Size size, String image) {
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
              child: getImageBase64(image),
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

  getImageBase64(String image) {
    // print("imgae : $image");
    const Base64Codec base64 = Base64Codec();
    Uint8List bytes = base64.decode(image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.memory(
        bytes,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
    );
  }
}
