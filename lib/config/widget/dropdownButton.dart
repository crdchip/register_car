// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownButton2 extends StatefulWidget {
  const DropdownButton2(
      {super.key,
      required this.items,
      required this.text,
      required this.onChanged,
      required this.onSaved});
  final List<DropdownMenuItem<String>> items;
  final String text;
  final Function(String?) onChanged;
  final Function(String?) onSaved;

  @override
  State<DropdownButton2> createState() => _DropdownButton2State();
}

class _DropdownButton2State extends State<DropdownButton2> {
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
                widget.text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: DropdownButtonFormField2(
            selectedItemHighlightColor: Colors.orangeAccent.withOpacity(0.4),
            barrierColor: Colors.orangeAccent.withOpacity(0.4),
            focusColor: Colors.orangeAccent.withOpacity(0.4),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              focusColor: Colors.orangeAccent.withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            isExpanded: true,
            hint: const Text(
              'Choose a vehicle',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 80,
            buttonPadding: const EdgeInsets.only(left: 20, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Colors.orangeAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.4, 0.7],
              ),
            ),
            items: widget.items,
            validator: (value) {
              if (value == null) {
                return 'Please Choose a vehicle.';
              }
              return null;
            },
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
          ),
        )
      ],
    );
  }
}
