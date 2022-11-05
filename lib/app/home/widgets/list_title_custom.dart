import 'package:flutter/material.dart';

class CustomListTitle extends StatefulWidget {
  const CustomListTitle(
      {Key? key,
      required this.numberCar,
      required this.nameDriver,
      required this.customer,
      required this.company,
      required this.statusProfuct})
      : super(key: key);

  final String numberCar;
  final String nameDriver;
  final String customer;
  final String company;
  final String statusProfuct;

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: const Center(child: Text("1")),
              )),
          const VerticalDivider(
            // width: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: getLeading(),
              )),
          const VerticalDivider(
            // width: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Expanded(
              flex: 4,
              child: Container(
                child: getTitle(),
              )),
          const VerticalDivider(
            // width: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Expanded(
              flex: 3,
              child: Container(
                child: getTraining(),
              )),
        ],
      ),
    );
  }

  Widget getLeading() {
    return Center(
      child: Column(
        children: [
          // Số xe
          Expanded(
            flex: 1,
            child: Text(
              widget.numberCar,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          //Tên tài xế
          Expanded(
            flex: 1,
            child: Text(
              widget.nameDriver,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  Widget getTitle() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Số xe
          Expanded(
            flex: 1,
            child: Text(widget.customer),
          ),
          //Tên tài xế
          Expanded(
            flex: 1,
            child: Text(widget.company),
          )
        ],
      ),
    );
  }

  Widget getTraining() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Số xe
          Expanded(
            flex: 1,
            child: Center(child: Text(widget.statusProfuct)),
          ),
          //Tên tài xế
        ],
      ),
    );
  }
}
