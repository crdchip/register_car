import 'package:flutter/material.dart';

class SearchNavbar extends StatefulWidget {
  const SearchNavbar(
      {super.key,
      required this.searchController,
      required this.hintText,
      required this.hintColor});
  final TextEditingController searchController;
  final String hintText;
  final Color hintColor;

  @override
  State<SearchNavbar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchNavbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        controller: widget.searchController,
        decoration: InputDecoration(
          // label: Text("Hello"),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: 16,
          ),
          hintTextDirection: TextDirection.ltr,
          contentPadding: const EdgeInsets.only(top: 5),
        ),
      ),
    );
  }
}
