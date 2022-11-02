// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter/material.dart';

// class FormDate extends StatefulWidget {
//   const FormDate({
//     super.key,
//     required this.onChanged,
//     required this.onSaved,
//     required this.validator,
//   });
//   final Function(String?) onChanged;
//   final Function(String?) onSaved;
//   final Function(String) validator;

//   @override
//   State<FormDate> createState() => _FormDateState();
// }

// class _FormDateState extends State<FormDate> {
//   // String valueTime = "";
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(width: 1, color: Colors.black),
//           borderRadius: BorderRadius.circular(20.0)),
//       padding: const EdgeInsets.only(left: 15),
//       width: size.width * 0.8,
//       child: DateTimePicker(
//         type: DateTimePickerType.dateTimeSeparate,
//         dateMask: 'd MMM, yyyy',
//         initialValue: DateTime.now().toString(),
//         firstDate: DateTime(2022),
//         lastDate: DateTime(2100),
//         icon: const Icon(Icons.event),
//         dateLabelText: 'Date',
//         timeLabelText: "Hour",
//         selectableDayPredicate: (date) {
//           // Disable weekend days to select from the calendar
//           if (date.weekday == 6 || date.weekday == 7) {
//             return false;
//           }

//           return true;
//         },
//         onChanged: widget.onChanged,
        
//         onSaved: widget.onSaved,
//         validator: widget.validator,
//       ),
//     );
//   }
// }
