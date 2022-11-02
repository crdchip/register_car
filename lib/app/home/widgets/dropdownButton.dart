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
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            isExpanded: true,
            hint: const Text(
              'Choose a vehicle',
              style: TextStyle(fontSize: 14),
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
            ),
            items: widget.items,
            validator: (value) {
              if (value == null) {
                return 'Please Choose a vehicle.';
              }
            },
            onChanged: widget.onChanged,
            // (value) {
            //   //Do something when changing the item if you want.
            //   selectedValue = value;
            // },
            onSaved: widget.onSaved,
            // (value) {
            //   selectedValue = value.toString();
            // },
          ),
        )
      ],
    );
  }
}
