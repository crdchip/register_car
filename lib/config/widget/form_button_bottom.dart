import 'package:flutter/material.dart';

class ButtonFormBottom extends StatelessWidget {
  const ButtonFormBottom(
      {super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orangeAccent.withOpacity(1),
              Colors.white.withOpacity(0.8)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.2, 1],
          ),
          border: Border.all(
            color: Colors.orangeAccent.withOpacity(0.8),
            width: 1,
          ),
        ),
        margin: const EdgeInsets.only(top: 20),
        width: size.width * 0.8,
        height: 60,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey.withOpacity(0.8),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
