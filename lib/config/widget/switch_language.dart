import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchLanguage extends StatelessWidget {
  const SwitchLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 70,
      width: size.width,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: const [
                  Icon(
                    Icons.language,
                    color: Color(0xFF535763),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Language",
                      style: TextStyle(
                        color: Color(0xFF535763),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.orangeAccent.withOpacity(0.8)],
                    [Colors.orangeAccent.withOpacity(0.8)],
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey[200],
                  inactiveFgColor: const Color(0xFF535763),
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['VI', 'ENG'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
