import 'package:flutter/material.dart';

class CheckboxProduct extends StatefulWidget {
  const CheckboxProduct(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.onChanged1,
      this.value,
      this.value1});
  final String title;
  final Function(bool?)? onChanged;
  final Function(bool?)? onChanged1;
  final bool? value;
  final bool? value1;

  @override
  State<CheckboxProduct> createState() => _CheckboxProductState();
}

class _CheckboxProductState extends State<CheckboxProduct> {
  bool isCheckProduct = false;
  bool isCheckNotProduct = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Row(
            children: [
              Column(
                children: [
                  const Text("Có"),
                  Checkbox(
                    onChanged: widget.onChanged,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.orange.withOpacity(.32);
                      }
                      return Colors.orange;
                    }),
                    value: widget.value,
                  )
                ],
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              Column(
                children: [
                  const Text("Không có"),
                  Checkbox(
                    onChanged: widget.onChanged1,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.orange.withOpacity(.32);
                      }
                      return Colors.orange;
                    }),
                    value: widget.value1,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
