import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.validator});
  final String title;
  final TextEditingController controller;
  final String? hintText;
  final IconData icon;
  final String Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: size.width * 0.1),
          child: Row(
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black.withOpacity(0.4)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                icon,
                size: 26,
              ),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }
}
